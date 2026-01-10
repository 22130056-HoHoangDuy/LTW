package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/admin/settings")
public class AdminSettingController extends HttpServlet {

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
        req.getRequestDispatcher("/admin_settings.jsp")
                .forward(req, resp);
    }
}
