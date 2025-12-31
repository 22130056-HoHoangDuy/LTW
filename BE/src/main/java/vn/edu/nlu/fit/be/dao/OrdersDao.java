package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.*;

import java.util.List;

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


}
