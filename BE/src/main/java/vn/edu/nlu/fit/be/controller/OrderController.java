package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.*;
import vn.edu.nlu.fit.be.service.*;

import java.io.IOException;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Account account = (Account) session.getAttribute("USER");
        if (account == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getTotalQuantity() == 0) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        request.setCharacterEncoding("UTF-8");

        String deliveryAddress = request.getParameter("deliveryAddress");
        String paymentMethodStr = request.getParameter("paymentMethod");
        String voucherIdStr = request.getParameter("voucherId");

        PaymentMethod paymentMethod;
        try {
            paymentMethod = PaymentMethod.valueOf(paymentMethodStr);
        } catch (Exception e) {
            paymentMethod = PaymentMethod.COD;
        }

        Integer voucherId = null;
        if (voucherIdStr != null && !voucherIdStr.trim().isEmpty()) {
            try {
                voucherId = Integer.parseInt(voucherIdStr.trim());
            } catch (NumberFormatException ignored) {
                voucherId = null;
            }
        }
        OrdersService ordersService = new OrdersService();
        try {
            int orderId = ordersService.createOrderFromCart(account, cart, deliveryAddress, paymentMethod, voucherId);

            // clear cart
            cart.removeAllItems();
            session.setAttribute("cart", cart);

            // redirect về cart kèm orderId
            response.sendRedirect(request.getContextPath() + "/cart?paid=1&orderId=" + orderId);

        } catch (Exception ex) {
            // có lỗi thì quay lại cart với flag
            ex.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/cart?paid=0");
        }

    }
}