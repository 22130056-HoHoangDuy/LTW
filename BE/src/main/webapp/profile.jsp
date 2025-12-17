<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/11/2025
  Time: 12:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thông tin cá nhân</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
</head>

<body>
<jsp:include page="header.jsp"/>
<div class="pf-page">

    <nav class="pf-breadcrumb">
        <a href="${pageContext.request.contextPath}/home">Home</a>
        <span class="dot">•</span>
        <span>Thông tin cá nhân</span>
    </nav>

    <div class="pf-container">

        <!-- SIDEBAR -->
        <aside class="pf-sidebar">
            <h2>Xin chào, ${sessionScope.USER.username}</h2>
            <ul>
                <li class="active" id="pf-btn-info">Thông tin cá nhân</li>
                <li id="pf-btn-orders">Đơn hàng đã mua</li>
                <li id="pf-btn-favorite">Yêu thích</li>
                <li id="pf-btn-change-pass">Đổi mật khẩu</li>
            </ul>
        </aside>

        <!-- CONTENT -->
        <main class="pf-content">

            <section class="pf-section pf-section-active">
                <h3>Thông tin cá nhân</h3>

                <div class="pf-info-box">
                    <div class="pf-info">

                        <!-- AVATAR -->
                        <div class="pf-avatar">
                            <img src="${empty PROFILE.avatarUrl ? 'https://img.lovepik.com/png/20231108/avatar-the-last-airbender-coloring-pages-outline-sketch-drawing-vector_526906_wh860.png': PROFILE.avatarUrl}" />

                            <label for="pf-avatar-upload" class="pf-upload-btn">
                                Tải ảnh lên
                            </label>
                            <input type="file"
                                   id="pf-avatar-upload"
                                   accept="image/*"
                                   hidden>
                        </div>

                        <!-- FORM -->
                        <form class="pf-form"
                              method="post"
                              action="${pageContext.request.contextPath}/profile">

                            <div class="pf-form-group">
                                <label>Họ và tên</label>
                                <input type="text" name="fullName"
                                       value="${PROFILE.fullName}">
                            </div>

                            <div class="pf-form-group">
                                <label>Email</label>
                                <input type="email"
                                       value="${PROFILE.email}" disabled>
                            </div>

                            <div class="pf-form-group">
                                <label>Số điện thoại</label>
                                <input type="text" name="phone"
                                       value="${PROFILE.phone}">
                            </div>

                            <div class="pf-form-group">
                                <label>Địa chỉ</label>
                                <input type="text" name="address"
                                       value="${PROFILE.address}">
                            </div>

                            <div class="pf-form-group">
                                <label>Giới tính</label>
                                <select name="gender">
                                    <option value="MALE"
                                    ${PROFILE.gender == 'MALE' ? 'selected' : ''}>
                                        Nam
                                    </option>

                                    <option value="FEMALE"
                                    ${PROFILE.gender == 'FEMALE' ? 'selected' : ''}>
                                        Nữ
                                    </option>
                                </select>
                            </div>

                            <div class="pf-form-group">
                                <label>Ngày sinh</label>
                                <input type="date" name="birthDate"
                                       value="${PROFILE.birthDate}">
                            </div>

                            <button id="pf-save-btn" type="submit">
                                Lưu thay đổi
                            </button>
                        </form>

                    </div>
                </div>
            </section>

        </main>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/profile.js"></script>
</body>
</html>

