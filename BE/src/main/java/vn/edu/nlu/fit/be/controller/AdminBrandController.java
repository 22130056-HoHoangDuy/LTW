package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.Brand;
import vn.edu.nlu.fit.be.model.Contact;
import vn.edu.nlu.fit.be.service.BrandService;
import vn.edu.nlu.fit.be.service.ContactService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminBrandController", value = "/admin/brands")
public class AdminBrandController extends HttpServlet {
    private final BrandService brandService = new BrandService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // chỉ load danh sách + hiển thị form nếu có action
        List<Brand> brandList = brandService.loadMoreBrands();
        request.setAttribute("brandList", brandList);

        request.getRequestDispatcher("/admin_brands.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Brand brand = new Brand();
            brand.setBrandName(request.getParameter("brandName"));
            brand.setBrandLogo(request.getParameter("brandLogo"));
            brand.setBrandDescription(request.getParameter("brandDescription"));

            brandService.addBrand(brand);

            // redirect tránh submit lại khi refresh
            response.sendRedirect(request.getContextPath() + "/admin/brands");
        }
    }
}