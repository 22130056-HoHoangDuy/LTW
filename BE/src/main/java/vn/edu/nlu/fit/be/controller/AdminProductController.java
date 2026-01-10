package vn.edu.nlu.fit.be.controller;

import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.service.AdminProductService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import vn.edu.nlu.fit.be.dao.CategoryDao;
import vn.edu.nlu.fit.be.model.Category;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/admin/products")
public class AdminProductController extends HttpServlet {

    private final AdminProductService service = new AdminProductService();

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
        // 1. Lấy danh sách product
        List<Product> products = service.getAllProducts();

        // 2. Lấy danh sách category
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categories = categoryDao.findAllCategory();

        // 3. Mapping categoryId -> categoryName
        Map<Integer, String> categoryMap = new HashMap<>();
        for (Category c : categories) {
            categoryMap.put(c.getCategoryId(), c.getCategoryName());
        }

        // 4. Set attribute
        req.setAttribute("products", products);
        req.setAttribute("categoryMap", categoryMap);

        // 5. Forward
        req.getRequestDispatcher("/admin_products.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        Product p = new Product();
        p.setProductName(req.getParameter("productName"));
        p.setProductPrice(Integer.parseInt(req.getParameter("productPrice")));
        p.setProductImage(req.getParameter("productImg"));
        p.setProductSize(req.getParameter("productSize"));
        p.setProductMaterial(req.getParameter("productMaterial"));
        p.setBrandId(Integer.parseInt(req.getParameter("brandId")));
        p.setCategoryId(Integer.parseInt(req.getParameter("categoryId")));

        service.addProduct(p);

        resp.sendRedirect(req.getContextPath() + "/admin/products");
    }
}
