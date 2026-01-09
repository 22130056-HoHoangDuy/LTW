<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

            <a href="${pageContext.request.contextPath}/admin/products">
                <i class="fa-solid fa-box"></i>
                <span>Sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/warehouse" class="active">
                <i class="fa-solid fa-warehouse"></i>
                <span>Kho hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/accounts">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
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

                <form class="form-grid">
                    <div class="form-item">
                        <label>Tên kho</label>
                        <input type="text" placeholder="Ví dụ: Kho Hà Nội">
                    </div>

                    <div class="form-item">
                        <label>Địa chỉ</label>
                        <input type="text" placeholder="123 Nguyễn Trãi, Hà Nội">
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
                    <tr>
                        <td>1</td>
                        <td>Kho Hà Nội</td>
                        <td>123 Nguyễn Trãi, Hà Nội</td>
                        <td>280</td>
                        <td>
                            <button class="btn-small btn-on">Xem</button>
                            <button class="btn-small btn-off">Sửa</button>
                            <button class="btn-small btn-delete">Xóa</button>
                        </td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td>Kho Đà Nẵng</td>
                        <td>45 Trần Phú, Đà Nẵng</td>
                        <td>120</td>
                        <td>
                            <button class="btn-small btn-on">Xem</button>
                            <button class="btn-small btn-off">Sửa</button>
                            <button class="btn-small btn-delete">Xóa</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </section>
        </main>

        <aside class="right-panel"></aside>
    </div>
</div>

</body>
</html>
