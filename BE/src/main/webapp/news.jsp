<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/11/2025
  Time: 12:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tin tức - Đồ nội thất trẻ em</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/news.css">
    <!--    <script src="../js/news.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<nav class="news-nav">
    <a href="">Home</a>
    <span class="dot">•</span>
    <a href="">Danh sách Tin tức</a>
</nav>
<main class="news-container">
    <!-- Cột trái -->
    <section class="news-section">
        <h2>TIN HỮU ÍCH</h2>
        <div class="news-list">
            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Thiết kế phòng ngủ thông minh</h3>
                    <p class="date">🗓️ 09/11/2024</p>
                    <p class="desc">Những hoạt động vui chơi ngoài trời và chế độ dinh dưỡng cân bằng giúp trẻ phát triển tối đa thể chất.</p>
                    <a href="../html/newsDetail.html" target="_top" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Lưu ý khi cho trẻ dùng máy tính sớm</h3>
                    <p class="date">🗓️ 08/11/2024</p>
                    <p class="desc">Cần hướng dẫn trẻ sử dụng máy tính đúng cách để bảo vệ mắt và phát triển tư duy sáng tạo.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kiến thức về đèn học chống cận bạn nên biết</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Ánh sáng phù hợp giúp trẻ học tập hiệu quả và bảo vệ thị lực trong giai đoạn phát triển.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kiến thức về đèn học chống cận bạn nên biết</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Ánh sáng phù hợp giúp trẻ học tập hiệu quả và bảo vệ thị lực trong giai đoạn phát triển.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kiến thức về đèn học chống cận bạn nên biết</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Ánh sáng phù hợp giúp trẻ học tập hiệu quả và bảo vệ thị lực trong giai đoạn phát triển.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kiến thức về đèn học chống cận bạn nên biết</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Ánh sáng phù hợp giúp trẻ học tập hiệu quả và bảo vệ thị lực trong giai đoạn phát triển.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>
        </div>
    </section>

    <!-- Cột phải -->
    <section class="news-section">
        <h2>TIN SẢN PHẨM</h2>
        <div class="news-list">
            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kinh nghiệm chọn ghế chống gù cho trẻ</h3>
                    <p class="date">🗓️ 09/11/2024</p>
                    <p class="desc">Ghế học phù hợp không chỉ giúp trẻ ngồi đúng tư thế mà còn phòng tránh cong vẹo cột sống.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Bàn học gỗ ép công nghiệp có tốt không?</h3>
                    <p class="date">🗓️ 08/11/2024</p>
                    <p class="desc">Bàn học bằng gỗ ép giúp tiết kiệm chi phí nhưng vẫn đảm bảo độ bền và tính thẩm mỹ.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Tủ đồ đa năng cho phòng học gọn gàng</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Thiết kế tủ thông minh giúp bé dễ dàng cất giữ sách vở và đồ dùng học tập ngăn nắp.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kiến thức về đèn học chống cận bạn nên biết</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Ánh sáng phù hợp giúp trẻ học tập hiệu quả và bảo vệ thị lực trong giai đoạn phát triển.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kiến thức về đèn học chống cận bạn nên biết</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Ánh sáng phù hợp giúp trẻ học tập hiệu quả và bảo vệ thị lực trong giai đoạn phát triển.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>

            <article class="news-item">
                <img src="../img/news/news_detail1.jpg" alt="">
                <div class="news-info">
                    <h3>Kiến thức về đèn học chống cận bạn nên biết</h3>
                    <p class="date">🗓️ 07/11/2024</p>
                    <p class="desc">Ánh sáng phù hợp giúp trẻ học tập hiệu quả và bảo vệ thị lực trong giai đoạn phát triển.</p>
                    <a href="#" class="read-more">Xem chi tiết</a>
                </div>
            </article>
        </div>
    </section>
</main>

<div class="pagination">
    <button class="active">1</button>
    <button>2</button>
    <button>3</button>
</div>

<jsp:include page="footer.jsp"/>
</body>
<script>
    function resizeIframe(iframe) {
        try {
            // Truy cập nội dung iframe và lấy chiều cao body
            iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
        } catch (e) {
            console.warn("Không thể resize iframe do cùng nguồn (CORS)", e);
        }
    }

    // Lắng nghe load của từng iframe
    document.getElementById('header-frame').addEventListener('load', function() {
        resizeIframe(this);
    });

    document.getElementById('footer-frame').addEventListener('load', function() {
        resizeIframe(this);
    });
</script>
</html>

