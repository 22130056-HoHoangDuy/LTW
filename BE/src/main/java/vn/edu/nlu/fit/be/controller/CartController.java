package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.Cart;
import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.service.ProductService;

import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("USER");
        if (account==null){
            response.sendRedirect("login.jsp");
            return;
        }
        Cart cart = (Cart) session.getAttribute("cart");
        //Kiểm tra giỏ hàng tồn tại chưa
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String productIdParam = request.getParameter("product_id");
        String quantityParam = request.getParameter("quantity");
        if (productIdParam != null) {
            int productId = Integer.parseInt(productIdParam);
            int quantity = (quantityParam != null && !quantityParam.isEmpty()) ? Integer.parseInt(quantityParam) : 1;
            ProductService ps = new ProductService();
            Product product = ps.getProductById(productId);
            if (product == null) {
                response.sendRedirect("productList.jsp");
                return;
            }
            switch (action) {
                case "add":
                    cart.addItem(product, quantity);
                    session.setAttribute("cart", cart);
                    response.sendRedirect(request.getContextPath() + "/product-list");
                    return;

                case "remove":
                    cart.removeItem(productId);
                    session.setAttribute("cart", cart);
                    response.sendRedirect(request.getContextPath() + "/cart");
                    return;

            }
        }
        if ("remove_all".equals(action)) {
            cart.removeAllItems();
            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        //XEM GIỎ HÀNG
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}