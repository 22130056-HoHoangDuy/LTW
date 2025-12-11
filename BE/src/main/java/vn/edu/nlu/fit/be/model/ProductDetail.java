package vn.edu.nlu.fit.be.model;

public class ProductDetail {
    private int productDetailId;
    private int productId;
    private String detailImg;
    private String productDescription;

    //Constructor

    public ProductDetail() {}

    public ProductDetail(int productDetailId, String productDescription, String detailImg, int productId) {
        this.productDetailId = productDetailId;
        this.productDescription = productDescription;
        this.detailImg = detailImg;
        this.productId = productId;
    }

    //Getters & Setters

    public int getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(int productDetailId) {
        this.productDetailId = productDetailId;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getDetailImg() {
        return detailImg;
    }

    public void setDetailImg(String detailImg) {
        this.detailImg = detailImg;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
}
