package vn.edu.nlu.fit.be.service;

import java.util.List;

public class ProductService {
    ProductDao pdao = new ProductDao();
    public List<vn.edu.nlu.fit.be.Model.Product> getListProduct() {
        return pdao.getListProduct();
    }
}
