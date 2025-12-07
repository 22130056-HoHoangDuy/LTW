package vn.edu.nlu.fit.be.model;

import java.io.Serializable;

public class Category implements Serializable {
    private int categoryId;
    private String categoryName;
    private String categoryImg;
    private String description;

    //Constructor

    public Category() {
    }

    public Category(int categoryId, String categoryName, String categoryImg, String description) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.categoryImg = categoryImg;
        this.description = description;
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

    public String getCategoryImg() {
        return categoryImg;
    }

    public void setCategoryImg(String categoryImg) {
        this.categoryImg = categoryImg;
    }
}
