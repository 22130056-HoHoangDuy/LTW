package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.StockProduct;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class StockProductDao {
    public List<StockProduct> getStockProducts() {
        List<StockProduct> list = new ArrayList<>();

        // Tạo thời gian hiện tại
        Timestamp now = new Timestamp(System.currentTimeMillis());

        // Constructor: stockProductId, product, stock, productId, stockId, date, soldQty, totalQty
        StockProduct sp1 = new StockProduct(1, 1, 1, now, 10, 100);
        StockProduct sp2 = new StockProduct(2, 2, 1, now, 5, 50);
        StockProduct sp3 = new StockProduct(3, 3, 1, now, 12, 110);
        StockProduct sp4 = new StockProduct(4, 4, 1, now, 8, 90);
        StockProduct sp5 = new StockProduct(5, 5, 1, now, 6, 80);
        StockProduct sp6 = new StockProduct(6, 6, 2, now, 9, 95);
        StockProduct sp7 = new StockProduct(7, 7, 2, now, 11, 105);
        StockProduct sp8 = new StockProduct(8, 8, 2, now, 13, 120);
        StockProduct sp9 = new StockProduct(9, 9, 2, now, 7, 75);
        StockProduct sp10 = new StockProduct(10, 10, 2, now, 5, 70);

        // 4. Thêm vào danh sách
        list.add(sp1);
        list.add(sp2);
        list.add(sp3);
        list.add(sp4);
        list.add(sp5);
        list.add(sp6);
        list.add(sp7);
        list.add(sp8);
        list.add(sp9);
        list.add(sp10);

        return list;
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
        int totalSold = 0;
        for (StockProduct stockProduct : getStockProducts()) {
            if (stockProduct.getStockProductId() == stockProductId) {
                totalSold += stockProduct.getSoldQuantity();
            }
        }
        return totalSold;
    }

}
