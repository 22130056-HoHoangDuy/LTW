package vn.edu.nlu.fit.be.Model;

import java.sql.Date;

public class Voucher {
    String voucher_code;
    String img_voucher;
    String description;
    int discount_amount;
    Date created_voucher;
    String status;

    public Voucher(String voucher_code, String img_voucher, String description, int discount_amount, Date created_voucher, String status) {
        this.voucher_code = voucher_code;
        this.img_voucher = img_voucher;
        this.description = description;
        this.discount_amount = discount_amount;
        this.created_voucher = created_voucher;
        this.status = status;
    }

    public String getVoucher_code() {
        return voucher_code;
    }

    public void setVoucher_code(String voucher_code) {
        this.voucher_code = voucher_code;
    }

    public String getImg_voucher() {
        return img_voucher;
    }

    public void setImg_voucher(String img_voucher) {
        this.img_voucher = img_voucher;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDiscount_amount() {
        return discount_amount;
    }

    public void setDiscount_amount(int discount_amount) {
        this.discount_amount = discount_amount;
    }

    public Date getCreated_voucher() {
        return created_voucher;
    }

    public void setCreated_voucher(Date created_voucher) {
        this.created_voucher = created_voucher;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
