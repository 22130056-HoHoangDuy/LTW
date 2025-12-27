<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Đăng ký - Nội thất trẻ em</title>

            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
                integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
        </head>

        <body>
            <div class="auth-container">
                <div class="auth-box">

                    <form class="form active" action="${pageContext.request.contextPath}/register" method="post">

                        <h2>Đăng ký</h2>

                        <c:if test="${not empty error}">
                            <p class="error">${error}</p>
                        </c:if>

                        <div class="input-group">
                            <input type="text" name="username" id="username" placeholder="Tên người dùng" required />
                            <i class="fa-solid fa-user"></i>
                        </div>

                        <div class="input-group">
                            <input type="email" name="email" id="email" placeholder="Email" required />
                            <i class="fa-solid fa-envelope"></i>
                        </div>

                        <div class="password-container">
                            <div class="input-group">
                                <input type="password" name="password" id="password" placeholder="Mật khẩu" required />
                                <i class="fa-solid fa-lock"></i>
                            </div>
                            <span class="toggle-password">
                                <i class="fa-solid fa-eye"></i>
                            </span>
                        </div>

                        <div class="password-container">
                            <div class="input-group">
                                <input type="password" name="confirmPassword" id="confirmPassword"
                                    placeholder="Xác nhận mật khẩu" required />
                                <i class="fa-solid fa-lock"></i>
                            </div>
                            <span class="toggle-password">
                                <i class="fa-solid fa-eye"></i>
                            </span>
                        </div>

                        <button type="submit">Tạo tài khoản</button>

                        <p class="switch">
                            Đã có tài khoản?
                            <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
                        </p>

                    </form>

                </div>
            </div>

            <script src="${pageContext.request.contextPath}/js/toggle-password.js"></script>
        </body>

        </html>