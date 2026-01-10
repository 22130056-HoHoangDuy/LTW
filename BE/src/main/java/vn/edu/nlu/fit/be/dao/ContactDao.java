package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.Contact;
import vn.edu.nlu.fit.be.dao.BaseDao;

public class ContactDao extends BaseDao {
    public int insertContact(Contact contact) {
        String sql = "INSERT INTO contacts (account_id, full_name, phone, email, address, message) " +
                "VALUES (:accountId, :fullName, :phone, :email, :address, :message)";
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bindBean(contact)
                        .execute());
    }
}

