package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.Product;

import java.util.*;

public class ProductDao extends BaseDao {
    List<Product> products = new ArrayList<>();

    public List<Product> getListProduct() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products").mapToBean(Product.class).list()
        );
    }

    public Product getProductById(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM products WHERE id =:id"))
                .mapToBean(Product.class)
                .findFirst()
                .orElse(null);
    }

    public List<Product> getProductsByCategory(int categoryId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products WHERE category_id = :catId")
                        .bind("catId", categoryId)
                        .mapToBean(Product.class).list()
        );
    }

    public List<Product> getProductBySort(String sort) {
        String orderByClause = "ORDER BY id DESC"; // Mặc định: mới nhất
        switch (sort) {
            case "price_asc":
                orderByClause = "ORDER BY price ASC";
                break;
            case "price_desc":
                orderByClause = "ORDER BY price DESC";
                break;
            case "latest":
                orderByClause = "ORDER BY id DESC";
                break;
            case "oldest":
                orderByClause = "ORDER BY id ASC";
                break;
        }

        String finalQuery = "SELECT * FROM products " + orderByClause;

        return jdbi.withHandle(handle ->
                handle.createQuery(finalQuery)
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public Map<Integer, Integer> getBestSellingProducts() {
        return jdbi.withHandle(handle -> {
            String sql = "SELECT p.id, SUM(sp.sold_quantity) as total_sold " +
                    "FROM products p " +
                    "JOIN stock_products sp ON p.id = sp.product_id " +
                    "GROUP BY p.id";

            // Trả về Map<ProductId, TotalSold>
            return handle.createQuery(sql)
                    .reduceRows(new HashMap<Integer, Integer>(), (map, rowView) -> {
                        map.put(rowView.getColumn("id", Integer.class),
                                rowView.getColumn("total_sold", Integer.class));
                        return map;
                    });
        });
    }
}


