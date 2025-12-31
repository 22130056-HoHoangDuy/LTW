package vn.edu.nlu.fit.be.service;

import vn.edu.nlu.fit.be.dao.VoucherDao;
import vn.edu.nlu.fit.be.model.Voucher;

import java.util.List;

public class VoucherService {
    private VoucherDao voucherDao = new VoucherDao();

    // ADMIN: lấy toàn bộ voucher
    public List<Voucher> getAll() {
        return voucherDao.getAll();
    }

    public void insert(Voucher v) {
        voucherDao.insert(v);
    }

    public void delete(int id) {
        voucherDao.delete(id);
    }

    public Voucher findByCode(String code) {
        return voucherDao.findByCode(code);
    }

    public int getDiscountAmount(String code) {
        return voucherDao.getDiscountAmount(code);
    }
}
