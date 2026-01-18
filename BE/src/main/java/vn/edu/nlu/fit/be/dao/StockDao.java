package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.Stock;
import java.util.List;

public class StockDao extends BaseDao {

    // Lấy danh sách tất cả kho
    public List<Stock> getAllStocks() {
        String sql = "SELECT * FROM stocks";
        return jdbi.withHandle(handle -> handle.createQuery(sql).mapToBean(Stock.class).list());
    }

    // Thêm kho mới
    public boolean addStock(Stock stock) {
        String sql = "INSERT INTO stocks (stock_name, stock_address) VALUES (:name, :address)";
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("name", stock.getStockName())
                        .bind("address", stock.getStockAddress())
                        .execute()
        ) > 0;
    }

    // Lấy tổng sản phẩm trong kho (dựa vào stock_products)
    public int getTotalProductsInStock(int stockId) {
        String sql = "SELECT SUM(total_quantity - sold_quantity) FROM stock_products WHERE stock_id = :sid";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("sid", stockId)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0)
        );
    }
}
