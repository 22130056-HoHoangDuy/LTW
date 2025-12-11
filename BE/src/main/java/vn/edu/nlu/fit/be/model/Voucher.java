package vn.edu.nlu.fit.be.model;

import java.sql.Date;

public class Voucher {

    private int voucherId;
    private String voucherCode;
    private String voucherName;
    private String voucherImg;
    private String voucherDescription;
    private int discountAmount;
    private Date startVoucher;
    private Date endVoucher;

    //Constructor

    public Voucher() {}

    public Voucher(int voucherId, Date endVoucher, Date startVoucher, int discountAmount, String voucherDescription, String voucherImg, String voucherName, String voucherCode) {
        this.voucherId = voucherId;
        this.endVoucher = endVoucher;
        this.startVoucher = startVoucher;
        this.discountAmount = discountAmount;
        this.voucherDescription = voucherDescription;
        this.voucherImg = voucherImg;
        this.voucherName = voucherName;
        this.voucherCode = voucherCode;
    }

    // Getters & Setters

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    public Date getEndVoucher() {
        return endVoucher;
    }

    public void setEndVoucher(Date endVoucher) {
        this.endVoucher = endVoucher;
    }

    public Date getStartVoucher() {
        return startVoucher;
    }

    public void setStartVoucher(Date startVoucher) {
        this.startVoucher = startVoucher;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getVoucherDescription() {
        return voucherDescription;
    }

    public void setVoucherDescription(String voucherDescription) {
        this.voucherDescription = voucherDescription;
    }

    public String getVoucherImg() {
        return voucherImg;
    }

    public void setVoucherImg(String voucherImg) {
        this.voucherImg = voucherImg;
    }

    public String getVoucherName() {
        return voucherName;
    }

    public void setVoucherName(String voucherName) {
        this.voucherName = voucherName;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }
}