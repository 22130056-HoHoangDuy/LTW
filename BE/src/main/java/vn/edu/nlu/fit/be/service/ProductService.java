package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.StockProductDao;
import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.dao.ProductDao;

import java.util.*;

public class ProductService {
    private ProductDao pdao = new ProductDao();
    private StockProductDao stockProductDao = new StockProductDao();

    public List<Product> getProductList() {
        return pdao.getProductList();
    }

    //Redirect to product detail
    public Product getProductById(int id) {
        return pdao.getProductById(id);
    }

    //Filter products
    public List<Product> getProductsByCategory(int categoryId) {
        return pdao.getProductsBy(categoryId, null, null);
    }

    public List<Product> getBestSellingProducts() {
        return pdao.getProductsBy(null, "best_selling", null);
    }

    public List<Product> searchProducts(String keyword, String sort) {
        return pdao.getProductsBy(null, sort, keyword);
    }

}
