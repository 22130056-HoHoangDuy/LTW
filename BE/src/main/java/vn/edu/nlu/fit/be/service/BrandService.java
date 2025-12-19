package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.BrandDao;
import vn.edu.nlu.fit.be.model.Brand;

import java.util.List;

public class BrandService {
    private BrandDao bd = new BrandDao();

    public List<Brand> getBrands() {
        return bd.getBrands();
    }
}
