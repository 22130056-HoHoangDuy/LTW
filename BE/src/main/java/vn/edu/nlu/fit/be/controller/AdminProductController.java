package vn.edu.nlu.fit.be.controller;

import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.service.AdminProductService;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/products")
public class AdminProductController extends HttpServlet {

    private final AdminProductService service = new AdminProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Product> products = service.getAllProducts();
        req.setAttribute("products", products);
        RequestDispatcher rd = req.getRequestDispatcher("/admin_products.jsp");
        rd.forward(req, resp);
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
