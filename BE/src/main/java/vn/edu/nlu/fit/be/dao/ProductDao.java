package vn.edu.nlu.fit.be.dao;

import org.jdbi.v3.core.statement.Query;
import vn.edu.nlu.fit.be.model.*;

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
                        .bind("id", id)
                        .mapToBean(Product.class)
                        .findOne()
                        .orElse(null))
                ;
    }

    public List<Product> getProductsBy(Integer categoryId, String[] brandNames, String sortType, String keyword, int limit, int offset) {
        StringBuilder sqlQuery = new StringBuilder("SELECT p.*,SUM(sp.sold_quantity) as total_sold");
        sqlQuery.append(" FROM products p");

        //Join table
        sqlQuery.append(" LEFT JOIN stock_products sp ON p.product_id = sp.product_id ");
        sqlQuery.append(" LEFT JOIN brands b ON p.brand_id = b.brand_id");
        sqlQuery.append(" WHERE 1=1 "); // để dùng AND cho dễ dàng

        if (categoryId != null) {
            sqlQuery.append(" AND p.category_id = :catId");
        }
        if (keyword != null && !keyword.isEmpty()) {
            sqlQuery.append(" AND LOWER(p.product_name) LIKE LOWER(:keyword)");
        }
        if (brandNames != null && brandNames.length > 0) {
            sqlQuery.append(" AND b.brand_name IN (<brandNames>)");
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
        sqlQuery.append(" LIMIT :limit OFFSET :offset");
        return jdbi.withHandle(handle -> {
                    Query query = handle.createQuery(sqlQuery.toString());
                    if (categoryId != null) {
                        query.bind("catId", categoryId);
                    }
                    if (keyword != null && !keyword.isEmpty()) {
                        query.bind("keyword", "%" + keyword + "%");
                    }
                    if (brandNames != null && brandNames.length > 0) {
                        query.bindList("brandNames", Arrays.asList(brandNames));
                    }
                    //Bind tham số limit và offset cho phân trang
                    query.bind("limit", limit);
                    query.bind("offset", offset);

                    return query.mapToBean(Product.class).list();
                }
        );
    }

    public int countTotalProductsBy(Integer categoryId, String[] brands, String keyword) {
        StringBuilder sqlQuery = new StringBuilder("SELECT COUNT(p.product_id) FROM products p");
        sqlQuery.append(" LEFT JOIN brands b ON p.brand_id = b.brand_id");
        sqlQuery.append(" WHERE 1=1");

        if (categoryId != null) {
            sqlQuery.append(" AND p.category_id = :catId");
        }
        if (keyword != null && !keyword.isEmpty()) {
            sqlQuery.append(" AND LOWER(p.product_name) LIKE LOWER(:keyword)");
        }
        if (brands != null && brands.length > 0) {
            sqlQuery.append(" AND b.brand_name IN(<brand_name>)");
        }


        return jdbi.withHandle(handle -> {
                    Query query = handle.createQuery(sqlQuery.toString());
                    if (categoryId != null) {
                        query.bind("catId", categoryId);
                    }
                    if (keyword != null && !keyword.isEmpty()) {
                        query.bind("keyword", "%" + keyword + "%");
                    }
                    if (brands != null && brands.length > 0) {
                        query.bindList("brand_name", brands);
                    }
                    return query.mapTo(Integer.class).one();
                }
        );
    }

    public int getTotalSoldQuantity(int productId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT SUM(sold_quantity) FROM stock_products" +
                                " WHERE product_id = :id")
                        .bind("id", productId)
                        .mapTo(Integer.class).one()
        );
    }

    public List<String> getImagesListInProduct(int productId) {
        return jdbi.withHandle(
                handle ->
                        handle.createQuery("SELECT img.product_img FROM product_list_images img" +
                                        " JOIN products p ON img.product_id = p.product_id" +
                                        " WHERE img.product_id =:id")
                                .bind("id", productId)
                                .mapTo(String.class)
                                .list()
        );
    }

    public List<Map<String, Object>> getProductDetails(int productId) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT detail_img, product_description FROM product_details WHERE product_id = :id ORDER BY product_detail_id ASC")
                        .bind("id", productId)
                        .mapToMap()
                        .list()
        );
    }
}


