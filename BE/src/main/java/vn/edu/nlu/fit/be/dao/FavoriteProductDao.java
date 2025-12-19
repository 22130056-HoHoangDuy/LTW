package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.model.FavoriteProduct;

import java.util.List;

public class FavoriteProductDao {
    // 1. Kiểm tra đã yêu thích chưa
    public boolean exists(int accountId, int productId) {
        String sql = """
            SELECT 1
            FROM favorite_products
            WHERE account_id = :aid
              AND product_id = :pid
        """;

        return DBConnect.get().withHandle(h ->
                h.createQuery(sql)
                        .bind("aid", accountId)
                        .bind("pid", productId)
                        .mapTo(Integer.class)
                        .findFirst()
                        .isPresent()
        );
    }

    // 2. Thêm yêu thích
    public int insert(int accountId, int productId) {
        String sql = """
            INSERT INTO favorite_products (account_id, product_id)
            VALUES (:aid, :pid)
        """;

        return DBConnect.get().withHandle(h ->
                h.createUpdate(sql)
                        .bind("aid", accountId)
                        .bind("pid", productId)
                        .execute()
        );
    }

    // 3. Xóa yêu thích
    public int delete(int accountId, int productId) {
        String sql = """
            DELETE FROM favorite_products
            WHERE account_id = :aid
              AND product_id = :pid
        """;

        return DBConnect.get().withHandle(h ->
                h.createUpdate(sql)
                        .bind("aid", accountId)
                        .bind("pid", productId)
                        .execute()
        );
    }

    // 4. Lấy danh sách yêu thích của account
    public List<FavoriteProduct> findByAccountId(int accountId) {
        String sql = """
            SELECT favorite_id  AS favoriteId,
                   account_id   AS accountId,
                   product_id   AS productId,
                   created_at   AS createdAt
            FROM favorite_products
            WHERE account_id = :aid
            ORDER BY created_at DESC
        """;

        return DBConnect.get().withHandle(h ->
                h.createQuery(sql)
                        .bind("aid", accountId)
                        .mapToBean(FavoriteProduct.class)
                        .list()
        );
    }
}
