package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.nlu.fit.be.dao.AdminCategoryDao;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.Category;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/categories")
public class AdminCategoryController extends HttpServlet {

    private final AdminCategoryDao categoryDao = new AdminCategoryDao();

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
        String action = req.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Category category = categoryDao.findById(id);
            req.setAttribute("category", category);
        }

        List<Category> categories = categoryDao.findAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/admin_categories.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        switch (action) {
            case "create" -> createCategory(req);
            case "update" -> updateCategory(req);
            case "delete" -> deleteCategory(req);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/categories");
    }

    // ===== CREATE =====
    private void createCategory(HttpServletRequest req) {
        Category c = new Category();
        c.setCategoryName(req.getParameter("name"));
        c.setCategoryImage(req.getParameter("img"));
        c.setDescription(req.getParameter("description"));

        categoryDao.insert(c);
    }

    // ===== UPDATE =====
    private void updateCategory(HttpServletRequest req) {
        Category c = new Category();
        c.setCategoryId(Integer.parseInt(req.getParameter("id")));
        c.setCategoryName(req.getParameter("name"));
        c.setCategoryImage(req.getParameter("img"));
        c.setDescription(req.getParameter("description"));

        categoryDao.update(c);
    }

    // ===== DELETE =====
    private void deleteCategory(HttpServletRequest req) {
        int id = Integer.parseInt(req.getParameter("id"));
        categoryDao.delete(id);
    }
}
