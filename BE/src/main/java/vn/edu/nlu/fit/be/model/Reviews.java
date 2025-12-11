package vn.edu.nlu.fit.be.model;

import java.sql.Timestamp;

public class Reviews {

    private int reviewId;
    private int userId;
    private int productId;
    private String commentProduct;
    private Timestamp commentCreated;

    //Constructor
    public Reviews() {}

    public Reviews(int reviewId, Timestamp commentCreated, String commentProduct, int productId, int userId) {
        this.reviewId = reviewId;
        this.commentCreated = commentCreated;
        this.commentProduct = commentProduct;
        this.productId = productId;
        this.userId = userId;
    }

    //Getters & Setters

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public Timestamp getCommentCreated() {
        return commentCreated;
    }

    public void setCommentCreated(Timestamp commentCreated) {
        this.commentCreated = commentCreated;
    }

    public String getCommentProduct() {
        return commentProduct;
    }

    public void setCommentProduct(String commentProduct) {
        this.commentProduct = commentProduct;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
