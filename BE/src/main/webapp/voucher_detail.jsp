<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Voucher</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/voucherDetail.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<nav>
    <a href="${pageContext.request.contextPath}/home">Home</a>
    <span class="dot">•</span>
    <a href="${pageContext.request.contextPath}/voucher-list">Danh sách voucher</a>
    <span class="dot">•</span>
    <span>${voucher.voucherName}</span>
</nav>
<div class="voucher-detail-container">

    <c:if test="${empty voucher}">
        <p style="text-align:center;color:red">
            Voucher không tồn tại hoặc đã hết hạn
        </p>
    </c:if>

    <c:if test="${not empty voucher}">
        <div class="voucher-detail-card">

            <img src="${voucher.voucherImage}"
                 alt="${voucher.voucherName}"
                 class="voucher-detail-img">

            <div class="voucher-detail-content">

                <h1 class="voucher-detail-title">
                        ${voucher.voucherName}
                </h1>

                <p class="voucher-detail-date">
                    <fmt:formatDate value="${voucher.startDate}" pattern="dd/MM/yyyy"/>
                    –
                    <fmt:formatDate value="${voucher.endDate}" pattern="dd/MM/yyyy"/>
                </p>

                <p class="voucher-key">
                    Mã giảm giá:
                    <strong style="color: red">${voucher.voucherCode}</strong>
                </p>

                <p class="voucher-detail-desc">
                        ${voucher.description}
                </p>

            </div>
        </div>
    </c:if>

</div>

<jsp:include page="footer.jsp"/>

</body>
</html>

