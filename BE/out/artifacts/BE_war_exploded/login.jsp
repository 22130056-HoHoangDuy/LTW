<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Đăng nhập - Nội thất trẻ em</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>
<div class="auth-container">
    <div class="auth-box">

        <form class="form active"
              action="${pageContext.request.contextPath}/login"
              method="post">

            <h2>Đăng nhập</h2>

            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>

            <input type="text" name="username"
                   placeholder="Tên đăng nhập hoặc Email" required/>

            <div class="password-container">
                <input type="password" name="password"
                       placeholder="Mật khẩu" required/>
                <span class="toggle-password">
                    <i class="fa-solid fa-eye"></i>
                </span>
            </div>

            <button type="submit">Đăng nhập</button>

            <p class="switch">
                Chưa có tài khoản?
                <a href="${pageContext.request.contextPath}/register">Đăng ký</a>
            </p>

        </form>

    </div>
</div>

<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>
