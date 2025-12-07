package vn.edu.nlu.fit.be.model;

import java.sql.Timestamp;

public class StockProduct {
    private int stockProductId;
    private int totalQuantity;
    private int soldQuantity;
    private Timestamp totalUpdatedDate;
    private int stockId;
    private int productId;

    private Stock stock;
    private Product product;

    //Constructor

    public StockProduct() {
    }

    public StockProduct(int stockProductId, int productId, int stockId, Timestamp totalUpdatedDate, int soldQuantity, int totalQuantity) {
        this.stockProductId = stockProductId;
        this.productId = productId;
        this.stockId = stockId;
        this.totalUpdatedDate = totalUpdatedDate;
        this.soldQuantity = soldQuantity;
        this.totalQuantity = totalQuantity;
    }

    //Getting and Setting

    public int getStockProductId() {
        return stockProductId;
    }

    public void setStockProductId(int stockProductId) {
        this.stockProductId = stockProductId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Stock getStock() {
        return stock;
    }

    public void setStock(Stock stock) {
        this.stock = stock;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }

    public Timestamp getTotalUpdatedDate() {
        return totalUpdatedDate;
    }

    public void setTotalUpdatedDate(Timestamp totalUpdatedDate) {
        this.totalUpdatedDate = totalUpdatedDate;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }
}
