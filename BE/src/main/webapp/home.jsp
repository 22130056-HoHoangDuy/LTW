<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/11/2025
  Time: 12:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BabyShop Việt Nam</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<!-- Banner chính -->
<section class="hero">
    <img src="${pageContext.request.contextPath}/img/banner/banner.png" class="banner-img">
</section>
<!-- Danh mục sản phẩm -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="category">
    <h2>DANH MỤC SẢN PHẨM</h2>

    <div class="category-grid">
        <c:forEach items="${categories}" var="c">
            <div class="cat-item">

                <a href="product-list?category_id=${c.categoryId}">
                    <img src="${c.categoryImg}" alt="${c.categoryName}">

                </a>
                <p>${c.categoryName}</p>
            </div>
        </c:forEach>
    </div>
</section>


<!-- Giới thiệu -->
<section class="intro">
    <img src="${pageContext.request.contextPath}/img/banner/intro.jpg" alt="CEO">
</section>

<!-- Chính sách -->
<section class="policies">
    <div class="policy">BẢO HÀNH CHÍNH HÃNG</div>
    <div class="policy">BẢO TRÌ TRỌN ĐỜI</div>
    <div class="policy">LẮP ĐẶT MIỄN PHÍ</div>
    <div class="policy">MIỄN PHÍ VẬN CHUYỂN</div>
</section>

<!-- Combo nổi bật -->
<section class="section">
    <h2>ĐỒ NỘI THẤT MỚI NHẤT</h2>
    <div class="carousel-wrapper">
        <button class="carousel-btn prev"><i class="fa-solid fa-chevron-left"></i></button>

        <div class="carousel-track">
            <div class="product-grid">
                <c:forEach items="${NoiThatMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImg}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price">
                            <fmt:formatNumber value="${p.productPrice}" type="number"/>đ
                        </p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a class="filter-btn detail-btn"
                               href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#">
                                <i class="fa-solid fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button class="carousel-btn next"><i class="fa-solid fa-chevron-right"></i></button>
    </div>
</section>


<section class="section">
    <h2>ĐỒ TRANG TRÍ MỚI NHẤT</h2>
    <div class="carousel-wrapper">
        <button class="carousel-btn prev"><i class="fa-solid fa-chevron-left"></i></button>

        <div class="carousel-track">
            <div class="product-grid">
                <c:forEach items="${TrangTriMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}"">
                                <img src="${p.productImg}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price">
                            <fmt:formatNumber value="${p.productPrice}" type="number"/>đ
                        </p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a class="filter-btn detail-btn"
                               href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}"">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#">
                                <i class="fa-solid fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button class="carousel-btn next"><i class="fa-solid fa-chevron-right"></i></button>
    </div>
</section>

<section class="section">
    <h2>ĐỒ CHƠI MỚI NHẤT</h2>
    <div class="carousel-wrapper">
        <button class="carousel-btn prev"><i class="fa-solid fa-chevron-left"></i></button>

        <div class="carousel-track">
            <div class="product-grid">
                <c:forEach items="${DoChoiMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImg}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price">
                            <fmt:formatNumber value="${p.productPrice}" type="number"/>đ
                        </p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#">
                                <i class="fa-solid fa-cart-plus"></i>
                            </a>
                            <a class="filter-btn detail-btn"
                               href="${pageContext.request.contextPath}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#">
                                <i class="fa-solid fa-heart"></i>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button class="carousel-btn next"><i class="fa-solid fa-chevron-right"></i></button>
    </div>
</section>

<jsp:include page="footer.jsp"/>

</body>
<script>
    let index = 0;
    const slides = document.querySelectorAll(".slide");
    const total = slides.length;

    // Đặt vị trí ban đầu
    slides.forEach((s, i) => {
        s.style.transform = `translateX(${i * 100}%)`;
    });

    // Chuyển slide
    function showSlide() {
        index = (index + 1) % total;

        slides.forEach((s, i) => {
            s.style.transform = `translateX(${(i - index) * 100}%)`;
        });
    }

    // Chờ load ảnh xong rồi mới hiện slider
    let loadedCount = 0;

    slides.forEach(img => {
        img.onload = () => {
            loadedCount++;
            if (loadedCount === total) {
                document.querySelector(".slider").classList.add("loaded");
            }
        };
    });

    // Auto chạy
    setInterval(showSlide, 5000);
    document.querySelectorAll('.carousel-wrapper').forEach(wrapper => {
        const track = wrapper.querySelector('.carousel-track');
        const grid = wrapper.querySelector('.product-grid');
        const prev = wrapper.querySelector('.carousel-btn.prev');
        const next = wrapper.querySelector('.carousel-btn.next');

        const cards = Array.from(grid.children);
        const cardsPerSlide = 12;
        const slideCount = Math.ceil(cards.length / cardsPerSlide);

        // Tạo slides
        const slides = [];
        for (let i = 0; i < slideCount; i++) {
            const slide = document.createElement('div');
            slide.classList.add('carousel-slide');
            cards.slice(i * cardsPerSlide, (i + 1) * cardsPerSlide)
                .forEach(card => slide.appendChild(card));
            slides.push(slide);
        }

        grid.remove();
        slides.forEach(slide => track.appendChild(slide));

        let currentIndex = 0;

        function updateCarousel() {
            track.style.transform = `translateX(-${currentIndex * 100}%)`;
        }

        next.addEventListener('click', () => {
            if (currentIndex < slides.length - 1) {
                currentIndex++;
                updateCarousel();
            }
        });

        prev.addEventListener('click', () => {
            if (currentIndex > 0) {
                currentIndex--;
                updateCarousel();
            }
        });
    });

</script>
</html>
