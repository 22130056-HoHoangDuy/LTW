<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BabyShop Việt Nam</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"
          integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- SweetAlert dùng cho header logout -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>
<jsp:include page="header.jsp"/>

<!-- Banner chính -->
<section class="hero">
    <img src="${pageContext.request.contextPath}/img/banner/banner.png" class="banner-img" alt="Banner">
</section>

<!-- Danh mục sản phẩm -->
<section class="category">
    <h2>DANH MỤC SẢN PHẨM</h2>

    <div class="category-grid">
        <c:forEach items="${categories}" var="c">
            <div class="cat-item">
                <a href="${pageContext.request.contextPath}/product-list?category_id=${c.categoryId}">
                    <img src="${c.categoryImage}" alt="${c.categoryName}">
                </a>
                <p>${c.categoryName}</p>
            </div>
        </c:forEach>
    </div>
</section>

<!-- Giới thiệu -->
<section class="intro">
    <img src="${pageContext.request.contextPath}/img/banner/intro.jpg" alt="Giới thiệu">
</section>

<!-- Chính sách -->
<section class="policies">
    <div class="policy">BẢO HÀNH CHÍNH HÃNG</div>
    <div class="policy">BẢO TRÌ TRỌN ĐỜI</div>
    <div class="policy">LẮP ĐẶT MIỄN PHÍ</div>
    <div class="policy">MIỄN PHÍ VẬN CHUYỂN</div>
</section>

<!-- ====== CAROUSEL SECTION TEMPLATE ====== -->
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- ĐỒ NỘI THẤT MỚI NHẤT -->
<section class="section">
    <h2>ĐỒ NỘI THẤT MỚI NHẤT</h2>

    <div class="carousel-wrapper">
        <button type="button" class="carousel-btn prev" aria-label="Previous">
            <i class="fa-solid fa-chevron-left"></i>
        </button>

        <div class="carousel-track">
            <!-- JS sẽ lấy product-grid và tự chia thành carousel-slide -->
            <div class="product-grid">
                <c:forEach items="${NoiThatMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${ctx}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImage}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price"><fmt:formatNumber value="${p.productPrice}" type="number"/>đ</p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#"><i class="fa-solid fa-cart-plus"></i></a>
                            <a class="filter-btn detail-btn" href="${ctx}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#"><i class="fa-solid fa-heart"></i></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button type="button" class="carousel-btn next" aria-label="Next">
            <i class="fa-solid fa-chevron-right"></i>
        </button>
    </div>
</section>

<!-- ĐỒ TRANG TRÍ MỚI NHẤT -->
<section class="section">
    <h2>ĐỒ TRANG TRÍ MỚI NHẤT</h2>

    <div class="carousel-wrapper">
        <button type="button" class="carousel-btn prev" aria-label="Previous">
            <i class="fa-solid fa-chevron-left"></i>
        </button>

        <div class="carousel-track">
            <div class="product-grid">
                <c:forEach items="${TrangTriMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${ctx}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImage}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price"><fmt:formatNumber value="${p.productPrice}" type="number"/>đ</p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#"><i class="fa-solid fa-cart-plus"></i></a>
                            <a class="filter-btn detail-btn" href="${ctx}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#"><i class="fa-solid fa-heart"></i></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button type="button" class="carousel-btn next" aria-label="Next">
            <i class="fa-solid fa-chevron-right"></i>
        </button>
    </div>
</section>

<!-- ĐỒ CHƠI MỚI NHẤT -->
<section class="section">
    <h2>ĐỒ CHƠI MỚI NHẤT</h2>

    <div class="carousel-wrapper">
        <button type="button" class="carousel-btn prev" aria-label="Previous">
            <i class="fa-solid fa-chevron-left"></i>
        </button>

        <div class="carousel-track">
            <!-- QUAN TRỌNG: chỉ render product-card, KHÔNG bọc carousel-slide -->
            <div class="product-grid">
                <c:forEach items="${DoChoiMoi}" var="p">
                    <div class="product-card">
                        <div class="product-img">
                            <a href="${ctx}/product-detail?product_id=${p.productId}">
                                <img src="${p.productImage}" alt="${p.productName}">
                            </a>
                        </div>

                        <h4 class="product-title">${p.productName}</h4>
                        <p class="price"><fmt:formatNumber value="${p.productPrice}" type="number"/>đ</p>

                        <div class="product-actions">
                            <a class="filter-btn cart-btn" href="#"><i class="fa-solid fa-cart-plus"></i></a>
                            <a class="filter-btn detail-btn" href="${ctx}/product-detail?product_id=${p.productId}">
                                <i class="fa-solid fa-eye"></i>
                            </a>
                            <a class="filter-btn favor-btn" href="#"><i class="fa-solid fa-heart"></i></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <button type="button" class="carousel-btn next" aria-label="Next">
            <i class="fa-solid fa-chevron-right"></i>
        </button>
    </div>
</section>


<!-- ================== SẢN PHẨM MỚI NHẤT THEO 3 LOẠI (BOOTSTRAP CAROUSEL) ================== -->
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- 1) ĐỒ NỘI THẤT MỚI NHẤT -->
<section class="section">
    <h2>ĐỒ NỘI THẤT MỚI NHẤT</h2>

    <c:if test="${empty NoiThatMoi}">
        <div class="text-center text-muted py-4">Chưa có sản phẩm để hiển thị.</div>
    </c:if>

    <c:if test="${not empty NoiThatMoi}">
        <div id="noiThatCarousel" class="carousel slide home-bs-carousel" data-bs-ride="false" data-bs-touch="true">
            <div class="carousel-inner">

                <c:forEach items="${NoiThatMoi}" var="p" varStatus="st">
                    <c:if test="${st.index % 20 == 0}">
                        <div class="carousel-item ${st.index == 0 ? 'active' : ''}">
                        <div class="row g-3">
                    </c:if>

                    <div class="col-6 col-md-4 col-lg-3 col-xl-2">
                        <div class="product-card">
                            <div class="product-img">
                                <a href="${ctx}/product-detail?product_id=${p.productId}">
                                    <img src="${p.productImage}" alt="${p.productName}">
                                </a>
                            </div>

                            <h4 class="product-title">${p.productName}</h4>
                            <p class="price"><fmt:formatNumber value="${p.productPrice}" type="number"/>đ</p>

                            <div class="product-actions">
                                <a class="filter-btn cart-btn" href="#"><i class="fa-solid fa-cart-plus"></i></a>
                                <a class="filter-btn detail-btn" href="${ctx}/product-detail?product_id=${p.productId}">
                                    <i class="fa-solid fa-eye"></i>
                                </a>
                                <a class="filter-btn favor-btn" href="#"><i class="fa-solid fa-heart"></i></a>
                            </div>
                        </div>
                    </div>

                    <c:if test="${st.index % 20 == 19 || st.last}">
                        </div>
                        </div>
                    </c:if>
                </c:forEach>

            </div>

            <c:if test="${fn:length(NoiThatMoi) > 20}">
                <button class="carousel-control-prev" type="button" data-bs-target="#noiThatCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#noiThatCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </c:if>
        </div>
    </c:if>
</section>

<!-- 2) ĐỒ TRANG TRÍ MỚI NHẤT -->
<section class="section">
    <h2>ĐỒ TRANG TRÍ MỚI NHẤT</h2>

    <c:if test="${empty TrangTriMoi}">
        <div class="text-center text-muted py-4">Chưa có sản phẩm để hiển thị.</div>
    </c:if>

    <c:if test="${not empty TrangTriMoi}">
        <div id="trangTriCarousel" class="carousel slide home-bs-carousel" data-bs-ride="false" data-bs-touch="true">
            <div class="carousel-inner">

                <c:forEach items="${TrangTriMoi}" var="p" varStatus="st">
                    <c:if test="${st.index % 20 == 0}">
                        <div class="carousel-item ${st.index == 0 ? 'active' : ''}">
                        <div class="row g-3">
                    </c:if>

                    <div class="col-6 col-md-4 col-lg-3 col-xl-2">
                        <div class="product-card">
                            <div class="product-img">
                                <a href="${ctx}/product-detail?product_id=${p.productId}">
                                    <img src="${p.productImage}" alt="${p.productName}">
                                </a>
                            </div>

                            <h4 class="product-title">${p.productName}</h4>
                            <p class="price"><fmt:formatNumber value="${p.productPrice}" type="number"/>đ</p>

                            <div class="product-actions">
                                <a class="filter-btn cart-btn" href="#"><i class="fa-solid fa-cart-plus"></i></a>
                                <a class="filter-btn detail-btn" href="${ctx}/product-detail?product_id=${p.productId}">
                                    <i class="fa-solid fa-eye"></i>
                                </a>
                                <a class="filter-btn favor-btn" href="#"><i class="fa-solid fa-heart"></i></a>
                            </div>
                        </div>
                    </div>

                    <c:if test="${st.index % 20 == 19 || st.last}">
                        </div>
                        </div>
                    </c:if>
                </c:forEach>

            </div>

            <c:if test="${fn:length(TrangTriMoi) > 20}">
                <button class="carousel-control-prev" type="button" data-bs-target="#trangTriCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#trangTriCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </c:if>
        </div>
    </c:if>
</section>

<!-- 3) ĐỒ CHƠI MỚI NHẤT -->
<section class="section">
    <h2>ĐỒ CHƠI MỚI NHẤT</h2>

    <c:if test="${empty DoChoiMoi}">
        <div class="text-center text-muted py-4">Chưa có sản phẩm để hiển thị.</div>
    </c:if>

    <c:if test="${not empty DoChoiMoi}">
        <div id="doChoiCarousel" class="carousel slide home-bs-carousel" data-bs-ride="false" data-bs-touch="true">
            <div class="carousel-inner">

                <c:forEach items="${DoChoiMoi}" var="p" varStatus="st">
                    <c:if test="${st.index % 20 == 0}">
                        <div class="carousel-item ${st.index == 0 ? 'active' : ''}">
                        <div class="row g-3">
                    </c:if>

                    <div class="col-6 col-md-4 col-lg-3 col-xl-2">
                        <div class="product-card">
                            <div class="product-img">
                                <a href="${ctx}/product-detail?product_id=${p.productId}">
                                    <img src="${p.productImage}" alt="${p.productName}">
                                </a>
                            </div>

                            <h4 class="product-title">${p.productName}</h4>
                            <p class="price"><fmt:formatNumber value="${p.productPrice}" type="number"/>đ</p>

                            <div class="product-actions">
                                <a class="filter-btn cart-btn" href="#"><i class="fa-solid fa-cart-plus"></i></a>
                                <a class="filter-btn detail-btn" href="${ctx}/product-detail?product_id=${p.productId}">
                                    <i class="fa-solid fa-eye"></i>
                                </a>
                                <a class="filter-btn favor-btn" href="#"><i class="fa-solid fa-heart"></i></a>
                            </div>
                        </div>
                    </div>

                    <c:if test="${st.index % 20 == 19 || st.last}">
                        </div>
                        </div>
                    </c:if>
                </c:forEach>

            </div>

            <c:if test="${fn:length(DoChoiMoi) > 20}">
                <button class="carousel-control-prev" type="button" data-bs-target="#doChoiCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#doChoiCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </c:if>
        </div>
    </c:if>
</section>


<jsp:include page="footer.jsp"/>

<!-- ====== CAROUSEL JS (ONE TIME ONLY) ====== -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.querySelectorAll(".carousel-wrapper").forEach(wrapper => {
            const track = wrapper.querySelector(".carousel-track");
            const grid = wrapper.querySelector(".product-grid");
            const prev = wrapper.querySelector(".carousel-btn.prev");
            const next = wrapper.querySelector(".carousel-btn.next");
            if (!track || !grid || !prev || !next) return;

            // Lấy toàn bộ product-card
            const cards = Array.from(grid.children);
            const cardsPerSlide = 12; // 2 hàng x 6 cột (đúng với CSS .carousel-slide)
            const slideCount = Math.ceil(cards.length / cardsPerSlide);

            // Nếu không đủ 2 trang thì ẩn nút cho khỏi “tưởng không chạy”
            if (slideCount <= 1) {
                prev.style.display = "none";
                next.style.display = "none";
                return;
            }

            // Tạo slide pages
            const slides = [];
            for (let i = 0; i < slideCount; i++) {
                const slide = document.createElement("div");
                slide.className = "carousel-slide";

                cards.slice(i * cardsPerSlide, (i + 1) * cardsPerSlide)
                    .forEach(card => slide.appendChild(card));

                slides.push(slide);
            }

            // Replace grid bằng slides
            grid.remove();
            slides.forEach(s => track.appendChild(s));

            let currentIndex = 0;
            const update = () => {
                track.style.transform = `translateX(-${currentIndex * 100}%)`;
            };
            update();

            next.addEventListener("click", (e) => {
                e.preventDefault();
                if (currentIndex < slides.length - 1) currentIndex++;
                update();
            });

            prev.addEventListener("click", (e) => {
                e.preventDefault();
                if (currentIndex > 0) currentIndex--;
                update();
            });
        });
    });
</script>

</body>
</html>
