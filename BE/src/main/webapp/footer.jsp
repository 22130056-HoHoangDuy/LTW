<%--
  Created by IntelliJ IDEA.
  User: lamdo
  Date: 11/14/2025
  Time: 7:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css"/>

<footer class="shop-footer">
    <div class="container">
        <div class="footer-grid">
            <!-- CỘT 1: THƯƠNG HIỆU -->
            <div class="footer-brand">
                <h3 class="brand-name">BabyStore</h3>
                <p class="brand-desc">
                    Cung cấp nội thất trẻ em chính hãng với giá tốt nhất.
                </p>
                <div class="contact-info">
                    <p>
                        <i class="fa-solid fa-location-dot"></i> 123 Đường ABC, TP. Hồ Chí Minh
                    </p>
                    <p>
                        <i class="fa-solid fa-phone"></i>
                        <a href="tel:0123456789">0123 456 789</a>
                    </p>
                    <p>
                        <i class="fa-solid fa-envelope"></i>
                        <a href="mailto:babystore@gmail.com">babystore@gmail.com</a>
                    </p>
                </div>
            </div>

            <!-- CỘT 2: LIÊN KẾT -->
            <div class="footer-links">
                <h4>Hỗ trợ khách hàng</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/policy/warranty.jsp">Chính sách bảo hành</a></li>
                    <li><a href="${pageContext.request.contextPath}/policy/return.jsp">Chính sách đổi trả</a></li>
                    <li><a href="${pageContext.request.contextPath}/guide/payment.jsp">Hướng dẫn thanh toán</a></li>
                    <li><a href="${pageContext.request.contextPath}/guide/shopping.jsp">Hướng dẫn mua hàng</a></li>
                </ul>
            </div>

            <!-- CỘT 3: MẠNG XÃ HỘI & THANH TOÁN -->
            <div class="footer-socials">
                <h4>Kết nối với chúng tôi</h4>
                <div class="social-icons">
                    <a href="#" aria-label="Facebook" title="Facebook">
                        <i class="fa-brands fa-facebook-f"></i>
                    </a>
                    <a href="#" aria-label="Instagram" title="Instagram">
                        <i class="fa-brands fa-instagram"></i>
                    </a>
                    <a href="#" aria-label="TikTok" title="TikTok">
                        <i class="fa-brands fa-tiktok"></i>
                    </a>
                    <a href="#" aria-label="YouTube" title="YouTube">
                        <i class="fa-brands fa-youtube"></i>
                    </a>
                </div>

                <h4>Phương thức thanh toán</h4>
                <div class="payment-icons">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png" alt="Visa">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png" alt="MasterCard">
                    <img src="https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png" alt="Momo">
                    <img src="https://upload.wikimedia.org/wikipedia/vi/7/77/ZaloPay_Logo.png" alt="ZaloPay">
                </div>
            </div>

            <!-- CỘT 4: ĐĂNG KÝ NHẬN TIN -->
            <div class="footer-newsletter">
                <h4>Đăng ký nhận tin</h4>
                <p>Nhận thông tin khuyến mãi và sản phẩm mới nhất.</p>
                <form class="newsletter-form" action="${pageContext.request.contextPath}/newsletter/subscribe"
                      method="post">
                    <input type="email" name="email" placeholder="Nhập email của bạn" required/>
                    <button type="submit">Đăng ký</button>
                </form>
            </div>
        </div>

        <!-- DÒNG DƯỚI CÙNG -->
        <div class="footer-bottom">
            <p>© <span id="year"></span> BabyStore. All rights reserved.</p>
            <ul class="legal-links">
                <li><a href="${pageContext.request.contextPath}/terms.jsp">Điều khoản sử dụng</a></li>
                <li><a href="${pageContext.request.contextPath}/privacy.jsp">Chính sách bảo mật</a></li>
            </ul>
        </div>
    </div>
</footer>

<!-- Font Awesome CDN -->
<script src="https://kit.fontawesome.com/a2e0e6e6a8.js" crossorigin="anonymous"></script>

<script>
    document.getElementById("year").textContent = new Date().getFullYear();
</script>
