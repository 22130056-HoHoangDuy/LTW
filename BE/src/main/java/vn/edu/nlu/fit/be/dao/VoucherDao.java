package vn.edu.nlu.fit.be.dao;

import vn.edu.nlu.fit.be.model.Voucher;

import java.util.List;

public class VoucherDao extends BaseDao {

    // ADMIN: lấy toàn bộ voucher
    public List<Voucher> getAll() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM vouchers ORDER BY voucher_id DESC")
                        .mapToBean(Voucher.class)
                        .list()
        );
    }

    public void insert(Voucher v) {
        String sql = """
            INSERT INTO vouchers
            (voucher_code, voucher_name, voucher_description,
             discount_amount, start_voucher, end_voucher)
            VALUES (?, ?, ?, ?, ?, ?)
        """;

        jdbi.useHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, v.getVoucherCode())
                        .bind(1, v.getVoucherName())
                        .bind(2, v.getVoucherDescription())
                        .bind(3, v.getDiscountAmount())
                        .bind(4, v.getStartVoucher())
                        .bind(5, v.getEndVoucher())
                        .execute()
        );
    }

    public void delete(int id) {
        jdbi.useHandle(handle ->
                handle.createUpdate("DELETE FROM vouchers WHERE voucher_id = :id")
                        .bind("id", id)
                        .execute()
        );
    }
}
