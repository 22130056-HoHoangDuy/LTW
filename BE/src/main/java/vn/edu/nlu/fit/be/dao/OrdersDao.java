package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.model.*;

import java.util.List;

public class OrdersDao {

    public List<Orders> getAllOrders() {
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";

        return DBConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Orders o = new Orders();
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

        int rows = DBConnect.get().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("st", status.name())
                        .bind("id", orderId)
                        .execute()
        );

        return rows > 0;
    }
}
