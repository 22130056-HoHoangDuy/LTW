<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <title>Giỏ hàng của bạn</title>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
                    integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
                    crossorigin="anonymous" referrerpolicy="no-referrer" />
                <link rel="stylesheet" href="../fontawesome-free-7.1.0-web/css/all.min.css" />
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cartStyle.css" />
            </head>

            <body>
                <jsp:include page="header.jsp" />
                <nav class="breadcrumb-nav">
                    <a href="">Home</a>
                    <span class="dot">•</span>
                    <a href="">Giỏ hàng</a>
                </nav>
                <h3 class="page-title">Giỏ hàng</h3>
                <c:if test="${sessionScope.cart != null && sessionScope.cart.getTotalQuantity() > 0}">
                    <button onclick="location.href='cart?action=remove_all'" class="clear-cart-btn">
                        🗑 Xoá tất cả đơn hàng
                    </button>
                </c:if>
                <div class="cart-container">
                    <c:choose>
                        <c:when test="${sessionScope.cart == null || sessionScope.cart.getTotalQuantity() == 0}">
                            <div class="empty-cart">
                                <img src="../img/cart-null.png" alt="" />

                                <p style="font-weight: 550">Giỏ hàng trống</p>
                                <p>
                                    Bạn tham khảo thêm các sản phẩm
                                    <a href="<c:url value=" /product-list" />">tại đây</a> nhé!
                                </p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="cart-items">
                                <c:forEach var="item" items="${sessionScope.cart.items}">
                                    <div class="cart-item">
                                        <div>
                                            <img class="item-image" src="${item.product.productImage}"
                                                alt="${item.product.productName}" />
                                        </div>
                                        <div class="item-details">
                                            <h3 class="item-title">${item.product.productName}</h3>
                                            <p class="item-variant">Mã SP: <c:choose>
                                                    <c:when test="${item.product.productId < 10}">
                                                        00${item.product.productId}</c:when>
                                                    <c:when test="${item.product.productId < 100}">
                                                        0${item.product.productId}</c:when>
                                                    <c:otherwise>${item.product.productId}</c:otherwise>
                                                </c:choose>
                                            </p>

                                            <div class="item-price">
                                                <span class="current-price">
                                                    <fmt:setLocale value="vi_VN" />
                                                    <fmt:formatNumber value="${item.price}" type="number"
                                                        groupingUsed="true" />đ
                                                </span>
                                            </div>
                                        </div>
                                        <div class="item-actions">
                                            <button type="button" class="delete-btn" title="Xóa sản phẩm"
                                                onclick="location.href='cart?action=remove&product_id=${item.product.productId}'">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>

                                            <div class="quantity-control">
                                                <button type="button" class="quantity-btn"
                                                    onclick="decreaseUI(${item.product.productId})">−
                                                </button>

                                                <input type="text" class="quantity-input" value="${item.quantity}"
                                                    id="quantity-${item.product.productId}" readonly />

                                                <button type="button" class="quantity-btn"
                                                    onclick="increaseUI(${item.product.productId})">+
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>

                            </div>
                            <div class="order-summary">
                                <h2 class="summary-title">Thông tin thanh toán</h2>

                                <div class="promo-code">
                                    <div class="promo-input-group">
                                        <input type="text" class="promo-input" placeholder="Nhập mã giảm giá"
                                            id="promoCode" />
                                        <button type="button" class="promo-btn">Áp dụng</button>
                                    </div>
                                </div>

                                <div class="payment-methods">
                                </div>

                                <div class="summary-row">
                                    <span class="label">Giá trị đơn hàng</span>
                                    <span class="value" id="subtotal">
                                        <fmt:formatNumber value="${sessionScope.cart.getTotalPrice()}" type="currency"
                                            currencySymbol="đ" />
                                    </span>
                                </div>
                                <div class="summary-row">
                                    <span class="label">Tiết kiệm với mã giảm</span>
                                    <span class="value" id="discount">0đ</span>
                                </div>
                                <div class="summary-row total">
                                    <span class="label">Tổng thanh toán</span>
                                    <span class="value" id="total">
                                        <fmt:formatNumber value="${sessionScope.cart.getTotalPrice()}" type="currency"
                                            currencySymbol="đ" />
                                    </span>
                                </div>
                                <button type="button" class="submit-btn" onclick="submitPayment(event)">
                                    Xác nhận thanh toán
                                </button>

                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <script src="${pageContext.request.contextPath}/js/header.js"></script>
                <script src="${pageContext.request.contextPath}/js/cart.js"></script>
            </body>

            </html>