package vn.edu.nlu.fit.be.dao;

import org.jdbi.v3.core.statement.Query;
import vn.edu.nlu.fit.be.model.Product;

import java.util.*;

public class ProductDao extends BaseDao {
    List<Product> products = new ArrayList<>();

    public List<Product> getProductList() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products").mapToBean(Product.class).list());
    }

    public Product getProductById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products WHERE product_id = :id")
                        .mapToBean(Product.class)
                        .findOne()
                        .orElse(null))
                ;
    }

    public List<Product> getProductsBy(Integer categoryId, String sortType, String keyword) {
        StringBuilder sqlQuery = new StringBuilder("SELECT p.*,SUM(sp.sold_quantity) as total_sold");
        sqlQuery.append(" FROM products p");

        //Join table
        sqlQuery.append(" LEFT JOIN stock_products sp ON p.product_id = sp.product_id ");
        sqlQuery.append(" WHERE 1=1 "); // để dùng AND cho dễ dàng

        if (categoryId != null) {
            sqlQuery.append(" AND p.category_id = :catId");
        }
        if (keyword != null && !keyword.isEmpty()) {
            sqlQuery.append(" AND p.product_name LIKE :keyword");
        }

        // Nhóm theo product id
        sqlQuery.append(" GROUP BY p.product_id");

        if (sortType != null) {
            switch (sortType) {
                case "price_asc":
                    sqlQuery.append(" ORDER BY p.product_price ASC ");
                    break;
                case "price_desc":
                    sqlQuery.append(" ORDER BY p.product_price DESC ");
                    break;
                case "oldest":
                    sqlQuery.append(" ORDER BY p.created_product ASC ");
                    break;
                case "latest":
                    sqlQuery.append(" ORDER BY p.created_product DESC ");
                    break;
                case "best_selling":
                    sqlQuery.append(" ORDER BY total_sold DESC ");
                    break;
                default:
                    sqlQuery.append(" ORDER BY p.product_id DESC ");
            }

        }
        return jdbi.withHandle(handle -> {
                    Query query = handle.createQuery(sqlQuery.toString());
                    if (categoryId != null) {
                        query.bind("catId", categoryId);
                    }
                    if (keyword != null && !keyword.isEmpty()) {
                        query.bind("keyword", "%" + keyword + "%");
                    }
                    return query.mapToBean(Product.class).list();
                }
        );
    }

}


