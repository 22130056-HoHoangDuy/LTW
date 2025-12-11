package vn.edu.nlu.fit.be.model;

public class Stock {
    private int stockId;
    private String stockName;
    private String stockAddress;

    private Product product;

    //Constructor

    public Stock() {
    }

    public Stock(int stockId,  String stockName, String stockAddress) {
        this.stockAddress = stockAddress;
        this.stockName = stockName;
        this.stockId = stockId;
    }

    //Getters and Setters

    public String getStockAddress() {
        return stockAddress;
    }

    public void setStockAddress(String stockAddress) {
        this.stockAddress = stockAddress;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }
}
