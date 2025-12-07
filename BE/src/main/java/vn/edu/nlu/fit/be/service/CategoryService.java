package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.CategoryDao;
import vn.edu.nlu.fit.be.Model.Category;

import java.util.List;

public class CategoryService {
    CategoryDao categoryDao = new CategoryDao();

    public List<Category> getCategoryList() {
        return categoryDao.getCategoryList();
    }

    public Category getCategoryById(int id) {
        return categoryDao.getCategoryById(id);
    }
}
