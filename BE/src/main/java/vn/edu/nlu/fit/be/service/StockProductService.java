package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.StockProductDao;
import vn.edu.nlu.fit.be.model.StockProduct;

import java.util.List;

public class StockProductService {
    StockProductDao sd = new StockProductDao();

    public List<StockProduct> getStockProducts() {
        return sd.getStockProducts();
    }

    public int getTotalSoldQuantity(int stockProductId) {
        return sd.getTotalSoldQuantity(stockProductId);
    }

}
