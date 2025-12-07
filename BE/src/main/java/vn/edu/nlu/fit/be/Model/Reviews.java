package vn.edu.nlu.fit.be.Model;

import java.sql.Timestamp;

public class Reviews {
    private int reviewId;
    private int rate;
    private String comment;
    private Timestamp createAtTimestamp;
    private int userId;
    private int productId;

    private Account user;
    private Product product;

    //Constructor

    public Reviews() {}

    public Reviews(int reviewId, Product product, Account user, int productId, int userId, Timestamp createAtTimestamp, String comment, int rate) {
        this.reviewId = reviewId;
        this.product = product;
        this.user = user;
        this.productId = productId;
        this.userId = userId;
        this.createAtTimestamp = createAtTimestamp;
        this.comment = comment;
        this.rate = rate;
    }

    //Getting and Setting

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
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

    public Timestamp getCreateAtTimestamp() {
        return createAtTimestamp;
    }

    public void setCreateAtTimestamp(Timestamp createAtTimestamp) {
        this.createAtTimestamp = createAtTimestamp;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
}
