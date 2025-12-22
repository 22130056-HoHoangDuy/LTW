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

    public List<Product> getProductsBy(Integer categoryId, String brandName, String sortType, String keyword, int limit, int offset) {
        StringBuilder sqlQuery = new StringBuilder("SELECT p.*,SUM(sp.sold_quantity) as total_sold");
        sqlQuery.append(" FROM products p");

        //Join table
        sqlQuery.append(" LEFT JOIN stock_products sp ON p.product_id = sp.product_id ");
        sqlQuery.append(" JOIN brands b ON p.brand_id = b.brand_id");
        sqlQuery.append(" WHERE 1=1 "); // để dùng AND cho dễ dàng

        if (categoryId != null) {
            sqlQuery.append(" AND p.category_id = :catId");
        }
        if (keyword != null && !keyword.isEmpty()) {
            sqlQuery.append(" AND LOWER(p.product_name) LIKE LOWER(:keyword)");
        }
        if (brandName != null && !brandName.isEmpty()) {
            sqlQuery.append("AND b.brand_name = :brandName");
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
                    if (brandName != null && !brandName.isEmpty()) {
                        query.bind("brandName", brandName);
                    }
                    //Bind tham số limit và offset cho phân trang
                    query.bind("limit", limit);
                    query.bind("offset", offset);

                    return query.mapToBean(Product.class).list();
                }
        );
    }

    public int countTotalProductsBy(Integer categoryId, String keyword) {
        StringBuilder sqlQuery = new StringBuilder("SELECT COUNT(*) FROM products");

        sqlQuery.append(" WHERE 1=1");

        if (categoryId != null) {
            sqlQuery.append(" AND category_id = :catId");
        }
        if (keyword != null && !keyword.isEmpty()) {
            sqlQuery.append(" AND LOWER(product_name) LIKE LOWER(:keyword)");
        }


        return jdbi.withHandle(handle -> {
                    Query query = handle.createQuery(sqlQuery.toString());
                    if (categoryId != null) {
                        query.bind("catId", categoryId);
                    }
                    if (keyword != null && !keyword.isEmpty()) {
                        query.bind("keyword", "%" + keyword + "%");
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

// ================= ADMIN =================

    public List<Product> getAllForAdmin() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products ORDER BY product_id DESC")
                        .mapToBean(Product.class)
                        .list()
        );
    }

    public void insertProduct(Product p) {
        String sql = """
        INSERT INTO products
        (product_name, product_price, product_img, product_size,
         product_material, brand_id, category_id, created_product)
        VALUES (?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)
    """;

        jdbi.useHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, p.getProductName())
                        .bind(1, p.getProductPrice())
                        .bind(2, p.getProductImg())
                        .bind(3, p.getProductSize())
                        .bind(4, p.getProductMaterial())
                        .bind(5, p.getBrandId())
                        .bind(6, p.getCategoryId())
                        .execute()
        );
    }

    public void updateProduct(Product p) {
        String sql = """
        UPDATE products SET
            product_name = ?,
            product_price = ?,
            product_img = ?,
            product_size = ?,
            product_material = ?,
            brand_id = ?,
            category_id = ?
        WHERE product_id = ?
    """;

        jdbi.useHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, p.getProductName())
                        .bind(1, p.getProductPrice())
                        .bind(2, p.getProductImg())
                        .bind(3, p.getProductSize())
                        .bind(4, p.getProductMaterial())
                        .bind(5, p.getBrandId())
                        .bind(6, p.getCategoryId())
                        .bind(7, p.getProductId())
                        .execute()
        );
    }

    public void deleteProduct(int productId) {
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE product_id = :id")
                        .bind("id", productId)
                        .execute()
        );
    }

}


