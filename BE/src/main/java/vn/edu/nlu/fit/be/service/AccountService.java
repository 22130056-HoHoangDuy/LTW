package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.AccountDao;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.AccountStatus;

import java.util.List;

public class AccountService {

    private AccountDao dao = new AccountDao();

    public List<Account> getAll() {
        return dao.getAllAccounts();
    }

    public List<Account> search(String keyword) {
        return dao.searchAccounts(keyword);
    }

    public boolean updateStatus(int id, AccountStatus status) {
        return dao.updateStatus(id, status);
    }
}
