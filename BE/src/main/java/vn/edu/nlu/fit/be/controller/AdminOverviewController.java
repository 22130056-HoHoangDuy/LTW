package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.be.dao.AdminOverviewDao;
import vn.edu.nlu.fit.be.model.Account;

import java.io.IOException;

@WebServlet("/admin/overview")
public class AdminOverviewController extends HttpServlet {

    private final AdminOverviewDao dao = new AdminOverviewDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        HttpSession session = req.getSession(false);
//
//        //chưa login
//        if (session == null || session.getAttribute("USER") == null) {
//            resp.sendRedirect(req.getContextPath() + "/login");
//            return;
//        }
//
//        Account acc = (Account) session.getAttribute("USER");
//
//        //không phải admin
//        if (acc.getRole() <= 0) {
//            resp.sendRedirect(req.getContextPath() + "/403.jsp");
//            return;
//        }

        req.setAttribute("totalRevenue", dao.getTotalRevenue());
        req.setAttribute("totalOrders", dao.getTotalOrders());
        req.setAttribute("totalCustomers", dao.getTotalCustomers());
        req.setAttribute("totalProducts", dao.getTotalProducts());

        req.setAttribute("revenueByMonth", dao.getRevenueByMonth());
        req.setAttribute("ordersByCategory", dao.getOrdersByCategory());
        req.setAttribute("recentOrders", dao.getRecentOrders(5));

        req.getRequestDispatcher("/admin_overview.jsp")
                .forward(req, resp);

    }
}
