<%--
  Created by IntelliJ IDEA.
  User: lamdo
  Date: 11/14/2025
  Time: 7:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Chi tiết sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="../fontawesome-free-7.1.0-web/css/all.min.css"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/productDetail.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css"/>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"
    ></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<nav class="breadcrumb-nav">
    <a href="../html/home.html">Home</a>
    <span class="dot">•</span>
    <a href="../html/productList.html">Danh sách sản phẩm</a>
    <span class="dot">•</span>
    <a href="">Bàn Học Thông Minh FANCY ROS 100</a>
</nav>
<div class="container">
    <div class="product-wrapper">
        <div class="product-image">
            <img
                    src="img/d11pro-xam.jpg"
                    class="d-block w-100"
                    alt="Hình ảnh bị lỗi"
            />
        </div>
        <div class="product-right">
            <div class="product-details">
                <div class="product-main-info">
                    <h2>Bàn Học Thông Minh FANCY ROS 100</h2>
                    <p class="price">3.910.000đ</p>
                    <p class="product-id">Mã sản phẩm: 001</p>
                    <div class="product-status">
                        <span>Đã bán 513</span>
                        <span class="dot">•</span>
                        <span>Tình trạng: <span class="status">Còn hàng</span></span>
                    </div>
                </div>
                <div class="spec-box">
                    <h3>Thông số chi tiết</h3>
                    <table>
                        <tr>
                            <td>Thương hiệu</td>
                            <td>Fancy TopKids</td>
                        </tr>
                        <tr>
                            <td>Vật liệu</td>
                            <td>Gỗ tự nhiên</td>
                        </tr>
                        <tr>
                            <td>Kích thước</td>
                            <td>Bàn size 1m</td>
                        </tr>
                        <tr>
                            <td>Bảo hành</td>
                            <td>1 năm</td>
                        </tr>
                        <tr>
                            <td>Bảo trì</td>
                            <td>Trọn đời</td>
                        </tr>
                    </table>
                </div>
                <div class="buy-box">
                    <label for="quantity"><strong>Số lượng:</strong></label>
                    <input type="number" id="quantity" value="1" min="1"/>
                    <div class="buy-section">
                        <a href="../html/cart.html" class="buy-btn">Mua Ngay</a>
                        <a href="#" class="add-btn">Thêm vào giỏ hàng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="clearfix"></div>

    <div class="product-info">
        <ul class="nav nav-tabs">
            <li class="nav-item detail">
                <a class="nav-link active" aria-current="page">Chi tiết</a>
            </li>
            <li class="nav-item feedback">
                <a class="nav-link">Feedback</a>
            </li>
        </ul>
        <div class="product-detail"></div>
    </div>
</div>
<button type="button" id="backToTop" title="Back To Top">
    <i class="fa-solid fa-arrow-up"></i>
</button>
<jsp:include page="footer.jsp"/>
<script src="js/productDetail.js"></script>
</body>
</html>
