package vn.edu.nlu.fit.be.Model;

public class Category {
    String category_name;
    String description ;

    public Category(String category_name, String description) {
        this.category_name = category_name;
        this.description = description;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
