package vn.edu.nlu.fit.be.controller;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.service.AccountService;

import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {

    private final AccountService service = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String userName = req.getParameter("username");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String confirm = req.getParameter("confirmPassword");

        if (!pass.equals(confirm)) {
            req.setAttribute("error", "Mật khẩu không khớp!");
            req.setAttribute("showRegister", true);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        boolean ok = service.register(userName, email, pass);

        if (!ok) {
            req.setAttribute("error", "Email đã tồn tại!");
            req.setAttribute("showRegister", true);
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
            return;
        }

        resp.sendRedirect(req.getContextPath() + "/login");
    }
}