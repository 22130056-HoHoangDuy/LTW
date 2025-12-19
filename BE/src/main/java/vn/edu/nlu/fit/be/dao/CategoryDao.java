package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.DB.DBConnect;
import vn.edu.nlu.fit.be.model.Category;

import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    List<Category> categories = new ArrayList<>();

    public List<Category> getCategoryList() {
        //Category
        Category catNoiThat = new Category(1, "ĐỒ NỘI THẤT", "img/categories/donoithat.png", "Bao gồm bàn học thông minh, ghế chống gù");
        Category catTrangTri = new Category(2, "ĐỒ TRANG TRÍ", "img/categories/dotrangtri.jpg", "Bao gồm rèm trẻ em và tranh treo tường.");
        Category catDoChoi = new Category(3, "ĐỒ CHƠI", "img/categories/dochoi.jpg", "Bao gồm đồ chơi lắp ghép và nhà chơi trẻ em.");

        categories.add(catNoiThat);
        categories.add(catTrangTri);
        categories.add(catDoChoi);

        return categories;
    }

    public Category getCategoryById(int id) {
        for (Category category : getCategoryList()) {
            if (category.getCategoryId() == id) {
                return category;
            }
        }
        return null;
    }

    public List<Category> findAllCategory() {
        String sql = """
                    SELECT category_id        AS categoryId,
                           category_name      AS categoryName,
                           category_image       AS categoryImg,
                           description AS categoryDescription
                    FROM categories
                """;

        return DBConnect.get().withHandle(h ->
                h.createQuery(sql)
                        .mapToBean(Category.class)
                        .list()
        );
    }
}
