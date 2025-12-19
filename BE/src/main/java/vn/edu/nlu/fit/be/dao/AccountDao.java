package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.AccountStatus;
import java.util.Optional;

import java.util.List;

public class AccountDao {

    // ================= LẤY TẤT CẢ ACCOUNT =================
    public List<Account> getAllAccounts() {
        String sql = """
                SELECT account_id, profile_id, email, username,
                       password, role, status, created_at
                FROM accounts
                """;

        return DBConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Account acc = new Account();
                            acc.setUserId(rs.getInt("account_id"));
                            acc.setProfileId(rs.getInt("profile_id"));
                            acc.setEmail(rs.getString("email"));
                            acc.setUsername(rs.getString("username"));
                            acc.setPassword(rs.getString("password"));
                            acc.setRole(rs.getInt("role"));
                            acc.setStatus(
                                    AccountStatus.valueOf(rs.getString("status").trim().toUpperCase())
                            );
                            acc.setCreatedAt(rs.getTimestamp("created_at"));
                            return acc;
                        })
                        .list()
        );
    }

    // ================= SEARCH ACCOUNT =================
    public List<Account> searchAccounts(String keyword) {
        String sql = """
                SELECT account_id, profile_id, email, username,
                       password, role, status, created_at
                FROM accounts
                WHERE username LIKE :kw OR email LIKE :kw
                """;

        return DBConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("kw", "%" + keyword + "%")
                        .map((rs, ctx) -> {
                            Account acc = new Account();
                            acc.setUserId(rs.getInt("account_id"));
                            acc.setProfileId(rs.getInt("profile_id"));
                            acc.setEmail(rs.getString("email"));
                            acc.setUsername(rs.getString("username"));
                            acc.setPassword(rs.getString("password"));
                            acc.setRole(rs.getInt("role"));
                            acc.setStatus(
                                    AccountStatus.valueOf(rs.getString("status").toUpperCase())
                            );
                            acc.setCreatedAt(rs.getTimestamp("created_at"));
                            return acc;
                        })
                        .list()
        );
    }

    // ================= UPDATE STATUS =================
    public boolean updateStatus(int accountId, AccountStatus status) {
        String sql = """
                UPDATE accounts
                SET status = :status
                WHERE account_id = :id
                """;

        int rows = DBConnect.get().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("status", status.name())
                        .bind("id", accountId)
                        .execute()
        );

        return rows > 0;
    }
    public boolean existsByEmail(String email) {
        String sql = "SELECT COUNT(*) FROM accounts WHERE email = :email";

        return DBConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .one()
        ) > 0;
    }
    public Optional<Account> findByUsernameOrEmail(String key) {
        String sql = """
        SELECT account_id, profile_id, email, username,
               password, role, status, created_at
        FROM accounts
        WHERE username = :key OR email = :key
        LIMIT 1
        """;

        return DBConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("key", key)
                        .map((rs, ctx) -> {
                            Account acc = new Account();
                            acc.setUserId(rs.getInt("account_id"));
                            acc.setProfileId(rs.getInt("profile_id"));
                            acc.setEmail(rs.getString("email"));
                            acc.setUsername(rs.getString("username"));
                            acc.setPassword(rs.getString("password"));
                            acc.setRole(rs.getInt("role"));
                            acc.setStatus(
                                    AccountStatus.valueOf(
                                            rs.getString("status").toUpperCase()
                                    )
                            );
                            acc.setCreatedAt(rs.getTimestamp("created_at"));
                            return acc;
                        })
                        .findOne()
        );
    }

}
