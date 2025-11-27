package vn.edu.nlu.fit.be.Model;

public class OrderDetail {
    private int orderDetailId;
    private int quantity;
    private int unitPrice;
    private int productId;
    private int orderId;

    private Product product;
    private Orders order;

    //Constructor

    public OrderDetail() {}

    public OrderDetail(int orderDetailId, Orders order, Product product, int orderId, int productId, int unitPrice, int quantity) {
        this.orderDetailId = orderDetailId;
        this.order = order;
        this.product = product;
        this.orderId = orderId;
        this.productId = productId;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
    }

    //Getting and Setting

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
