package vn.edu.nlu.fit.be.model;

import java.sql.Timestamp;

public class Product {

    private int productId;
    private int categoryId;
    private int brandId;
    private String productImg;
    private String productName;
    private int productPrice;
    private String productSize;
    private String productMaterial;
    private Timestamp createdProduct;

    //Constructor

    public Product() {
    }

    public Product(int productId, Timestamp createdProduct, String productMaterial, String productSize, int productPrice, String productName, String productImg, int brandId, int categoryId) {
        this.productId = productId;
        this.createdProduct = createdProduct;
        this.productMaterial = productMaterial;
        this.productSize = productSize;
        this.productPrice = productPrice;
        this.productName = productName;
        this.productImg = productImg;
        this.brandId = brandId;
        this.categoryId = categoryId;
    }

    //Getters and Setters

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Timestamp getCreatedProduct() {
        return createdProduct;
    }

    public void setCreatedProduct(Timestamp createdProduct) {
        this.createdProduct = createdProduct;
    }

    public String getProductMaterial() {
        return productMaterial;
    }

    public void setProductMaterial(String productMaterial) {
        this.productMaterial = productMaterial;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
