<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Admin - Quản lý Voucher</title>

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

            <a href="${pageContext.request.contextPath}/admin/warehouse">
                <i class="fa-solid fa-warehouse"></i>
                <span>Kho hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/vouchers" class="active">
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
            <h2>Quản lý Voucher</h2>

            <!-- FORM TẠO VOUCHER -->
            <section class="voucher-form">
                <h3>Tạo voucher mới</h3>

                <form class="form-grid" method="post"
                      action="${pageContext.request.contextPath}/admin/vouchers">

                    <div class="form-item">
                        <label>Mã voucher</label>
                        <input type="text" name="code" placeholder="VD: SALE2025" required>
                    </div>

                    <div class="form-item">
                        <label>Giá trị giảm</label>
                        <input type="number" name="discountValue" placeholder="VD: 20" required>
                    </div>

                    <div class="form-item">
                        <label>Loại giảm</label>
                        <select name="discountType">
                            <option value="percent">Phần trăm (%)</option>
                            <option value="amount">Giá trị (VNĐ)</option>
                        </select>
                    </div>

                    <div class="form-item">
                        <label>Số lượng</label>
                        <input type="number" name="quantity">
                    </div>

                    <div class="form-item">
                        <label>Ngày bắt đầu</label>
                        <input type="date" name="startDate">
                    </div>

                    <div class="form-item">
                        <label>Ngày kết thúc</label>
                        <input type="date" name="endDate">
                    </div>

                    <button type="submit" class="btn-primary">
                        Tạo Voucher
                    </button>
                </form>
            </section>

            <!-- DANH SÁCH VOUCHER -->
            <section class="voucher-list">
                <h3>Danh sách Voucher</h3>

                <table class="data-table">
                    <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Giảm</th>
                        <th>Loại</th>
                        <th>Số lượng</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>

                    <tbody>
                    <!-- Demo – sau này thay bằng c:forEach -->
                    <tr>
                        <td>SALE50</td>
                        <td>50%</td>
                        <td>Phần trăm</td>
                        <td>120</td>
                        <td>
                            <label class="switch">
                                <input type="checkbox" checked>
                                <span class="slider"></span>
                            </label>
                        </td>
                        <td>
                            <button class="btn-small btn-on">Sửa</button>
                            <button class="btn-small btn-delete">Xóa</button>
                        </td>
                    </tr>

                    <tr>
                        <td>NEWYEAR2025</td>
                        <td>200.000đ</td>
                        <td>Giá trị</td>
                        <td>50</td>
                        <td>
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider"></span>
                            </label>
                        </td>
                        <td>
                            <button class="btn-small btn-on">Sửa</button>
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
