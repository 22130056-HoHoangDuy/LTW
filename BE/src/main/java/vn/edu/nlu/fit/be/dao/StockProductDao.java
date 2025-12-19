package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.StockProduct;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class StockProductDao extends BaseDao {
    public List<StockProduct> getStockProducts() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM stock_products").mapToBean(StockProduct.class).list());
    }

    public StockProduct getProductInStock(int productId) {
        for (StockProduct st : getStockProducts()) {
            if (st.getProductId() == productId) {
                return st;
            }
        }
        return null;
    }

    public int getTotalSoldQuantity(int stockProductId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT SUM(total_quantity) FROM stock_products WHERE stock_product_id = :id")
                        .bind("id", stockProductId)
                        .mapTo(Integer.class)
                        .one()
        );
    }

}
