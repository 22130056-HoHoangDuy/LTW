package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Account;
import vn.edu.nlu.fit.be.model.FavoriteProduct;
import vn.edu.nlu.fit.be.service.FavoriteProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "FavoriteServlet", value = "/my-favorite")
public class FavoriteController extends HttpServlet {
    private final FavoriteProductService service = new FavoriteProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Account acc = (Account) request.getSession().getAttribute("USER");
        if (acc == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        List<FavoriteProduct> favorites =
                service.getFavorites(acc.getAccountId());

        request.setAttribute("FAVORITES", favorites);

        request.getRequestDispatcher("/favorite.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Account acc = (Account) req.getSession().getAttribute("USER");
        if (acc == null) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        int productId = Integer.parseInt(req.getParameter("productId"));
        boolean liked = service.toggle(acc.getAccountId(), productId);

        resp.setContentType("application/json");
        resp.getWriter().write("{\"liked\": " + liked + "}");
    }
}