package vn.edu.nlu.fit.be.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.nlu.fit.be.Model.Category;
import vn.edu.nlu.fit.be.service.CategoryService;
import vn.edu.nlu.fit.be.service.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import vn.edu.nlu.fit.be.Model.Product;
import vn.edu.nlu.fit.be.service.StockProductService;

@WebServlet(name = "ProductListController", value = "/product-list")
public class ProductListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        CategoryService cs = new CategoryService();
        StockProductService ss = new StockProductService();
        List<Product> products;

        // Filter product by category
        String categoryIdToStr = request.getParameter("category_id");
        String sort = request.getParameter("sort");

        //Chia làm hai: không lọc theo category và lọc theo category
        if (categoryIdToStr == null || categoryIdToStr.isEmpty()) {
            if (sort != null && !sort.equals("hotest")) {
                products = ps.getProductBySort(sort);
            } else {
                products = ps.getListProduct();
            }

        } else {
            int categoryId = Integer.parseInt(categoryIdToStr);
            if (sort != null && !sort.equals("hotest")) {
                products = ps.getProductsByCategoryAndSort(categoryId, sort);
            } else {
                products = ps.getProductsByCategory(categoryId);
            }
        }

        //Lọc bán chạy nhất
        Map<Integer, Integer> soldMap = ps.getBestSellingProducts();
        if ("hotest".equals(sort)) {
            ps.sortProductsByHotest(products, soldMap);
        }

        List<Category> categories = cs.getCategoryList();

        // Save into request
        request.setAttribute("products", products);
        request.setAttribute("categories", categories);

        request.setAttribute("currentCategoryId", categoryIdToStr);
        // Bạn nên thêm dòng này để JSP biết đang sort theo cái gì mà tô đậm nút
        request.setAttribute("currentSort", sort);

        request.setAttribute("soldMap", soldMap);
        request.getRequestDispatcher("productList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}