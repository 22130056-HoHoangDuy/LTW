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

    public boolean updateStockProduct(int productId, int quantity) {
        Integer stockId = sd.findStockIdWithEnoughQuantity(productId, quantity);
        if (stockId == null) {
            return false; // không kho nào đủ hàng
        }
        return sd.reserveProduct(productId, stockId, quantity);
    }

    /**
     * Hoàn lại stock khi hủy đơn hàng (Cancelled)
     * Tăng total_quantity lên
     */
    public boolean restoreStock(int productId, int quantity) {
        Integer stockId = sd.findStockIdWithEnoughQuantity(productId, 0); // Tìm kho có sản phẩm này
        if (stockId == null) {
            // Nếu không tìm thấy, lấy kho đầu tiên có product này
            StockProduct sp = sd.getProductInStock(productId);
            if (sp == null) {
                return false;
            }
            stockId = sp.getStockId();
        }
        return sd.cancelOrder(productId, stockId, quantity);
    }

    /**
     * Cập nhật sold_quantity khi đơn hàng Done
     */
    public boolean updateSoldQuantity(int productId, int quantity) {
        StockProduct sp = sd.getProductInStock(productId);
        if (sp == null) {
            return false;
        }
        return sd.confirmOrder(productId, sp.getStockId(), quantity);
    }
}