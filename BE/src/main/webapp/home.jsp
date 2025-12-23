<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/11/2025
  Time: 12:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BabyShop Việt Nam</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<!-- Banner chính -->
<section class="hero">
    <div class="hero-content">
        <img src="${pageContext.request.contextPath}/img/banner/banner.png" class="banner-img" alt="Banner">
        <div class="hero-text">
            <h1>Chào mừng bé yêu đến với thế giới diệu kỳ</h1>
            <p>Sản phẩm an toàn - Chất lượng quốc tế - Giá cả yêu thương</p>
        </div>
        <div class="hero-overlay"></div>
    </div>
</section>
<!-- Danh mục sản phẩm -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="category">
    <h2>DANH MỤC SẢN PHẨM</h2>

    <div class="category-grid">
        <c:forEach items="${categories}" var="c">
            <div class="cat-item">

                <a href="product-list?category_id=${c.categoryId}">
                    <img src="${c.categoryImg}" alt="${c.categoryName}">

                </a>
                <p>${c.categoryName}</p>
            </div>
        </c:forEach>
    </div>
</section>


<!-- Giới thiệu -->
<section class="intro">
    <img src="${pageContext.request.contextPath}/img/banner/intro.jpg" alt="CEO">
</section>

<!-- Chính sách -->
<section class="policies">
    <div class="policy-item">
        <i class="fa-solid fa-shield-halved"></i>
        <div class="policy-text">
            <h4>Bảo hành chính hãng</h4>
            <p>Cam kết 100%</p>
        </div>
    </div>
    <div class="policy-item">
        <i class="fa-solid fa-wrench"></i>
        <div class="policy-text">
            <h4>Bảo trì trọn đời</h4>
            <p>Hỗ trợ 24/7</p>
        </div>
    </div>
    <div class="policy-item">
        <i class="fa-solid fa-truck-fast"></i>
        <div class="policy-text">
            <h4>Miễn phí vận chuyển</h4>
            <p>Đơn từ 500k</p>
        </div>
    </div>
    <div class="policy-item">
        <i class="fa-solid fa-gift"></i>
        <div class="policy-text">
            <h4>Quà tặng hấp dẫn</h4>
            <p>Cho thành viên mới</p>
        </div>
    </div>
</section>

<!-- Combo nổi bật -->
<section class="section">
    <h2>ĐỒ NỘI THẤT MỚI NHẤT</h2>
    <div class="carousel-wrapper">
        <button class="carousel-btn prev"><i class="fa-solid fa-chevron-left"></i></button>
        <div class="carousel-track">
            <div class="product-grid">
                <c:forEach items="${NoiThatMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImg}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price">
                            <fmt:formatNumber value="${p.productPrice}" type="number"/>đ
                        </p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a class="filter-btn detail-btn"
                               href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#">
                                <i class="fa-solid fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button class="carousel-btn next"><i class="fa-solid fa-chevron-right"></i></button>
    </div>
</section>


<section class="section">
    <h2>ĐỒ TRANG TRÍ MỚI NHẤT</h2>
    <div class="carousel-wrapper">
        <button class="carousel-btn prev"><i class="fa-solid fa-chevron-left"></i></button>

        <div class="carousel-track">
            <div class="product-grid">
                <c:forEach items="${TrangTriMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImg}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price">
                            <fmt:formatNumber value="${p.productPrice}" type="number"/>đ
                        </p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a class="filter-btn detail-btn"
                               href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#">
                                <i class="fa-solid fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <button class="carousel-btn next"><i class="fa-solid fa-chevron-right"></i></button>
    </div>
</section>

<section class="section">
    <h2>ĐỒ CHƠI MỚI NHẤT</h2>
    <div class="carousel-wrapper">
        <button class="carousel-btn prev"><i class="fa-solid fa-chevron-left"></i></button>

        <div class="carousel-track">
            <div class="product-grid">
                <c:forEach items="${DoChoiMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImg}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price">
                            <fmt:formatNumber value="${p.productPrice}" type="number"/>đ
                        </p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a class="filter-btn detail-btn"
                               href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#">
                                <i class="fa-solid fa-heart"></i>
                            </a>
                        </div>
                    </div>
<<<<<<< HEAD
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">7.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
                <div class="product-card">
                    <div class="product-img">
                        <a href="../html/productDetail.html">
                            <img src="../img/do_choi/do_choi.jpg" alt="Hình ảnh bị lỗi"/>
                        </a>
                    </div>
                    <h4 class="product-title">Bộ bàn ghế học sinh chống gù 001</h4>
                    <p class="price">6.500.000đ</p>
                    <div class="product-actions">
                        <a class="filter-btn cart-btn" href="#" title="Thêm vào giỏ hàng">
                            <i class="fa-solid fa-cart-plus"></i>
                        </a>
                        <a class="filter-btn detail-btn" href="../html/productDetail.html" title="Xem chi tiết">
                            <i class="fa-solid fa-eye"></i>
                        </a>
                        <a class="filter-btn favor-btn" href="#" title="Yêu thích">
                            <i class="fa-solid fa-heart"></i>
                        </a>
                    </div>
                    <div class="product-stats">
                        <div class="product-rating">
                            <span class="stars">★★★★★</span>
                            <a class="reviews" href="#">(0 đánh giá)</a>
                        </div>
                        <div class="sold">
                            Đã bán <span>513</span>
                        </div>
                    </div>
                </div>
=======
                </c:forEach>
>>>>>>> 8206abee2ef10aa385597da95830ab388c31e449
            </div>
        </div>

        <button class="carousel-btn next"><i class="fa-solid fa-chevron-right"></i></button>
    </div>
</section>

<jsp:include page="footer.jsp"/>

</body>
<script>

    document.querySelectorAll('.carousel-wrapper').forEach(wrapper => {
        const track = wrapper.querySelector('.carousel-track');
        const grid = wrapper.querySelector('.product-grid');
        const prev = wrapper.querySelector('.carousel-btn.prev');
        const next = wrapper.querySelector('.carousel-btn.next');

        const cards = Array.from(grid.children);
        const cardsPerSlide = 6;
        const slideCount = Math.ceil(cards.length / cardsPerSlide);

        // Tạo slides
        const slides = [];
        for (let i = 0; i < slideCount; i++) {
            const slide = document.createElement('div');
            slide.classList.add('carousel-slide');
            cards.slice(i * cardsPerSlide, (i + 1) * cardsPerSlide)
                .forEach(card => slide.appendChild(card));
            slides.push(slide);
        }

        grid.remove();
        slides.forEach(slide => track.appendChild(slide));

        let currentIndex = 0;
        function updateCarousel() {
            track.style.transform = `translateX(-${currentIndex * 100}%)`;
        }

        next.addEventListener('click', () => {
            if(currentIndex < slides.length - 1){
                currentIndex++;
                updateCarousel();
            }
        });

        prev.addEventListener('click', () => {
            if(currentIndex > 0){
                currentIndex--;
                updateCarousel();
            }
        });
    });

</script>

</html>
