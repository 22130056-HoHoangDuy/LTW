package vn.edu.nlu.fit.be.dao;
import vn.edu.nlu.fit.be.model.AccountStatus;
import java.util.List;
import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.model.Account;

import java.util.Optional;

public class AccountDao {
    //tránh lỗi NullPointerException

    public boolean existsByEmail(String email) {
        return DBConnect.get().withHandle(h ->
                h.createQuery("""
                    SELECT 1
                    FROM accounts
                    WHERE email = :email
                """)
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .findOne()
                        .isPresent()
        );
    }

    public Optional<Account> findByUsernameOrEmail(String key) {
        return DBConnect.get().withHandle(h ->
                h.createQuery("""
                    SELECT *
                    FROM accounts
                    WHERE username = :k OR email = :k
                """)
                        .bind("k", key)
                        .mapToBean(Account.class)
                        .findOne()
        );
    }

    public int insert(Account a) {
        return DBConnect.get().withHandle(h ->
                h.createUpdate("""
                    INSERT INTO accounts
                    (profile_id, email, username, password, status, role)
                    VALUES (:pid, :email, :username, :pw, :status, :role)
                """)
                        .bind("pid", a.getProfileId())
                        .bind("email", a.getEmail())
                        .bind("username", a.getUsername())
                        .bind("pw", a.getPassword())
                        .bind("status", a.getStatus().name())
                        .bind("role", a.getRole())
                        .execute()
        );
    }
    public boolean updatePassword(int accountId, String hashedPassword) {
        return DBConnect.get().withHandle(h ->
                h.createUpdate("""
                UPDATE accounts
                SET password = :pw
                WHERE account_id = :id
            """)
                        .bind("pw", hashedPassword)
                        .bind("id", accountId)
                        .execute()
        ) > 0;
    }
    /* ================= Admin ================= */

    public boolean updateStatus(int accountId, AccountStatus status) {
        return DBConnect.get().withHandle(h ->
                h.createUpdate("""
                UPDATE accounts
                SET status = :status
                WHERE account_id = :id
            """)
                        .bind("status", status.name())
                        .bind("id", accountId)
                        .execute()
        ) > 0;
    }

    public List<Account> findAll() {
        return DBConnect.get().withHandle(h ->
                h.createQuery("""
                SELECT *
                FROM accounts
                ORDER BY account_id DESC
            """)
                        .mapToBean(Account.class)
                        .list()
        );
    }

    public List<Account> search(String keyword) {
        String kw = "%" + keyword + "%";
        return DBConnect.get().withHandle(h ->
                h.createQuery("""
                SELECT *
                FROM accounts
                WHERE username LIKE :kw
                   OR email LIKE :kw
                ORDER BY account_id DESC
            """)
                        .bind("kw", kw)
                        .mapToBean(Account.class)
                        .list()
        );
    }

}
