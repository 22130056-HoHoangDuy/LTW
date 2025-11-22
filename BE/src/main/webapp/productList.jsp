<%--
  Created by IntelliJ IDEA.
  User: lamdo
  Date: 11/14/2025
  Time: 7:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Danh sách sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}//css/productList.css"/>
    <link
            rel="stylesheet"
            href="../fontawesome-free-7.1.0-web/css/all.min.css"
    />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

<jsp:include page="header.jsp"/>

<nav>
    <a href="<c:url value='/'/>">Home</a>
    <span class="dot">•</span>
    <a href="<c:url value='/products'/>">Danh sách sản phẩm</a>
</nav>

<div class="image-slider">
    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="../img/slider_product_list.jpg" class="d-block w-100" alt="Hình ảnh bị lỗi">
            </div>
            <div class="carousel-item">
                <img src="../img/slider_product_list_2.png" class="d-block w-100" alt="Hình ảnh bị lỗi">
            </div>
            <div class="carousel-item">
                <img src="../img/slider_product_list_3.jpg" class="d-block w-100" alt="Hình ảnh bị lỗi">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<div class="filter-box">
    <div class="filter-demand-group">
        <h4>Chọn theo nhu cầu</h4>
        <div class="demand-group">
            <div class="img-button">
                <a href="">
                    <img
                            src="../img/combo-ban-hoc-thong-minh2-nc.jpg"
                            alt="Hình ảnh bị lỗi"
                    />
                    <span>ĐỒ NỘI THẤT</span>
                </a>
            </div>
            <div class="img-button">
                <a href="">
                    <img
                            src="../img/trang_tri/tranh-treo-tuong-trang-guong-129-100x100.jpg"
                            alt="Hình ảnh bị lỗi"
                    />
                    <span>ĐỒ TRANG TRÍ</span>
                </a>
            </div>
            <div class="img-button">
                <a href="">
                    <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                    <span>ĐỒ CHƠI</span>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="filter-box">
    <div class="filter-group">
        <h4>Chọn theo tiêu chí</h4>
        <button type="button" class="filter-btn">Thương hiệu</button>
        <button type="button" class="filter-btn">Giá tiền</button>
        <button type="button" class="filter-btn">Kích thước</button>
        <button type="button" class="filter-btn">Màu sắc</button>
        <button type="button" class="filter-btn">Chất liệu</button>
    </div>

    <div class="filter-group">
        <h4>Sắp xếp theo</h4>
        <button type="button" class="filter-btn">Giá tăng dần</button>
        <button type="button" class="filter-btn">Giá giảm dần</button>
        <button type="button" class="filter-btn">Mới nhất</button>
        <button type="button" class="filter-btn">Cũ nhất</button>
        <button type="button" class="filter-btn">Tên A-Z</button>
        <button type="button" class="filter-btn">Tên Z-A</button>
    </div>

    <button type="button" class="filter-btn remove-btn">Xóa lọc</button>
</div>

<div class="container">
<h1>Danh sách sản phẩm</h1>
<div class="product-list">
<!-- Lặp danh sách sản phẩm -->
<c:forEach var="product" items="${products}">
    <div class="product">
        <a href="<c:url value='/productDetail?id=${product.id}'/>">
            <img alt="Ảnh bị lỗi" src="${product.imageUrl}"/>
        </a>
        <h3>${product.name}</h3>

        <!-- Nếu price là số, bạn có thể format, còn không thì in thẳng -->
        <p class="price">
                ${product.price}đ
        </p>

        <a class="filter-btn cart-btn"
           href="<c:url value='/cart/add?id=${product.id}'/>"
           title="Thêm vào giỏ hàng">
            <i class="fa-solid fa-cart-plus"></i>
        </a>

        <a class="filter-btn detail-btn"
           href="<c:url value='/productDetail?id=${product.id}'/>"
           title="Xem chi tiết">
            <i class="fa-solid fa-eye"></i>
        </a>

        <a class="filter-btn favor-btn"
           href="<c:url value='/favorite/add?id=${product.id}'/>"
           title="Thêm vào danh sách yêu thích">
            <i class="fa-solid fa-heart"></i>
        </a>

        <div class="product-stats">
            <div class="product-rating">
                <!-- Tạm fix 5 sao, hoặc render theo product.rating -->
                <span class="stars">★★★★★</span>
                <a class="reviews" href="#"></a>
            </div>
            <div>
                Đã bán
                <span>
                            <c:out value="${product.sold}"/>
                        </span>
            </div>
        </div>
    </div>
</c:forEach>

<!-- Trường hợp không có sản phẩm -->
<c:if test="${empty products}">
    <p>Không có sản phẩm

    <button type="button" id="backToTop" title="Back To Top">
    <i class="fa-solid fa-arrow-up"></i>
    </button>
    <div class="pagination">
    <a href="#" class="prev-page">&laquo;</a>
    <a href="#" class="page-number active">1</a>
    <a href="#" class="page-number">2</a>
    <a href="#" class="page-number">3</a>
    <a href="#" class="next-page">&raquo;</a>
    </div>
    </div>
    <iframe src="footer.html" id="footer-frame"></iframe>
    <script src="../js/productList.js"></script>

    </body> </html>
