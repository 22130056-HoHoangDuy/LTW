package vn.edu.nlu.fit.be.model;

import java.sql.Date;
import java.sql.Timestamp;

public class Orders {

    private int orderId;
    private int userId;
    private int voucherId;

    private OrderStatus statusOrder;
    private int totalAmount;
    private String deliveryAddress;
    private PaymentMethod paymentMethod;
    private Timestamp orderDate;

    //Constructor

    public Orders() {}

    public Orders(int orderId, Timestamp orderDate, PaymentMethod paymentMethod, String deliveryAddress, int totalAmount, OrderStatus statusOrder, int voucherId, int userId) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.paymentMethod = paymentMethod;
        this.deliveryAddress = deliveryAddress;
        this.totalAmount = totalAmount;
        this.statusOrder = statusOrder;
        this.voucherId = voucherId;
        this.userId = userId;
    }

    // Getters & Setters

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public OrderStatus getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(OrderStatus statusOrder) {
        this.statusOrder = statusOrder;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }
}
