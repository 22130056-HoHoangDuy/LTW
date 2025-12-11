package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.dao.ProductDao;

import java.util.List;
import java.util.Map;

public class ProductService {
    ProductDao pdao = new ProductDao();

    public List<Product> getListProduct() {
        return pdao.getListProduct();
    }

    public List<Product> getProductBySort(String sort) {
        return pdao.getProductBySort(sort);
    }

    //Redirect to product detail
    public Product getProductById(int id) {
        return pdao.getProductById(id);
    }

    //Filter products
    public List<Product> getProductsByCategory(int categoryId) {
        return pdao.getProductsByCategory(categoryId);
    }

    public List<Product> getProductsByCategoryAndSort(int categoryId, String sort) {
        return pdao.getProductsByCategoryAndSort(categoryId, sort);
    }
    public Map<Integer, Integer> getBestSellingProducts() {
        return pdao.getBestSellingProducts();
    }
    public List<Product> sortProductsByHotest(List<Product> products, Map<Integer, Integer> soldMap) {
        return pdao.sortProductsByHotest(products, soldMap);
    }
}
