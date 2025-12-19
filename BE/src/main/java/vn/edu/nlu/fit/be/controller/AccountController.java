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
        "/admin/accounts/status"
})
public class AccountController extends HttpServlet {

    private AccountService service = new AccountService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

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

        // ❌ Sai: /webapp/admin_accounts.jsp
        // ✅ Đúng:
        RequestDispatcher rd = req.getRequestDispatcher("/admin_accounts.jsp");
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
