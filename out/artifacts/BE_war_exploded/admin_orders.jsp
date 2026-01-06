<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin - Quản lý đơn hàng</title>

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

            <a href="${pageContext.request.contextPath}/admin/orders" class="active">
                <i class="fa-solid fa-box"></i>
                <span>Đơn hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/products">
                <i class="fa-solid fa-cube"></i>
                <span>Sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/accounts">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </a>
        </nav>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="main">
        <h2>Quản lý đơn hàng</h2>

        <table class="data-table">
            <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Khách hàng</th>
                <th>Ngày đặt</th>
                <th>Tổng tiền</th>
                <th>Thanh toán</th>
                <th>Trạng thái</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td>#1023</td>
                <td>Nguyễn An</td>
                <td>28/10/2025</td>
                <td>1.200.000đ</td>
                <td>COD</td>
                <td>
                    <select class="status-select processing"
                            onchange="updateStatus(this, 1023)">
                        <option value="processing" selected>Đang xử lý</option>
                        <option value="shipping">Đang giao</option>
                        <option value="success">Hoàn tất</option>
                        <option value="cancel">Đã hủy</option>
                    </select>
                </td>
            </tr>
            </tbody>
        </table>
    </main>

    <!-- RIGHT PANEL -->
    <aside class="right-panel"></aside>

</div>

<script>
    function updateStatus(select, orderId) {
        fetch(
            `${pageContext.request.contextPath}/admin/orders/status?id=${orderId}&status=${select.value}`
        )
            .then(res => res.text())
            .then(txt => {
                if (txt !== "OK") {
                    alert("Cập nhật trạng thái thất bại");
                }
            });
    }
</script>

</body>
</html>
