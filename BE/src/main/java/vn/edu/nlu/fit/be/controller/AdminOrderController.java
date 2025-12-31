package vn.edu.nlu.fit.be.controller;

import vn.edu.nlu.fit.be.model.*;
import vn.edu.nlu.fit.be.service.OrdersService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {
        "/admin/orders",
        "/admin/orders/status"
})
public class AdminOrderController extends HttpServlet {

    private OrdersService service = new OrdersService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();

        // ===== AJAX UPDATE STATUS =====
        if (path.equals("/admin/orders/status")) {
            int id = Integer.parseInt(req.getParameter("id"));
            OrderStatus st = OrderStatus.valueOf(req.getParameter("status"));

            boolean ok = service.updateStatus(id, st);

            resp.setContentType("text/plain");
            resp.getWriter().write(ok ? "OK" : "FAIL");
            return;
        }

        // ===== LOAD ORDER LIST =====
        List<Order> orders = service.getAll();
        req.setAttribute("orders", orders);

        req.getRequestDispatcher("/admin_orders.jsp").forward(req, resp);
    }
}
