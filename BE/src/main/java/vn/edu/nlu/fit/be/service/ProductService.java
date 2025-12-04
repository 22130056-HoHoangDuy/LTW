package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.dao.ProductDao;

import java.util.List;

public class ProductService {
    ProductDao pdao = new ProductDao();

    public List<Product> getListProduct() {
        return pdao.getListProduct();
    }

    //Redirect to product detail
    public Product getProductById(int id) {
        return pdao.getProductById(id);
    }

    //Filter products
    public List<Product> getProductsByCategory(int categoryId) {
        return pdao.getProductsByCategory(categoryId);
    }
}
