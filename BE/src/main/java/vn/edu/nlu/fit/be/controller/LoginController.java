package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.service.AccountService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private final AccountService service = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String key = req.getParameter("username");
        String password = req.getParameter("password");

        Account acc = service.login(key, password);

        if (acc == null) {
            req.setAttribute("error",
                    "Sai tài khoản, mật khẩu hoặc tài khoản bị khoá!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(true);
        String returnUrl = (String) session.getAttribute("redirectAfterLogin");
        session.setAttribute("USER", acc);
        session.setMaxInactiveInterval(30 * 60); // 30 phút

        //Chuyển đến vị trí trang đang đứng
        if (returnUrl != null) {
            resp.sendRedirect(returnUrl);
        } else
            resp.sendRedirect(req.getContextPath() + "/home");
    }
}