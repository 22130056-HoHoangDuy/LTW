package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.StockProductDao;
import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.dao.ProductDao;

import java.util.*;

public class ProductService {
    private ProductDao pdao = new ProductDao();
    private StockProductDao stockProductDao = new StockProductDao();

    public List<Product> getListProduct() {
        return pdao.getListProduct();
    }

    public List<Product> getProductBySort(String sort) {
        List<Product> res = getListProduct();
        switch (sort) {
            case "price_asc":
                res.sort(Comparator.comparingInt(Product::getProductPrice));
                break;
            case "price_desc":
                res.sort((p1, p2) -> Integer.compare(p2.getProductPrice(), p1.getProductPrice()));
                break;
            case "latest":
                res.sort((p1, p2) -> Integer.compare(p2.getProductId(), p1.getProductId()));
                break;
            case "oldest":
                res.sort(Comparator.comparingInt(Product::getProductId));
                break;
            default:
                break;
        }
        return res;
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
        List<Product> res = getProductsByCategory(categoryId);
        switch (sort) {
            case "price_asc":
                res.sort(Comparator.comparingInt(Product::getProductPrice));
                break;
            case "price_desc":
                res.sort((p1, p2) -> Integer.compare(p2.getProductPrice(), p1.getProductPrice()));
                break;
            case "oldest":
                res.sort(Comparator.comparing(Product::getProductId));
                break;
            case "latest":
                res.sort((p1, p2) -> Integer.compare(p2.getProductId(), p1.getProductId()));
                break;
            default:
                // không sort hoặc sort mặc định
                break;
        }
        return res;
    }

    public Map<Integer, Integer> getBestSellingProducts() {
        Map<Integer, Integer> soldMap = new HashMap<>();
        for (Product product : getListProduct()) {
            int productId = product.getProductId();
            int soldQuantity = stockProductDao.getTotalSoldQuantity(productId);
            soldMap.put(productId, soldQuantity);
        }
        return soldMap;
    }

    public List<Product> sortProductsByHotest(List<Product> products, Map<Integer, Integer> soldMap) {
        Collections.sort(products, (p1, p2) -> {
            int sold1 = soldMap.getOrDefault(p1.getProductId(), 0);
            int sold2 = soldMap.getOrDefault(p2.getProductId(), 0);
            return Integer.compare(sold2, sold1);
        });

        return products;
    }

//    public List<Product> searchProducts(String keyword, String sortType) {
//        List<Product> products = pdao.searchProducts(keyword);
//        if (sortType == null) return products;
//        else {
//            switch (sortType) {
//                case "price_asc":
//                    products.sort(Comparator.comparingInt(Product::getProductPrice));
//                    break;
//                case "price_desc":
//                    products.sort((p1, p2) -> Integer.compare(p2.getProductPrice(), p1.getProductPrice()));
//                    break;
//                case "latest":
//                    products.sort((p1, p2) -> Integer.compare(p2.getProductId(), p1.getProductId()));
//                    break;
//                case "oldest":
//                    products.sort(Comparator.comparing(Product::getProductId));
//                    break;
//                default:
//                    // không sort hoặc sort mặc định
//                    break;
//            }
//            return products;
//        }
//    }
//    public Set<String> getBrands() {
//        return pdao.getBrands();
//    }
}
