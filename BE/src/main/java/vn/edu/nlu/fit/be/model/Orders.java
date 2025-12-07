package vn.edu.nlu.fit.be.model;

import java.sql.Date;

public class Orders {

    private int orderId;
    private OrderStatus orderStatus;
    private int totalAmount;
    private String deliveryAddress;
    private String phone;
    private PaymentMethod paymentMethod;
    private Date paymentDate;
    private Date createdAt;
    private int userId;
    private String voucherCode;

    private Account user;
    private Voucher voucher;

    //Constructor

    public Orders() {}

    public Orders(Voucher voucher, Account user, String voucherCode, int userId, Date createdAt, Date paymentDate, PaymentMethod paymentMethod, String phone, String deliveryAddress, int totalAmount, OrderStatus orderStatus, int orderId) {
        this.voucher = voucher;
        this.user = user;
        this.voucherCode = voucherCode;
        this.userId = userId;
        this.createdAt = createdAt;
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
        this.phone = phone;
        this.deliveryAddress = deliveryAddress;
        this.totalAmount = totalAmount;
        this.orderStatus = orderStatus;
        this.orderId = orderId;
    }

    //Getting and Setting

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public void setVoucher(Voucher voucher) {
        this.voucher = voucher;
    }

    public Account getUser() {
        return user;
    }

    public void setUser(Account user) {
        this.user = user;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
    }

    /*
     * payment_method ENUM('COD', 'Card')
     * - COD: thanh toán khi nhận hàng
     * - Card: thanh toán bằng thẻ (credit/debit)
     */

    public enum PaymentMethod {
        COD, Card;
    }

    /*
     * order_status ENUM('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')
     * - Pending: đơn hàng mới tạo, chưa xử lý
     * - Processing: đang được chuẩn bị
     * - Shipped: đã giao cho đơn vị vận chuyển
     * - Delivered: đã giao tới khách hàng
     * - Cancelled: đã bị hủy
     */
    public enum OrderStatus {
        Pending, Processing, Shipped, Delivered, Cancelled;
    }
}
