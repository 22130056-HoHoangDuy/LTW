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
                    (voucher_code, voucher_name, description,
                     discount_amount, start_date, end_date)
                    VALUES (?, ?, ?, ?, ?, ?)
                """;

        jdbi.useHandle(handle ->
                handle.createUpdate(sql)
                        .bind(0, v.getVoucherCode())
                        .bind(1, v.getVoucherName())
                        .bind(2, v.getDescription())
                        .bind(3, v.getDiscountAmount())
                        .bind(4, v.getStartDate())
                        .bind(5, v.getEndDate())
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
    public int getDiscountAmount(String code){
        String sql = """
                    SELECT discount_amount
                    FROM vouchers
                    WHERE voucher_code = :code
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("code", code)
                        .mapToBean(Integer.class)
                        .one()
        );
    }
    public Voucher findByCode(String code) {
        String sql = """
                    SELECT *
                    FROM vouchers
                    WHERE voucher_code = :code
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("code", code)
                        .mapToBean(Voucher.class)
                        .findOne()
                        .orElse(null)
        );
    }

}
