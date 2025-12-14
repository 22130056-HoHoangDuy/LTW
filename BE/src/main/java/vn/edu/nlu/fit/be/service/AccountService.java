package vn.edu.nlu.fit.be.service;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.dao.AccountDao;
import vn.edu.nlu.fit.be.dao.ProfileDao;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.AccountStatus;
import vn.edu.nlu.fit.be.model.Profile;

public class AccountService {

    private final AccountDao accountDao = new AccountDao();

    /* ================= REGISTER ================= */
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
                    .bind("status", AccountStatus.ACTIVE.name())
                    .bind("role", 0)
                    .execute();

            return rows > 0;
        });
    }

    /* ================= LOGIN ================= */
    public Account login(String key, String rawPassword) {
        return accountDao.findByUsernameOrEmail(key)
                .filter(a -> a.getStatus() == AccountStatus.ACTIVE)
                .filter(a -> a.getRole() == 0)
                .filter(a -> BCrypt.checkpw(rawPassword, a.getPassword()))
                .orElse(null);
    }
}
