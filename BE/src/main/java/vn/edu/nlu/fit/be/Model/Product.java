package vn.edu.nlu.fit.be.model;

import java.io.Serializable;

import vn.edu.nlu.fit.be.model.Category;

public class Product implements Serializable {
    private int productId;
    private String productName;
    private int price;
    private String imgUrl;
    private String brandName;
    private String description;
    private String size;
    private int weight;
    private String material;
    private boolean isAvailable;
    private int categoryId;

    private Category category;


    //Constructor
    public Product() {
    }

    public Product(int productId, int categoryId, boolean isAvailable, String material, int weight, String size, String description, String brandName, String imgUrl, int price, String productName) {
        this.productId = productId;
//        this.category = category;
        this.categoryId = categoryId;
        this.isAvailable = isAvailable;
        this.material = material;
        this.weight = weight;
        this.size = size;
        this.description = description;
        this.brandName = brandName;
        this.imgUrl = imgUrl;
        this.price = price;
        this.productName = productName;
    }

    //Getting and Setting

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
