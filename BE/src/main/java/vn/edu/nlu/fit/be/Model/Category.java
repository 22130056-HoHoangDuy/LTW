package vn.edu.nlu.fit.be.Model;

public class Category {
    private int categoryId;
    private String categoryName;
    private String description;

    //Constructor

    public Category() {}

    public Category(String description, String categoryName, int categoryId) {
        this.description = description;
        this.categoryName = categoryName;
        this.categoryId = categoryId;
    }

    //Getting and Setting

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
