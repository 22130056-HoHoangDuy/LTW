package vn.edu.nlu.fit.be.Model;

import java.sql.Date;

public class Voucher {
    private String voucherCode;
    private String imgVoucher;
    private String description;
    private int discountAmount;
    private Date createdVoucher;
    private Date endVoucher;
    private String status;

    //Constructor

    public Voucher(String voucherCode, String status, Date endVoucher, Date createdVoucher, int discountAmount, String description, String imgVoucher) {
        this.voucherCode = voucherCode;
        this.status = status;
        this.endVoucher = endVoucher;
        this.createdVoucher = createdVoucher;
        this.discountAmount = discountAmount;
        this.description = description;
        this.imgVoucher = imgVoucher;
    }

    //Getting and Setting

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getEndVoucher() {
        return endVoucher;
    }

    public void setEndVoucher(Date endVoucher) {
        this.endVoucher = endVoucher;
    }

    public Date getCreatedVoucher() {
        return createdVoucher;
    }

    public void setCreatedVoucher(Date createdVoucher) {
        this.createdVoucher = createdVoucher;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgVoucher() {
        return imgVoucher;
    }

    public void setImgVoucher(String imgVoucher) {
        this.imgVoucher = imgVoucher;
    }
}