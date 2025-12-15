package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.StockProductDao;
import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.dao.ProductDao;

import java.util.*;

public class ProductService {
    private ProductDao pdao = new ProductDao();
    private StockProductDao stockProductDao = new StockProductDao();

    // Redirect to product detail
    public Product getProductById(int id) {
        return pdao.getProductById(id);
    }

    public List<Product> getProducts(Integer categoryId,String brandName, String sortType, String keyword, int pageIndex, int pageSize) {
        // Hàm này đã handle logic null cho cả 3 tham số
        int offset = (pageIndex - 1) * pageSize;
        return pdao.getProductsBy(categoryId,brandName, sortType, keyword, 15, offset);
    }

    public int countTotalProductsBy(Integer categoryId, String keyword) {
        return pdao.countTotalProductsBy(categoryId, keyword);
    }

    public int getTotalSoldQuantity(int productId) {
        return pdao.getTotalSoldQuantity(productId);
    }

    public Map<Integer, Integer> getSoldMap(List<Product> products) {
        Map<Integer, Integer> soldQuantities = new HashMap<>();
        for (Product product : products) {
            int productId = product.getProductId();
            int soldQuantity = getTotalSoldQuantity(productId);
            soldQuantities.put(productId, soldQuantity);
        }
        return soldQuantities;
    }


}
