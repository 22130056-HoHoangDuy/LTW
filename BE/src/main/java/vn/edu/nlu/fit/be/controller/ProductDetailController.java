package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Category;
import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.service.CategoryService;
import vn.edu.nlu.fit.be.service.ProductService;

import java.io.IOException;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        CategoryService cs = new CategoryService();
        //Lấy productId sản phẩm từ trang product list
        int productId = Integer.parseInt(request.getParameter("product_id"));
        Product product = ps.getProductById(productId);
        request.setAttribute("product", product);

        //Lấy loại sản phẩm
        int categoryId = product.getCategoryId();
        Category category = cs.getCategoryById(categoryId);
        request.setAttribute("category", category);

        //Chuyển đến trang product detail
        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}