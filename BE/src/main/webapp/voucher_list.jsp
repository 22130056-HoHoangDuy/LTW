<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Voucher</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/voucherList.css">
    <style>
        /* ================= PAGINATION INLINE ================= */

        .vc-pagination-wrap {
            width: 100%;
            display: flex;
            justify-content: center;
            margin: 60px 0 80px;
        }

        .vc-pagination-wrap .vc-pagination {
            display: flex;
            gap: 14px;
        }

        /* PAGE */
        .vc-pagination-wrap .vc-pagination a.vc-page {
            width: 44px;
            height: 44px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;
            border: 1px solid #ddd;

            background-color: #fff;
            color: #333;

            font-size: 15px;
            font-weight: 600;

            text-decoration: none;
            cursor: pointer;

            transition: all 0.25s ease;
        }

        /* HOVER */
        .vc-pagination-wrap .vc-pagination a.vc-page:hover {
            background-color: #eef4ff;
            border-color: #0984e3;
            color: #0984e3;
            transform: translateY(-2px);
        }

        /* ACTIVE */
        .vc-pagination-wrap .vc-pagination a.vc-page.active {
            background: linear-gradient(135deg, #0984e3, #74b9ff);
            color: #fff;
            border-color: #0984e3;
            box-shadow: 0 6px 18px rgba(9,132,227,0.35);
        }

        /* PREV / NEXT */
        .vc-pagination-wrap .vc-pagination a.vc-page.prev,
        .vc-pagination-wrap .vc-pagination a.vc-page.next {
            font-size: 18px;
            font-weight: 700;
        }
    </style>
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
                -${v.discountAmount}đ
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
                        Ngày bắt đầu:${v.startDate}
                </p>
                <p class="voucher-date">
                        Ngày kết thúc:${v.endDate}
                </p>

                <a href="${pageContext.request.contextPath}/voucher-detail?id=${v.voucherId}"
                   class="voucher-detail-btn">
                    Xem chi tiết
                </a>

            </div>
        </div>
    </c:forEach>

</div>
<!-- ===== PAGINATION ===== -->
<div class="vc-pagination-wrap">
    <div class="vc-pagination">

        <c:set var="baseUrl" value="/voucher-list"/>

        <!-- PREV -->
        <c:if test="${currentPage > 1}">
            <c:url value="${baseUrl}" var="prevLink">
                <c:param name="page" value="${currentPage - 1}"/>
            </c:url>
            <a href="${prevLink}" class="vc-page prev">&laquo;</a>
        </c:if>

        <!-- PAGE NUMBER -->
        <c:forEach begin="1" end="${totalPage}" var="i">
            <c:url value="${baseUrl}" var="pageLink">
                <c:param name="page" value="${i}"/>
            </c:url>

            <a href="${pageLink}"
               class="vc-page ${currentPage == i ? 'active' : ''}">
                    ${i}
            </a>
        </c:forEach>

        <!-- NEXT -->
        <c:if test="${currentPage < totalPage}">
            <c:url value="${baseUrl}" var="nextLink">
                <c:param name="page" value="${currentPage + 1}"/>
            </c:url>
            <a href="${nextLink}" class="vc-page next">&raquo;</a>
        </c:if>

    </div>
</div>

<jsp:include page="footer.jsp"/>

</body>
</html>
