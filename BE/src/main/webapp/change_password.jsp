<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 19/12/2025
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đổi mật khẩu</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css">

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
        <span>Đổi mật khẩu</span>
    </nav>

    <div class="pf-container">

        <!-- SIDEBAR -->
        <aside class="pf-sidebar">
            <h2>Xin chào, ${sessionScope.USER.username}</h2>
            <ul>
                <li onclick="location.href='${pageContext.request.contextPath}/profile'">Thông tin cá nhân</li>
                <li>Đơn hàng đã mua</li>
                <li onclick="location.href='${pageContext.request.contextPath}/my-favorite'">Yêu thích</li>
                <li class="active">Đổi mật khẩu</li>
            </ul>
        </aside>

        <!-- CONTENT -->
        <main class="pf-content">

            <section class="pf-section pf-section-active">
                <h3>Đổi mật khẩu</h3>

                <div class="pf-password-box">

                    <!-- MESSAGE -->
                    <c:if test="${not empty error}">
                        <p style="color:red">${error}</p>
                    </c:if>

                    <c:if test="${not empty success}">
                        <p style="color:green">${success}</p>
                    </c:if>

                    <!-- FORM -->
                    <form class="pf-password-form"
                          method="post"
                          action="${pageContext.request.contextPath}/change-password">

                        <div class="pf-form-group">
                            <label>Mật khẩu hiện tại</label>
                            <input type="password" name="oldPassword" required>
                        </div>

                        <div class="pf-form-group">
                            <label>Mật khẩu mới</label>
                            <input type="password" name="newPassword" required>
                        </div>

                        <div class="pf-form-group">
                            <label>Xác nhận mật khẩu mới</label>
                            <input type="password" name="confirmPassword" required>
                        </div>

                        <button id="pf-change-pass-btn" type="submit">
                            Đổi mật khẩu
                        </button>
                    </form>

                </div>
            </section>

        </main>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>

