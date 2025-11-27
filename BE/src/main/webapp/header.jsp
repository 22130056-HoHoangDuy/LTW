<%--
  Created by IntelliJ IDEA.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="vi">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8"/>--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>--%>
<%--    <title>Header - Nội thất trẻ em</title>--%>
<%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>--%>
<%--</head>--%>
<%--<body>--%>
<!-- HEADER -->
<header class="site-header">
    <!-- 🔹 Thanh trên cùng -->
    <div class="top-bar">
        <div class="header-container top-bar-inner">
            <div class="hotline">
                <span>Hotline: <a href="tel:0964163168">0964 163 168</a></span>
            </div>
            <div class="auth-links">
                <a href="../html/login.html" target="_top">Đăng nhập</a> / <a href="../html/login.html?form=register"
                                                                              target="_top">Đăng ký</a>
            </div>
        </div>
    </div>

    <!-- 🔹 Header chính -->
    <div class="header-container main-header">
        <div class="brand">
            <a href="../html/home.html" target="_top" class="logo" aria-label="BabyShop">
        <span class="brand-text multi-logo">
            <span>B</span><span>a</span><span>b</span><span>y</span><span>S</span><span>h</span><span>o</span><span>p</span>
        </span>
            </a>
        </div>

        <!-- Search -->
        <div class="search-wrap">
            <form class="search-form" role="search" aria-label="Tìm sản phẩm">
                <button type="submit" class="search-btn" aria-label="Tìm">
                    🔍
                </button>
                <input
                        type="search"
                        class="search-input"
                        placeholder="Tìm bàn ghế, tủ, đồ chơi..."
                        aria-label="Tìm sản phẩm"
                />
            </form>
        </div>

        <!-- Nav + actions -->
        <nav class="nav-actions">
            <ul class="nav-links">
                <li><a href="../html/home.html" target="_top">Trang chủ</a></li>
                <li><a href="../html/productList.html" target="_top">Danh sách sản phẩm</a></li>
                <li><a href="../html/news.html" target="_top">Tin tức</a></li>
                <li><a href="../html/voucherList.html" target="_top">Ưu đãi</a></li>
                <li><a href="../html/contact.html" target="_top">Liên hệ</a></li>
            </ul>

            <div class="actions">
                <a href="../html/profile.html" target="_top" class="account" aria-label="Tài khoản">👤</a>
                <a href="../html/cart.html" target="_top" class="cart" aria-label="Giỏ hàng">
                    🛒<span class="cart-badge" aria-hidden="true">2</span>
                </a>

                <!-- Hamburger -->
                <button class="hamburger" aria-label="Mở menu" aria-expanded="false">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </button>
            </div>
        </nav>
    </div>

    <!-- 🔹 Mobile menu -->
    <div class="mobile-menu" aria-hidden="true">
        <form class="mobile-search" role="search">
            <input type="search" placeholder="Tìm sản phẩm..."/>
        </form>
        <ul class="mobile-links">
            <li><a href="#">Trang chủ</a></li>
            <li><a href="#">Danh sách sản phẩm</a></li>
            <li><a href="#">Tin tức</a></li>
            <li><a href="#">Ưu đãi</a></li>
            <li><a href="#">Liên hệ</a></li>
            <li><a href="../html/profile.html" target="_top">Tài khoản</a></li>
            <li><a href="#">Giỏ hàng</a></li>
        </ul>
    </div>
</header>
<%--</body>--%>
<%--</html>--%>

