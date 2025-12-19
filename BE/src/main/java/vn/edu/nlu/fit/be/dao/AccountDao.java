package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.AccountStatus;

import java.util.List;

public class AccountDao {

    // Lấy danh sách tài khoản
    public List<Account> getAllAccounts() {
        String sql = "SELECT * FROM accounts";

        return DBConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Account acc = new Account();
                            acc.setUserId(rs.getInt("account_id"));
                            acc.setProfileId(rs.getInt("profile_id"));
                            acc.setUserEmail(rs.getString("email"));
                            acc.setUserName(rs.getString("username"));
                            acc.setPassword(rs.getString("password"));
                            acc.setRole(rs.getInt("role"));
                            acc.setStatus(AccountStatus.valueOf(rs.getString("status"))); // Active/UnActive
                            acc.setCreatedAt(rs.getTimestamp("created_at"));
                            return acc;
                        })
                        .list()
        );
    }

    // Tìm kiếm account theo tên hoặc email
    public List<Account> searchAccounts(String keyword) {
        String sql = "SELECT * FROM accounts WHERE username LIKE :kw OR email LIKE :kw";

        return DBConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("kw", "%" + keyword + "%")
                        .map((rs, ctx) -> {
                            Account acc = new Account();
                            acc.setUserId(rs.getInt("account_id"));
                            acc.setProfileId(rs.getInt("profile_id"));
                            acc.setUserEmail(rs.getString("email"));
                            acc.setUserName(rs.getString("username"));
                            acc.setPassword(rs.getString("password"));
                            acc.setRole(rs.getInt("role"));
                            acc.setStatus(AccountStatus.valueOf(rs.getString("status")));
                            acc.setCreatedAt(rs.getTimestamp("created_at"));
                            return acc;
                        })
                        .list()
        );
    }

    // Cập nhật trạng thái Active ↔ UnActive
    public boolean updateStatus(int id, AccountStatus status) {
        String sql = "UPDATE accounts SET status = :status WHERE account_id = :id";

        int rows = DBConnect.get().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("status", status.toString())
                        .bind("id", id)
                        .execute()
        );

        return rows > 0;
    }
}
