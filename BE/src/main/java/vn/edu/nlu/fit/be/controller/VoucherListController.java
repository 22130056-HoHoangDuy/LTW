package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Voucher;
import vn.edu.nlu.fit.be.service.VoucherService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "VoucherListController", value = "/voucher-list")
public class VoucherListController extends HttpServlet {
    private VoucherService voucherService;

    @Override
    public void init() {
        voucherService = new VoucherService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy danh sách voucher
        List<Voucher> vouchers = voucherService.getAll();

        // Gửi sang JSP
        request.setAttribute("vouchers", vouchers);

        request.getRequestDispatcher("/voucher_list.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}