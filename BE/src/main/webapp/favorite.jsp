<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 19/12/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sản phẩm yêu thích</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

    <!-- DÙNG CHUNG CSS PROFILE -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/profile.css">
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="pf-page">

    <!-- BREADCRUMB -->
    <nav class="pf-breadcrumb">
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <span class="dot">•</span>
        <span>Yêu thích</span>
    </nav>

    <div class="pf-container">

        <!-- SIDEBAR -->
        <aside class="pf-sidebar">
            <h2>Xin chào, ${sessionScope.USER.username}</h2>
            <ul>
                <li onclick="location.href='${pageContext.request.contextPath}/profile'">
                    Thông tin cá nhân
                </li>
                <li>Đơn hàng đã mua</li>
                <li class="active">Yêu thích</li>
                <li>Đổi mật khẩu</li>
            </ul>
        </aside>

        <!-- CONTENT -->
        <main class="pf-content">

            <section class="pf-section pf-section-active">
                <h3>Sản phẩm yêu thích</h3>

                <c:if test="${empty FAVORITES}">
                    <p>Bạn chưa có sản phẩm yêu thích</p>
                </c:if>

                <div class="pf-favorite-list">
                    <c:forEach items="${FAVORITES}" var="f">
                        <div class="pf-favorite-row">

                            <img src="${f.productImage}"
                                 alt="${f.productName}">

                            <div class="pf-fav-info">
                                <h4>${f.productName}</h4>
                                <div class="pf-fav-price">
                                        ${f.price}₫
                                </div>
                            </div>

                            <form method="post"
                                  action="${pageContext.request.contextPath}/favorite/remove">
                                <input type="hidden"
                                       name="productId"
                                       value="${f.productId}">
                                <button class="pf-remove-fav">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </form>

                        </div>
                    </c:forEach>
                </div>

            </section>

        </main>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
