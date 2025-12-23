<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Admin - Quản lý sản phẩm</title>

    <!-- FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>

    <!-- JS LIB -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<div class="dashboard">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <nav class="menu">
            <a href="${pageContext.request.contextPath}/admin/overview">
                <i class="fa-solid fa-house"></i>
                <span>Dashboard</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/orders">
                <i class="fa-solid fa-box"></i>
                <span>Đơn hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/accounts">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/products" class="active">
                <i class="fa-solid fa-cube"></i>
                <span>Sản phẩm</span>
            </a>
        </nav>
    </aside>

    <!-- CONTENT -->
    <div class="content-wrapper">

        <main class="main">
            <h2>Quản lý sản phẩm</h2>

            <div class="product-header">
                <button class="btn-primary add-product-btn" id="openOverlay">
                    <i class="fa-solid fa-plus"></i> Thêm sản phẩm
                </button>

                <div class="search-box">
                    <input type="text" placeholder="Tìm kiếm sản phẩm...">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
            </div>

            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên sản phẩm</th>
                    <th>Danh mục</th>
                    <th>Giá</th>
                    <th>Hành động</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="p" items="${products}">
                    <tr>
                        <td>${p.productId}</td>
                        <td>${p.name}</td>
                        <td>${p.categoryName}</td>
                        <td>${p.price}</td>
                        <td>
                            <button class="btn-small btn-on">Sửa</button>
                            <button class="btn-small btn-delete">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </main>

        <aside class="right-panel"></aside>
    </div>
</div>

<!-- PRODUCT OVERLAY -->
<div class="product-overlay" id="productOverlay">
    <div class="product-modal">
        <h3>Thêm sản phẩm mới</h3>

        <form method="post" action="${pageContext.request.contextPath}/admin/products/create">
            <div class="form-grid">

                <div class="form-item">
                    <label>Tên sản phẩm</label>
                    <input type="text" name="name" required/>
                </div>

                <div class="form-item">
                    <label>Giá</label>
                    <input type="number" name="price" required/>
                </div>

                <div class="form-item">
                    <label>Danh mục</label>
                    <select name="categoryId">
                        <c:forEach var="c" items="${categories}">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-item textarea-full">
                    <label>Mô tả</label>
                    <textarea name="description"></textarea>
                </div>
            </div>

            <div class="modal-actions">
                <button class="btn-primary">Thêm sản phẩm</button>
                <button type="button" class="btn-small btn-delete" id="closeOverlay">Hủy</button>
            </div>
        </form>
    </div>
</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/js/admin_script.js"></script>

</body>
</html>
