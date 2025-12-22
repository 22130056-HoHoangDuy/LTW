package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.nlu.fit.be.dao.AdminOverviewDao;

import java.io.IOException;

@WebServlet("/admin/overview")
public class AdminOverviewController extends HttpServlet {

    private final AdminOverviewDao dao = new AdminOverviewDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

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
