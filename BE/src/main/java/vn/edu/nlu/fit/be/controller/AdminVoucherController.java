package vn.edu.nlu.fit.be.controller;

import vn.edu.nlu.fit.be.model.Voucher;
import vn.edu.nlu.fit.be.service.AdminVoucherService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/admin/vouchers")
public class AdminVoucherController extends HttpServlet {

    private final AdminVoucherService service = new AdminVoucherService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Voucher> vouchers = service.getAllVouchers();
        req.setAttribute("vouchers", vouchers);
        RequestDispatcher rd = req.getRequestDispatcher("/admin_vouchers.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        Voucher v = new Voucher();
        v.setVoucherCode(req.getParameter("code"));
        v.setVoucherName(req.getParameter("code")); // tạm dùng code làm name
        v.setDiscountAmount(Integer.parseInt(req.getParameter("discountValue")));
        v.setStartDate(Date.valueOf(req.getParameter("startDate")));
        v.setEndDate(Date.valueOf(req.getParameter("endDate")));
        v.setDescription("");

        service.addVoucher(v);

        resp.sendRedirect(req.getContextPath() + "/admin/vouchers");
    }
}
