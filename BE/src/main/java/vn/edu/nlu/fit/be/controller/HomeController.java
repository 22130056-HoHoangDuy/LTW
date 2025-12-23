package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
<<<<<<< HEAD
import vn.edu.nlu.fit.be.model.*;
import vn.edu.nlu.fit.be.service.*;
=======
import vn.edu.nlu.fit.be.service.CategoryService;
import vn.edu.nlu.fit.be.service.ProductService;
>>>>>>> 8206abee2ef10aa385597da95830ab388c31e449

import java.io.IOException;
import java.util.*;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();
<<<<<<< HEAD
    private ProductService productService = new ProductService();
=======
    private final ProductService productService = new ProductService();
>>>>>>> 8206abee2ef10aa385597da95830ab388c31e449

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<Product> interiorProducts = productService.getNewestProductsByCategory(1,"latest");
        List<Product> decoratingProducts = productService.getNewestProductsByCategory(2,"latest");
        Map<Integer, Integer> decorateSold = productService.getSoldMap(decoratingProducts);
        List<Product> toyProducts = productService.getNewestProductsByCategory(3,"latest");

<<<<<<< HEAD
        req.setAttribute("decorates", decoratingProducts);
        req.setAttribute("soldDecorated",decorateSold);
=======
        req.setAttribute("categories", categoryService.getAllCategories());

        req.setAttribute("NoiThatMoi",
                productService.getLatestProductsByCategory(1));

        req.setAttribute("TrangTriMoi",
                productService.getLatestProductsByCategory(2));

        req.setAttribute("DoChoiMoi",
                productService.getLatestProductsByCategory(3));
>>>>>>> 8206abee2ef10aa385597da95830ab388c31e449
        req.setAttribute("categories", categoryService.getCategoryList());
        req.getRequestDispatcher("/home.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}