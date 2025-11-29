package vn.edu.nlu.fit.be.model;

public class Stock {
    private int stockId;
    private String stockName;
    private String stockAddress;
    private int productId;

    private Product product;

    //Constructor

    public Stock() {}

    public Stock(Product product, int productId, String stockAddress, String stockName, int stockId) {
        this.product = product;
        this.productId = productId;
        this.stockAddress = stockAddress;
        this.stockName = stockName;
        this.stockId = stockId;
    }

    //Getting and Setting

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

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
