<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Voucher</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/voucherList.css">
</head>

<body>

<jsp:include page="header.jsp"/>

<nav class="voucher-breadcrumb">
    <a href="${pageContext.request.contextPath}/">Trang chủ</a>
    <span>•</span>
    <span>Danh sách Voucher</span>
</nav>

<h1 class="voucher-page-title">Danh sách Voucher</h1>

<!-- ====== VOUCHER GRID ====== -->
<div class="voucher-grid">

    <c:forEach var="v" items="${vouchers}">
        <div class="voucher-card">

            <!-- Discount -->
            <div class="voucher-discount">
                -${v.discountAmount}K
            </div>

            <!-- Image -->
            <img src="${v.voucherImage}"
                 alt="${v.voucherName}"
                 class="voucher-image"/>

            <!-- Content -->
            <div class="voucher-body">

                <h3 class="voucher-name">
                        ${v.voucherName}
                </h3>

                <p class="voucher-date">
                        ${v.startDate} . ${v.endDate}
                </p>

                <a href="${pageContext.request.contextPath}/voucher-detail?code=${v.voucherCode}"
                   class="voucher-detail-btn">
                    Xem chi tiết
                </a>

            </div>
        </div>
    </c:forEach>

</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
