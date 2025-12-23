package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.Brand;
import java.util.List;

public class BrandDao extends BaseDao {
    public List<Brand> getBrands() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM brands").mapToBean(Brand.class).list());
    }
    public Brand getBrandById(int id) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM brands WHERE brand_id = :id")
                        .bind("id",id)
                        .mapToBean(Brand.class)
                        .findFirst()
                        .orElse(null));
    }
}
