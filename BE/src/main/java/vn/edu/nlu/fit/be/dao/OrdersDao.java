package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class OrdersDao extends BaseDao {

    public int createOrderWithDetails(Order o, List<OrderDetail> details) {
        String insertOrderSql = """
                    INSERT INTO orders
                        (account_id, voucher_id, status, total_amount, delivery_address, payment_method, order_date)
                    VALUES
                        (:accountId, :voucherId, :status, :totalAmount, :deliveryAddress, :paymentMethod, NOW())
                """;

        String insertDetailSql = """
                    INSERT INTO order_details
                        (order_id, product_id, unit_price, quantity)
                    VALUES
                        (:orderId, :productId, :unitPrice, :quantity)
                """;
        return jdbi.inTransaction(handle -> {
            int orderId = handle.createUpdate(insertOrderSql)
                    .bind("accountId", o.getAccountId())
                    .bind("voucherId", o.getVoucherId() == 0 ? null : o.getVoucherId())
                    .bind("status", o.getStatusOrder().name())
                    .bind("totalAmount", o.getTotalAmount())
                    .bind("deliveryAddress", o.getDeliveryAddress())
                    .bind("paymentMethod", o.getPaymentMethod().name())
                    .executeAndReturnGeneratedKeys("order_id")
                    .mapTo(int.class)
                    .one();

            var batch = handle.prepareBatch(insertDetailSql);
            for (OrderDetail d : details) {
                batch.bind("orderId", orderId)
                        .bind("productId", d.getProductId())
                        .bind("unitPrice", d.getUnitPrice())
                        .bind("quantity", d.getQuantity())
                        .add();
            }
            batch.execute();

            return orderId;
        });
    }

    public List<Order> getAllOrders() {
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Order o = new Order();
                            o.setOrderId(rs.getInt("order_id"));
                            o.setAccountId(rs.getInt("account_id"));
                            o.setVoucherId(rs.getInt("voucher_id"));
                            o.setTotalAmount(rs.getInt("total_amount"));
                            o.setDeliveryAddress(rs.getString("delivery_address"));
                            o.setPaymentMethod(
                                    PaymentMethod.valueOf(rs.getString("payment_method"))
                            );
                            o.setStatusOrder(
                                    OrderStatus.valueOf(rs.getString("status"))
                            );
                            o.setOrderDate(rs.getTimestamp("order_date"));
                            return o;
                        })
                        .list()
        );
    }

    public boolean updateStatus(int orderId, OrderStatus status) {
        String sql = "UPDATE orders SET status = :st WHERE order_id = :id";

        int rows = jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("st", status.name())
                        .bind("id", orderId)
                        .execute()
        );

        return rows > 0;
    }
    public int getDiscountAmountFromVoucher(int orderId) {
        String sql = """
        SELECT COALESCE(v.discount_amount, 0) AS discount_amount
        FROM orders o
        LEFT JOIN vouchers v ON v.voucher_id = o.voucher_id
        WHERE o.order_id = :orderId
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("orderId", orderId)
                        .mapTo(int.class)
                        .one()
        );
    }

    public Map<Integer, List<OrderDetail>> getPurchasedProductsByAccount(int accountId) {

        String sql = """
                    SELECT 
                        o.order_id,
                        p.product_id,
                        p.product_name,
                        p.product_price,
                        p.product_image,
                        od.quantity
                    FROM orders o
                    JOIN order_details od ON o.order_id = od.order_id
                    JOIN products p ON p.product_id = od.product_id
                    WHERE o.account_id = :accountId
                    ORDER BY o.order_id DESC
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("accountId", accountId)
                        .map((rs, ctx) -> {
                            OrderDetail d = new OrderDetail();
                            d.setOrderId(rs.getInt("order_id"));
                            d.setProductId(rs.getInt("product_id"));
                            d.setQuantity(rs.getInt("quantity"));

                            Product p = new Product();
                            p.setProductId(rs.getInt("product_id"));
                            p.setProductName(rs.getString("product_name"));
                            p.setProductPrice(rs.getInt("product_price"));
                            p.setProductImage(rs.getString("product_image"));

                            d.setProduct(p);  // Gán Product vào OrderDetail để JSP truy cập được
                            return d;
                        })
                        .list()
                        .stream()
                        .collect(Collectors.groupingBy(OrderDetail::getOrderId))
        );
    }


}
