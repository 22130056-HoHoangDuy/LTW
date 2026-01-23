<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vn.edu.nlu.fit.be.model.AccountStatus" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin - Quản lý tài khoản</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_chart.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<div class="dashboard">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <nav class="menu">
            <a href="${pageContext.request.contextPath}/admin/overview"><i class="fa-solid fa-house"></i><span>Dashboard</span></a>
            <a href="${pageContext.request.contextPath}/admin/accounts" class="active"><i class="fa-solid fa-user"></i><span>Tài khoản</span></a>
            <a href="${pageContext.request.contextPath}/admin/orders"><i class="fa-solid fa-box"></i><span>Đơn hàng</span></a>
            <a href="${pageContext.request.contextPath}/admin/products"><i class="fa-solid fa-cubes"></i><span>Sản phẩm</span></a>
            <a href="${pageContext.request.contextPath}/admin/categories"><i class="fa-solid fa-layer-group"></i><span>Danh mục sản phẩm</span></a>
            <a href="${pageContext.request.contextPath}/admin/brands"><i class="fa-solid fa-tags"></i><span>Thương hiệu</span></a>
            <a href="${pageContext.request.contextPath}/admin/contacts"><i class="fa-solid fa-envelope"></i><span>Liên hệ</span></a>
            <a href="${pageContext.request.contextPath}/admin/stocks"><i class="fa-solid fa-warehouse"></i><span>Kho</span></a>
            <a href="${pageContext.request.contextPath}/admin/vouchers"><i class="fa-solid fa-ticket"></i><span>Vouchers</span></a>
            <a href="${pageContext.request.contextPath}/admin/settings"><i class="fa-solid fa-gear"></i><span>Cài đặt</span></a>
        </nav>
    </aside>

    <!-- CONTENT -->
    <div class="content-wrapper">
        <main class="main">
            <h2>Quản lý tài khoản</h2>

            <!-- ADD FORM -->
            <form action="${pageContext.request.contextPath}/admin/accounts/add" method="post" class="add-form">
                <input type="text" name="username" placeholder="Username" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <select name="role">
                    <option value="0">User</option>
                    <option value="1">Admin</option>
                </select>
                <button type="submit">➕ Thêm tài khoản</button>
            </form>

            <!-- TABLE -->
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th>Vai trò</th>
                    <th>Hành động</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="a" items="${accounts}">
                    <tr class="account-row"
                        data-id="${a.accountId}"
                        onmouseenter="showProfile(this)"
                        onmouseleave="hideProfile()">

                        <td>${a.accountId}</td>
                        <td>${a.username}</td>
                        <td>${a.email}</td>
                        <td>${a.createdAt}</td>

                        <td>
                            <form action="${pageContext.request.contextPath}/admin/accounts/status"
                                  method="post">
                                <input type="hidden" name="id" value="${a.accountId}"/>

                                <select name="status" onchange="this.form.submit()">
                                    <option value="Active" ${a.status == 'Active' ? 'selected' : ''}>
                                        Active
                                    </option>
                                    <option value="UnActive" ${a.status == 'UnActive' ? 'selected' : ''}>
                                        UnActive
                                    </option>
                                </select>
                            </form>
                        </td>

                        <td>
                            <c:choose>
                                <c:when test="${a.role == 1}">Admin</c:when>
                                <c:when test="${a.role == 0}">User</c:when>
                                <c:otherwise>Khóa</c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <form action="${pageContext.request.contextPath}/admin/accounts/delete"
                                  method="post"
                                  onsubmit="return confirm('Xóa tài khoản này?');">
                                <input type="hidden" name="id" value="${a.accountId}">
                                <button type="submit">🗑</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </main>

        <aside class="right-panel"></aside>
    </div>
</div>
<!-- PROFILE POPUP -->
<div id="profile-popup" class="profile-popup"></div>
<!-- JS -->
<script>
    const contextPath = '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/js/admin_script.js"></script>
</body>
</html>
