<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
<header class="site-header">
    <!-- 🔹 Thanh trên cùng -->
    <div class="sh-top-bar">
        <div class="sh-header-container sh-top-bar-inner">
            <div class="sh-hotline">
                <span>Hotline: <a href="tel:0964163168" style="font-size: 1rem;">0964 163 168</a></span>
            </div>
            <div class="sh-auth-links">
                <c:choose>
                    <c:when test="${empty sessionScope.USER}">
                        <a href="${pageContext.request.contextPath}/login">Đăng nhập</a> /
                        <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
                    </c:when>

                    <c:otherwise>
                        Xin chào, <strong>${sessionScope.USER.username}</strong>
                        /
                        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- 🔹 Header chính -->
    <div class="sh-header-container main-header">
        <div class="sh-brand">
            <a href="${pageContext.request.contextPath}/home" target="_top" class="sh-logo" aria-label="BabyShop">
        <span class="sh-brand-text sh-multi-logo">
            <span>B</span><span>a</span><span>b</span><span>y</span><span>S</span><span>h</span><span>o</span><span>p</span>
        </span>
            </a>
        </div>

        <!-- Search -->
        <div class="sh-search-wrap">
            <form class="sh-search-form" role="search" aria-label="Tìm sản phẩm">
                <button type="submit" class="sh-search-btn" aria-label="Tìm">
                    🔍
                </button>
                <input
                        type="search"
                        class="sh-search-input"
                        placeholder="Tìm bàn ghế, tủ, đồ chơi..."
                        aria-label="Tìm sản phẩm"
                />
            </form>
        </div>

        <!-- Nav + actions -->
        <nav class="sh-nav-actions">
            <ul class="sh-nav-links">
                <li><a href="${pageContext.request.contextPath}/home" target="_top">Trang chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/product-list" target="_top">Danh sách sản phẩm</a></li>
                <li><a href="${pageContext.request.contextPath}/news" target="_top">Tin tức</a></li>
                <li><a href="${pageContext.request.contextPath}/voucher-list" target="_top">Ưu đãi</a></li>
                <li><a href="${pageContext.request.contextPath}/contact" target="_top">Liên hệ</a></li>
            </ul>

            <div class="sh-actions">
                <a href="${pageContext.request.contextPath}/profile" target="_top" class="account" aria-label="Tài khoản">👤</a>
                <a href="${pageContext.request.contextPath}/cart" target="_top" class="cart" aria-label="Giỏ hàng">
                    🛒<span class="sh-cart-badge" aria-hidden="true">2</span>
                </a>

                <!-- Hamburger -->
                <button class="sh-hamburger" aria-label="Mở menu" aria-expanded="false">
                    <span class="bar"></span>
                    <span class="bar"></span>
                    <span class="bar"></span>
                </button>
            </div>
        </nav>
    </div>

    <!-- 🔹 Mobile menu -->
    <div class="sh-mobile-menu" aria-hidden="true">
        <form class="sh-mobile-search" role="search">
            <input type="search" placeholder="Tìm sản phẩm..."/>
        </form>
        <ul class="sh-mobile-links">
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

