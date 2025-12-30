package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.*;

import java.util.*;

public class OrderDetailDao extends BaseDao {
    public void insertOrderDetails(int orderId, List<OrderDetail> details) {
        String sql = """
                    INSERT INTO order_detail
                        (order_id, product_id, unit_price, quantity)
                    VALUES
                        (:orderId, :productId, :unitPrice, :quantity)
                """;

        jdbi.useHandle(handle -> {
            var batch = handle.prepareBatch(sql);
            for (OrderDetail d : details) {
                batch.bind("orderId", orderId).bind("productId", d.getProductId()).bind("unitPrice", d.getUnitPrice()).bind("quantity", d.getQuantity()).add();
            }
            batch.execute();
        });
    }

}
