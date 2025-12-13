<%--
  Created by IntelliJ IDEA.
  User: lamdo
  Date: 11/14/2025
  Time: 7:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Danh sách sản phẩm</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link
            rel="stylesheet"
            href="../fontawesome-free-7.1.0-web/css/all.min.css"
    />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!-- Bootstrap cho trang product list -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/productList.css"/>

</head>
<body>

<jsp:include page="header.jsp"/>

<div class="product-list-page">
    <nav class="breadcrumb-nav">
        <a href="">Home</a>
        <span class="dot">•</span>
        <a href="">Danh sách sản phẩm</a>
    </nav>

    <div class="image-slider">
        <div id="carouselExampleIndicators" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                        aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/slider_product_list.jpg" class="d-block w-100" alt="Hình ảnh bị lỗi">
                </div>
                <div class="carousel-item">
                    <img src="img/slider_product_list_2.png" class="d-block w-100" alt="Hình ảnh bị lỗi">
                </div>
                <div class="carousel-item">
                    <img src="img/slider_product_list_3.jpg" class="d-block w-100" alt="Hình ảnh bị lỗi">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <c:if test="${empty param.keyword}">
     <div class="filter-box">
        <div class="filter-demand-group">
            <h4>Chọn theo nhu cầu</h4>

            <div class="demand-group">
                <c:forEach var="category" items="${categories}">
                    <div class="img-button">
                        <a href="<c:url value='/product-list?category_id=${category.categoryId}'/>">
                            <img
                                    src="${category.categoryImg}"
                                    alt="Hình ảnh bị lỗi"
                            />
                            <span>${category.categoryName}</span>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
     </div>

    <div class="filter-box">
        <h3>Bộ lọc tìm kiếm</h3>
        <div class="filter-group active">
            <div class="filter-header">
                <span>Theo thương hiệu</span>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
            <div class="filter-content">
                <div class="checkbox-list">
                    <c:forEach var="brand" items="${brands}">
                        <label class="custom-checkbox">
                            <input type="checkbox" value="${brand.brandName}"> ${brand.brandName}
                        </label>
                    </c:forEach>
                </div>
            </div>

        </div>
    </div>
    </c:if>



    <div class="filter-box">
        <div class="filter-group active">
            <h4>Sắp xếp theo</h4>
            <div class="filter-content">
                <!--Kiểm tra đường dẫn có phải là trang search hay không-->
                <c:set var="actionUrl" value="${not empty param.keyword?'/search':'/product-list'}"/>
                <a href="<c:url value='${actionUrl}'>
                 <c:choose>
                     <c:when test='${not empty param.keyword}'>
                        <c:param name='keyword' value='${param.keyword}'/>
                     </c:when>
                     <c:otherwise>
                        <c:param name='category_id' value='${currentCategoryId}'/>
                     </c:otherwise>
                    </c:choose>
                <c:param name='sort' value='price_asc'/>
                        </c:url>"
                   class="filter-btn ${currentSort == 'price_asc' ? 'active' : ''}">
                    Giá tăng dần
                </a>

                <a href="
                <c:url value='${actionUrl}'>
                  <c:choose>
                     <c:when test='${not empty param.keyword}'>
                        <c:param name='keyword' value='${param.keyword}'/>
                     </c:when>
                     <c:otherwise>
                        <c:param name='category_id' value='${currentCategoryId}'/>
                     </c:otherwise>
                    </c:choose>
                  <c:param name='sort' value='price_desc'/>
                </c:url>"
                   class="filter-btn ${currentSort == 'price_desc' ? 'active' : ''}">
                    Giá giảm dần
                </a>

                <a href="
                 <c:url value='${actionUrl}'>
                    <c:choose>
                     <c:when test='${not empty param.keyword}'>
                        <c:param name='keyword' value='${param.keyword}'/>
                     </c:when>
                     <c:otherwise>
                        <c:param name='category_id' value='${currentCategoryId}'/>
                     </c:otherwise>
                    </c:choose>
                    <c:param name='sort' value='latest'/>
                 </c:url>" class="filter-btn ${currentSort == 'latest' ? 'active' : ''}">Mới nhất
                </a>

                <a href="
                 <c:url value='${actionUrl}'>
                     <c:choose>
                     <c:when test='${not empty param.keyword}'>
                        <c:param name='keyword' value='${param.keyword}'/>
                     </c:when>
                     <c:otherwise>
                        <c:param name='category_id' value='${currentCategoryId}'/>
                     </c:otherwise>
                    </c:choose>
                    <c:param name='sort' value='oldest'/>
                 </c:url>"
                   class="filter-btn ${currentSort == 'oldest' ? 'active' : ''}">Cũ nhất
                </a>

                <a href="<c:url value='${actionUrl}'>
                  <c:choose>
                     <c:when test='${not empty param.keyword}'>
                        <c:param name='keyword' value='${param.keyword}'/>
                     </c:when>
                     <c:otherwise>
                        <c:param name='category_id' value='${currentCategoryId}'/>
                     </c:otherwise>
                    </c:choose>
                  <c:param name='sort' value='hotest'/>
                </c:url>" class="filter-btn ${currentSort == 'best_selling' ? 'active' : ''}">Bán chạy nhất
                </a>
            </div>
        </div>

        <a class="filter-btn remove-btn" href="<c:url value='/product-list'/>">Xóa lọc</a>
    </div>
    <div class="product-container">
        <!-- Thay đổi tiêu đề trang-->
        <c:choose>
            <c:when test="${not empty param.keyword}">
                <h1>Kết quả tìm kiếm cho: ${param.keyword}</h1>
            </c:when>
            <c:otherwise>
                <h1>Danh sách sản phẩm</h1>
            </c:otherwise>
        </c:choose>
        <div class="product-list">
            <!-- Lặp danh sách sản phẩm -->
            <c:forEach var="product" items="${products}">
                <div class="product">
                    <a href="<c:url value='/product-detail?product_id=${product.productId}'/>">
                        <img alt="Ảnh bị lỗi" src="${product.productImg}"/>
                    </a>

                    <h3>${product.productName}</h3>

                    <p class="price">
                            ${product.productPrice}đ
                    </p>

                    <a class="filter-btn cart-btn" href="" title="Thêm vào giỏ hàng">
                        <i class="fa-solid fa-cart-plus"></i>
                    </a>

                    <a class="filter-btn detail-btn"
                       href="<c:url value='/product-detail?product_id=${product.productId}'/>"
                       title="Xem chi tiết">
                        <i class="fa-solid fa-eye"></i>
                    </a>

                    <a class="filter-btn favor-btn" href="" title="Thêm vào danh sách yêu thích">
                        <i class="fa-solid fa-heart"></i>
                    </a>

                    <div class="product-stats">
                        <div>
                            Đã bán
                            <span>
                                    ${soldMap[product.productId]}
                            </span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- Trường hợp không có sản phẩm -->
        <c:if test="${empty products}">
            <p>Không có sản phẩm</p>
        </c:if>
        <button type="button" id="backToTop" title="Back To Top">
            <i class="fa-solid fa-arrow-up"></i>
        </button>
        <div class="pagination">
            <a href="#" class="prev-page">&laquo;</a>
            <a href="#" class="page-number active">1</a>
            <a href="#" class="page-number">2</a>
            <a href="#" class="page-number">3</a>
            <a href="#" class="next-page">&raquo;</a>
        </div>
    </div>


    <jsp:include page="footer.jsp"/>
    <script src="${pageContext.request.contextPath}/js/header.js"></script>
    <script src="${pageContext.request.contextPath}/js/productList.js"></script>
</body>
</html>