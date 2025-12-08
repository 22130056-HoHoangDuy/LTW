package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Category;
import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.service.CategoryService;
import vn.edu.nlu.fit.be.service.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SearchController", value = "/search")
public class ProductSearchController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        ProductService productService = new ProductService();
        CategoryService categoryService = new CategoryService();

        List<Category>categories = categoryService.getCategoryList();
        List<Product> products = productService.searchProducts(keyword);
        Map<Integer,Integer>soldMap = productService.getBestSellingProducts();

        request.setAttribute("categories",categories);
        request.setAttribute("products", products);
        request.setAttribute("soldMap",soldMap);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("productList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}