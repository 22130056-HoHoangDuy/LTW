<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin - Quản lý kho hàng</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
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

            <a href="${pageContext.request.contextPath}/admin/accounts">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/orders">
                <i class="fa-solid fa-box"></i>
                <span>Đơn hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/products">
                <i class="fa-solid fa-cubes"></i>
                <span>Sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/categories">
                <i class="fa-solid fa-layer-group"></i>
                <span>Danh mục sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/brands">
                <i class="fa-solid fa-tags"></i>
                <span>Thương hiệu</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/contacts">
                <i class="fa-solid fa-envelope"></i>
                <span>Liên hệ</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/warehouse" class="active">
                <i class="fa-solid fa-warehouse"></i>
                <span>Kho hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/vouchers">
                <i class="fa-solid fa-ticket"></i>
                <span>Vouchers</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/settings">
                <i class="fa-solid fa-gear"></i>
                <span>Cài đặt</span>
            </a>
        </nav>
    </aside>

    <!-- CONTENT -->
    <div class="content-wrapper">
        <main class="main">
            <h2>Quản lý kho hàng</h2>

            <!-- FORM THÊM KHO -->
            <section class="voucher-form">
                <h3>Thêm kho mới</h3>

                <form class="form-grid" action="${pageContext.request.contextPath}/admin/warehouse/add" method="post">
                    <div class="form-item">
                        <label>Tên kho</label>
                        <input type="text" name="name" placeholder="Ví dụ: Kho Hà Nội" required>
                    </div>

                    <div class="form-item">
                        <label>Địa chỉ</label>
                        <input type="text" name="address" placeholder="123 Nguyễn Trãi, Hà Nội" required>
                    </div>

                    <button type="submit" class="btn-primary">Thêm kho hàng</button>
                </form>
            </section>

            <!-- DANH SÁCH KHO -->
            <section class="voucher-list">
                <h3>Danh sách kho hàng</h3>

                <table class="data-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên kho</th>
                        <th>Địa chỉ</th>
                        <th>Số lượng SP</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>

                    <tbody>
                    <!-- Lặp danh sách kho từ Servlet -->
                    <c:forEach var="warehouse" items="${warehouses}">
                        <tr>
                            <td>${warehouse.id}</td>
                            <td>${warehouse.name}</td>
                            <td>${warehouse.address}</td>
                            <td>${warehouse.productCount}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/warehouse/view" method="get" style="display:inline;">
                                    <input type="hidden" name="id" value="${warehouse.id}">
                                    <button type="submit" class="btn-small btn-on">Xem</button>
                                </form>
                                <form action="${pageContext.request.contextPath}/admin/warehouse/edit" method="get" style="display:inline;">
                                    <input type="hidden" name="id" value="${warehouse.id}">
                                    <button type="submit" class="btn-small btn-off">Sửa</button>
                                </form>
                                <form action="${pageContext.request.contextPath}/admin/warehouse/delete" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${warehouse.id}">
                                    <button type="submit" class="btn-small btn-delete">Xóa</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
        </main>

        <aside class="right-panel"></aside>
    </div>
</div>

</body>
</html>
