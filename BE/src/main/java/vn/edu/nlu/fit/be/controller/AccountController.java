package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.AccountStatus;
import vn.edu.nlu.fit.be.service.AccountService;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {
        "/admin/accounts",
        "/admin/accounts/status",
        "/admin/accounts/add",
        "/admin/accounts/delete"
})

public class AccountController extends HttpServlet {

    private AccountService service = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        //chưa login
        if (session == null || session.getAttribute("USER") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        Account acc = (Account) session.getAttribute("USER");

        //không phải admin
        if (acc.getRole() <= 0) {
            resp.sendRedirect(req.getContextPath() + "/403.jsp");
            return;
        }
        String path = req.getServletPath();

        // ================= AJAX UPDATE STATUS =================
        if (path.equals("/admin/accounts/status")) {

            int id = Integer.parseInt(req.getParameter("id"));
            String newStatus = req.getParameter("status");

            AccountStatus st = AccountStatus.valueOf(newStatus);

            boolean ok = service.updateStatus(id, st);

            resp.setContentType("text/plain");
            resp.getWriter().write(ok ? "OK" : "FAIL");
            return;
        }

        // ================= LOAD ACCOUNT LIST =================
        String keyword = req.getParameter("search");
        List<Account> accounts;

        if (keyword != null && !keyword.isEmpty()) {
            accounts = service.search(keyword);
        } else {
            accounts = service.getAll();
        }

        req.setAttribute("accounts", accounts);
        RequestDispatcher rd = req.getRequestDispatcher("/admin_accounts.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("USER") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        Account admin = (Account) session.getAttribute("USER");

        if (admin.getRole() <= 0) {
            resp.sendRedirect(req.getContextPath() + "/403.jsp");
            return;
        }

        String path = req.getServletPath();

        // ================= DELETE =================
        if (path.equals("/admin/accounts/delete")) {

            int id = Integer.parseInt(req.getParameter("id"));

            if (admin.getAccountId() == id) {
                resp.sendRedirect(req.getContextPath() + "/admin/accounts?error=self-delete");
                return;
            }

            service.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/accounts");
            return;
        }

        // ================= ADD =================
        if (path.equals("/admin/accounts/add")) {

            String email = req.getParameter("email");
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            int role = Integer.parseInt(req.getParameter("role"));

            Account a = new Account();
            a.setEmail(email);
            a.setUsername(username);
            a.setPassword(password);   // Service sẽ hash
            a.setRole(role);
            a.setStatus(AccountStatus.Active);

            service.add(a);
            resp.sendRedirect(req.getContextPath() + "/admin/accounts");
        }
    }
}
