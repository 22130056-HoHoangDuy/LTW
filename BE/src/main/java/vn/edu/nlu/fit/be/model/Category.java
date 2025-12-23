package vn.edu.nlu.fit.be.model;

public class Category {

    private int categoryId;
    private String categoryName;
    private String categoryImage;
    private String description;

    //Constructor

    public Category() {
    }

    public Category(int categoryId, String description, String categoryImage, String categoryName) {
        this.categoryId = categoryId;
        this.description = description;
        this.categoryImage = categoryImage;
        this.categoryName = categoryName;
    }

    // Getters & Setters

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String categoryDescription) {
        this.description = categoryDescription;
    }

    public String getCategoryImage() {
        return categoryImage;
    }

    public void setCategoryImage(String categoryImage) {
        this.categoryImage = categoryImage;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
