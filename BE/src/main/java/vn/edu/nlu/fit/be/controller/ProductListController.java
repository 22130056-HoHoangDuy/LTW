package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.model.*;
import vn.edu.nlu.fit.be.service.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import vn.edu.nlu.fit.be.model.Product;
import vn.edu.nlu.fit.be.service.StockProductService;

@WebServlet(name = "ProductListController", value = "/product-list")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        CategoryService cs = new CategoryService();
        BrandService bs = new BrandService();
        StockProductService ss = new StockProductService();
        List<Product> products;

        // Filter product by category
        String categoryIdToStr = request.getParameter("category_id");
        String sort = request.getParameter("sort");

        //Chia làm hai: không lọc theo category và lọc theo category
        if (categoryIdToStr == null || categoryIdToStr.isEmpty()) {
            products = ps.getProductList();

        } else {
            int categoryId = Integer.parseInt(categoryIdToStr);
            products = ps.getProductsByCategory(categoryId);

        }

        //Lọc bán chạy nhất
//        Map<Integer, Integer> soldMap = ps.getBestSellingProducts();
//        if ("hotest".equals(sort)) {
//            ps.sortProductsByHotest(products, soldMap);
//        }

        List<Category> categories = cs.getCategoryList();
        List<Brand> brands = bs.getBrands();
        // Save into request
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);
        request.setAttribute("brands", brands);
        request.setAttribute("currentCategoryId", categoryIdToStr);
        request.setAttribute("currentSort", sort);

//        request.setAttribute("soldMap", soldMap);
        request.getRequestDispatcher("productList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}