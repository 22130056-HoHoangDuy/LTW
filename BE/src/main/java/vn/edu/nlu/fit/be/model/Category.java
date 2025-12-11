package vn.edu.nlu.fit.be.model;

public class Category {

    private int categoryId;
    private String categoryName;
    private String categoryImg;
    private String categoryDescription;

    //Constructor

    public Category() {
    }

    public Category(int categoryId, String categoryDescription, String categoryImg, String categoryName) {
        this.categoryId = categoryId;
        this.categoryDescription = categoryDescription;
        this.categoryImg = categoryImg;
        this.categoryName = categoryName;
    }

    // Getters & Setters

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public String getCategoryImg() {
        return categoryImg;
    }

    public void setCategoryImg(String categoryImg) {
        this.categoryImg = categoryImg;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
