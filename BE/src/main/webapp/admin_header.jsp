<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Admin Dashboard</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_chart.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>

<div class="dashboard">

    <aside class="sidebar">
        <nav class="menu">

            <a href="${pageContext.request.contextPath}/admin/overview" class="active">
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

            <a href="${pageContext.request.contextPath}/admin/products">
                <i class="fa-solid fa-cube"></i>
                <span>Sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/vouchers">
                <i class="fa-solid fa-ticket"></i>
                <span>Voucher</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/categories">
                <i class="fa-solid fa-layer-group"></i>
                <span>Danh mục</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/warehouse">
                <i class="fa-solid fa-warehouse"></i>
                <span>Kho hàng</span>
            </a>

        </nav>

        <a href="${pageContext.request.contextPath}/admin/settings" class="bottom-btn">
            <i class="fa-solid fa-gear"></i>
        </a>
    </aside>
