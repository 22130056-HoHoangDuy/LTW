package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Category;
import vn.edu.nlu.fit.be.service.CategoryService;
import vn.edu.nlu.fit.be.service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import vn.edu.nlu.fit.be.model.Product;

@WebServlet(name = "ProductListController", value = "/product-list")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        CategoryService cs = new CategoryService();
        List<Product> products;

        //Filter product by category
        String categoryIdToStr = request.getParameter("category_id");
        if (categoryIdToStr == null || categoryIdToStr.isEmpty()) {
            products = ps.getListProduct();
        } else {
            int categoryId = Integer.parseInt(categoryIdToStr);
            products = ps.getProductsByCategory(categoryId);
        }

        List<Category> categories = cs.getCategoryList();

        //Save into request
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);

        request.setAttribute("currentCategoryId", categoryIdToStr);
        request.getRequestDispatcher("productList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}