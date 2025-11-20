<%--
  Created by IntelliJ IDEA.
  User: lamdo
  Date: 11/14/2025
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css"/>

<!-- HEADER -->
<header class="site-header">
    <!-- 🔹 Thanh trên cùng -->
    <div class="top-bar">
        <div class="container top-bar-inner">
            <div class="hotline">
                <span>Hotline: <a href="tel:0964163168">0964 163 168</a></span>
            </div>
            <div class="auth-links">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <span>Xin chào, ${sessionScope.user.name}</span> /
                        <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a> /
                        <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- 🔹 Header chính -->
    <div class="container main-header">
        <div class="brand">
            <a href="${pageContext.request.contextPath}/index.jsp" class="logo" aria-label="BabyShop">
                <span class="brand-text multi-logo">
                    <span>B</span><span>a</span><span>b</span><span>y</span>
                    <span>S</span><span>h</span><span>o</span><span>p</span>
                </span>
            </a>
        </div>

        <!-- Search -->
        <div class="search-wrap">
            <form class="search-form" action="${pageContext.request.contextPath}/products/search" method="get"
                  role="search" aria-label="Tìm sản phẩm">
                <button type="submit" class="search-btn" aria-label="Tìm">
                    🔍
                </button>
                <input
                        type="search"
                        name="keyword"
                        class="search-input"
                        placeholder="Tìm bàn ghế, tủ, đồ chơi..."
                        aria-label="Tìm sản phẩm"
                        value="${param.keyword}"
                />
            </form>
        </div>

        <!-- Nav + actions -->
        <nav class="nav-actions">
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/products/list">Sản phẩm</a></li>
                <li><a href="${pageContext.request.contextPath}/collections">Bộ sưu tập</a></li>
                <li><a href="${pageContext.request.contextPath}/promotions">Ưu đãi</a></li>
                <li><a href="${pageContext.request.contextPath}/contact.jsp">Liên hệ</a></li>
            </ul>

            <div class="actions">
                <a href="${pageContext.request.contextPath}/account" class="account" aria-label="Tài khoản">👤</a>
                <a href="${pageContext.request.contextPath}/cart" class="cart" aria-label="Giỏ hàng">
                    🛒
                    <c:if test="${not empty sessionScope.cartCount && sessionScope.cartCount > 0}">
                        <span class="cart-badge" aria-hidden="true">${sessionScope.cartCount}</span>
                    </c:if>
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
        <form class="mobile-search" action="${pageContext.request.contextPath}/products/search" method="get"
              role="search">
            <input type="search" name="keyword" placeholder="Tìm sản phẩm..." value="${param.keyword}"/>
        </form>
        <ul class="mobile-links">
            <li><a href="${pageContext.request.contextPath}/index.jsp">Trang chủ</a></li>
            <li><a href="${pageContext.request.contextPath}/products/list">Sản phẩm</a></li>
            <li><a href="${pageContext.request.contextPath}/collections">Bộ sưu tập</a></li>
            <li><a href="${pageContext.request.contextPath}/promotions">Ưu đãi</a></li>
            <li><a href="${pageContext.request.contextPath}/contact.jsp">Liên hệ</a></li>
            <li><a href="${pageContext.request.contextPath}/account">Tài khoản</a></li>
            <li>
                <a href="${pageContext.request.contextPath}/cart">
                    Giỏ hàng
                    <c:if test="${not empty sessionScope.cartCount}">
                        (${sessionScope.cartCount})
                    </c:if>
                </a>
            </li>
        </ul>
    </div>
</header>

<!-- JS -->
<script>
    (function () {
        const hamburger = document.querySelector(".hamburger");
        const mobileMenu = document.querySelector(".mobile-menu");

        hamburger?.addEventListener("click", function () {
            const expanded = this.getAttribute("aria-expanded") === "true";
            this.setAttribute("aria-expanded", String(!expanded));
            mobileMenu.style.display = expanded ? "none" : "block";
            mobileMenu.setAttribute("aria-hidden", expanded ? "true" : "false");
        });

        document.addEventListener("click", function (e) {
            if (!e.target.closest(".site-header")) {
                mobileMenu.style.display = "none";
                hamburger.setAttribute("aria-expanded", "false");
            }
        });
    })();
</script>
