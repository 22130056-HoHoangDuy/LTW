package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.*;
import vn.edu.nlu.fit.be.service.*;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Product> interiorProducts = productService.getNewestProductsByCategory(1,"latest");
        List<Product> decoratingProducts = productService.getNewestProductsByCategory(2,"latest");
        Map<Integer, Integer> decorateSold = productService.getSoldMap(decoratingProducts);
        List<Product> toyProducts = productService.getNewestProductsByCategory(3,"latest");

        req.setAttribute("decorates", decoratingProducts);
        req.setAttribute("soldDecorated",decorateSold);
        req.setAttribute("categories", categoryService.getCategoryList());
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}