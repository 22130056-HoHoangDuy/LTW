package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.ProductDao;
import vn.edu.nlu.fit.be.model.Product;

import java.util.List;

public class AdminProductService {

    private final ProductDao productDao = new ProductDao();

    public List<Product> getAllProducts() {
        return productDao.getAllForAdmin();
    }

    public void addProduct(Product product) {
        productDao.insertProduct(product);
    }

    public Product getById(int id) {
        return productDao.getProductById(id);
    }

    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    public void deleteProduct(int productId) {
        productDao.deleteProduct(productId);
    }
}
