<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/11/2025
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Đăng nhập - Nội thất trẻ em</title>

    <!-- CSS của dự án -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>

    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div class="auth-container">
    <div class="auth-box">

        <!-- ĐĂNG NHẬP -->
        <form id="login-form" class="form active" action="${pageContext.request.contextPath}/login" method="post">
            <h2>Đăng nhập</h2>

            <input type="text" name="username" placeholder="Tên đăng nhập hoặc Email" required/>

            <div class="password-container">
                <input type="password" id="login-password" name="password" placeholder="Mật khẩu" required/>
                <span class="toggle-password"><i class="fa-solid fa-eye"></i></span>
            </div>

            <button type="submit">Đăng nhập</button>

            <p class="switch">
                Chưa có tài khoản? <a href="#" onclick="showForm('register')">Đăng ký</a>
            </p>
            <p class="forgot">
                <a href="#" onclick="showForm('forgot')">Quên mật khẩu?</a>
            </p>
        </form>

        <!-- ĐĂNG KÝ -->
        <form id="register-form" class="form">
            <h2>Đăng ký</h2>
            <input type="text" placeholder="Tên người dùng" required/>
            <input type="email" placeholder="Email" required/>

            <div class="password-container">
                <input type="password" id="register-password" placeholder="Mật khẩu" required/>
                <span class="toggle-password"><i class="fa-solid fa-eye"></i></span>
            </div>

            <div class="password-container">
                <input type="password" id="confirm-password" placeholder="Xác nhận mật khẩu" required/>
                <span class="toggle-password"><i class="fa-solid fa-eye"></i></span>
            </div>

            <p id="password-error" class="error"></p>
            <button type="submit">Tạo tài khoản</button>

            <p class="switch">
                Đã có tài khoản? <a href="#" onclick="showForm('login')">Đăng nhập</a>
            </p>
        </form>

        <!-- QUÊN MẬT KHẨU -->
        <form id="forgot-form" class="form">
            <h2>Quên mật khẩu</h2>
            <input type="email" placeholder="Nhập email của bạn" required/>
            <button type="submit">Gửi liên kết đặt lại</button>

            <p class="switch">
                Quay lại <a href="#" onclick="showForm('login')">Đăng nhập</a>
            </p>
        </form>

    </div>
</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>
