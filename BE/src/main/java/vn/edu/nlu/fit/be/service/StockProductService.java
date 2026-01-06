package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.StockProductDao;
import vn.edu.nlu.fit.be.model.Cart;
import vn.edu.nlu.fit.be.model.CartItem.CartItem;
import vn.edu.nlu.fit.be.model.StockProduct;

import java.util.List;

public class StockProductService {
    StockProductDao sd = new StockProductDao();

    public List<StockProduct> getStockProducts() {
        return sd.getStockProducts();
    }

    public boolean checkProductAvailable(int productId) {
        return sd.checkAvailable(productId);
    }

    public boolean checkAvailable(Cart cart) {
        for (CartItem item : cart.getItems()) {
            int productId = item.getProduct().getProductId();
            if (!sd.checkAvailable(productId)) {
                return false;
            }
        }
        return true;
    }

    public boolean updateStockProduct(int productId, int quantity,boolean isSold) {
        Integer stockId = sd.findStockIdWithEnoughQuantity(productId, quantity);
        if (stockId == null) {
            return false; // không kho nào đủ hàng
        }
        return sd.updateStockProduct(productId, stockId, quantity,isSold);
    }
}