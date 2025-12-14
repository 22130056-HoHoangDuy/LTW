package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.model.Profile;

public class ProfileDao {

    public int insert(Profile p) {
        return DBConnect.get().withHandle(h ->
                h.createUpdate("""
                    INSERT INTO profiles (full_name, email)
                    VALUES (:name, :email)
                """)
                        .bind("name", p.getFullName())
                        .bind("email", p.getEmail())
                        .executeAndReturnGeneratedKeys("profile_id")
                        .mapTo(Integer.class)
                        .one()
        );
    }
}
