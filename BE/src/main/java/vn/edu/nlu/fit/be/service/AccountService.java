package vn.edu.nlu.fit.be.service;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.dao.AccountDao;
import vn.edu.nlu.fit.be.dao.BaseDao;
import vn.edu.nlu.fit.be.dao.ProfileDao;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.AccountStatus;
import vn.edu.nlu.fit.be.model.Profile;
import java.util.List;

import java.util.List;
import java.util.Optional;

public class AccountService extends BaseDao {

    private final AccountDao accountDao = new AccountDao();

    /* ================= Register ================= */
    public boolean register(String userName, String email, String password) {

        if (accountDao.existsByEmail(email)) {
            return false;
        }

        return DBConnect.get().inTransaction(handle -> {

            int profileId = handle.createUpdate("""
                    INSERT INTO profiles (email)
                    VALUES (:email)
                """)
                    .bind("email", email)
                    .executeAndReturnGeneratedKeys("profile_id")
                    .mapTo(Integer.class)
                    .one();

            int rows = handle.createUpdate("""
                    INSERT INTO accounts
                    (profile_id, email, username, password, status, role)
                    VALUES (:pid, :email, :username, :pass, :status, :role)
                """)
                    .bind("pid", profileId)
                    .bind("email", email)
                    .bind("username", userName)
                    .bind("pass", BCrypt.hashpw(password, BCrypt.gensalt()))
                    .bind("status", AccountStatus.Active.name())
                    .bind("role", 0)
                    .execute();

            return rows > 0;
        });
    }

    /* ================= Login ================= */
    public Account login(String key, String rawPassword) {
        return accountDao.findByUsernameOrEmail(key)
                .filter(a -> a.getStatus() == AccountStatus.Active)
                .filter(a -> a.getRole() >= 0)
                .filter(a -> BCrypt.checkpw(rawPassword, a.getPassword()))
                .orElse(null);
    }

    /* ================= ChangePassword ================= */
    public boolean changePassword(int accountId, String oldPassword, String newPassword) {

        Optional<Account> opt = jdbi.withHandle(h ->
                h.createQuery("""
                SELECT *
                FROM accounts
                WHERE account_id = :id
            """)
                        .bind("id", accountId)
                        .mapToBean(Account.class)
                        .findOne()
        );

        if (opt.isEmpty()) return false;

        Account acc = opt.get();

        if (!BCrypt.checkpw(oldPassword, acc.getPassword())) {
            return false;
        }

        String hashed = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        return accountDao.updatePassword(accountId, hashed);
    }
    /* ================= loginWithGoogle ================= */

    public Account loginWithGoogle(String email, String name) {

        Optional<Account> opt = accountDao.findByEmail(email);

        // 1. Đã tồn tại
        if (opt.isPresent()) {
            Account acc = opt.get();

            if (acc.getStatus() != AccountStatus.Active) return null;
            return acc;
        }

        // 2. Chưa tồn tại → tạo account Google
        return DBConnect.get().inTransaction(handle -> {

            int profileId = handle.createUpdate("""
                INSERT INTO profiles (email)
                VALUES (:email)
            """)
                    .bind("email", email)
                    .executeAndReturnGeneratedKeys("profile_id")
                    .mapTo(Integer.class)
                    .one();

            handle.createUpdate("""
                INSERT INTO accounts
                (profile_id, email, username, password, status, role)
                VALUES (:pid, :email, :username, NULL, :status, :role)
            """)
                    .bind("pid", profileId)
                    .bind("email", email)
                    .bind("username", name)
                    .bind("status", AccountStatus.Active.name())
                    .bind("role", 0)
                    .execute();

            return accountDao.findByEmail(email).orElse(null);
        });
    }
    /* ================= Admin ================= */

    public boolean updateStatus(int id, AccountStatus status) {
        return accountDao.updateStatus(id, status);
    }

    public List<Account> getAll() {
        return accountDao.findAll();
    }

    public List<Account> search(String keyword) {
        return accountDao.search(keyword);
    }
}
