package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.edu.nlu.fit.be.dao.CategoryDao;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.service.AdminProductService;

import java.io.IOException;
import java.util.List;

@WebServlet({
        "/admin/products",
        "/admin/products/save",
        "/admin/products/delete"
})
@MultipartConfig
public class AdminProductController extends HttpServlet {

    private final AdminProductService service = new AdminProductService();
    private final CategoryDao categoryDao = new CategoryDao();

    /* ================= CHECK ADMIN (DÙNG CHUNG) ================= */
    private boolean checkAdmin(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("USER") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return false;
        }

        Account acc = (Account) session.getAttribute("USER");
        if (acc.getRole() <= 0) {
            resp.sendRedirect(req.getContextPath() + "/403.jsp");
            return false;
        }
        return true;
    }

    /* ================= GET ================= */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!checkAdmin(req, resp)) return;

        String uri = req.getRequestURI();

        if (uri.endsWith("/admin/products")) {
            showProducts(req, resp);
        }
    }

    /* ================= POST ================= */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!checkAdmin(req, resp)) return;

        String uri = req.getRequestURI();

        if (uri.endsWith("/save")) {
            saveProduct(req, resp);
        } else if (uri.endsWith("/delete")) {
            deleteProduct(req, resp);
        }
    }

    /* ================= HIỂN THỊ LIST ================= */
    private void showProducts(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String keyword = req.getParameter("search");

        List<Product> products = (keyword != null && !keyword.isEmpty())
                ? service.search(keyword)
                : service.getAllProducts();

        req.setAttribute("products", products);
        req.setAttribute("categories", categoryDao.findAllCategory());

        req.getRequestDispatcher("/admin_products.jsp").forward(req, resp);
    }

    /* ================= SAVE (ADD + UPDATE) ================= */
    private void saveProduct(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        req.setCharacterEncoding("UTF-8");

        String idRaw = req.getParameter("productId");
        int productId = (idRaw == null || idRaw.isEmpty()) ? 0 : Integer.parseInt(idRaw);

        Product p = new Product();
        p.setProductId(productId);
        p.setProductName(req.getParameter("productName"));
        p.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
        p.setCategoryId(Integer.parseInt(req.getParameter("categoryId")));

        // ====== BRAND (BẮT BUỘC PHẢI > 0) ======
        String brandRaw = req.getParameter("brandId");
        if (brandRaw != null && !brandRaw.isEmpty()) {
            p.setBrandId(Integer.parseInt(brandRaw));
        }

        p.setProductSize(req.getParameter("productSize"));
        p.setProductMaterial(req.getParameter("productMaterial"));

        // ====== IMAGE ======
        Part img = req.getPart("image");
        if (img != null && img.getSize() > 0) {
            // nếu bạn lưu URL trực tiếp thì chỉ cần:
            p.setProductImage(img.getSubmittedFileName());
        }

        if (productId == 0) {
            service.insert(p);
        } else {
            service.update(p);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }

    /* ================= DELETE ================= */
    private void deleteProduct(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        boolean ok = service.delete(id);

        resp.setContentType("text/plain");
        resp.getWriter().write(ok ? "OK" : "FAIL");
    }
}
