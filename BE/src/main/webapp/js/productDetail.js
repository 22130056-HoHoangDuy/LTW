const tabList = document.querySelectorAll(".nav-link");
const productDetail = document.querySelector(".product-detail");

// Khởi tạo backToTop luôn từ đầu
const backBtn = document.getElementById("backToTop");
const footer = document.getElementById("footer-frame");

// Lắng nghe scroll 1 lần duy nhất
window.addEventListener("scroll", () => {
    const footerTop = footer.getBoundingClientRect().top;
    const windowHeight = window.innerHeight;
    if (window.scrollY > 400) {
        backBtn.classList.add("show");
    } else {
        backBtn.classList.remove("show");
    }
    if (footerTop < windowHeight) {
        backBtn.style.background = "white";
        backBtn.style.color = "blue";
    } else {
        backBtn.style.background = "#003dd4";
        backBtn.style.color = "white";
    }
});

// Cuộn lên đầu
backBtn.addEventListener("click", () => {
    window.scrollTo({top: 0, behavior: "smooth"});
});
//Bấm vào tab
tabList.forEach((link) => {
    link.addEventListener("click", (e) => {
        e.preventDefault();

        // 1. Xóa class active ở tất cả các tab
        tabList.forEach((l) => l.classList.remove("active"));

        document.querySelectorAll(".tab-content").forEach(content => {
            content.style.display = "none";
            content.classList.remove("active");
        });
        // 2. Thêm active cho tab được click
        link.classList.add("active");

        // 3. Hiển thị nội dung tương ứng dựa vào data-target
        const targetId = link.getAttribute("data-target");
        const targetContent = document.querySelector(targetId);
        if (targetContent) {
            targetContent.style.display = "block";
            targetContent.classList.add("active");
        }

        // Hiển thị nút BackToTop cho tab CHI TIẾT
        if (targetId === "#tab-detail") {
            backBtn.style.display = "block";
        } else {
            backBtn.style.display = "none";
        }
    });
})

// --- CẤU HÌNH TOAST (Thông báo nhỏ) ---
const Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
        toast.onmouseenter = Swal.stopTimer;
        toast.onmouseleave = Swal.resumeTimer;
    }
});

// --- XỬ LÝ GỬI ĐÁNH GIÁ (LOGIC CHUẨN) ---
// 1. Chọn Form thay vì chọn nút (để quản lý dữ liệu tốt hơn)
// --- XỬ LÝ GỬI ĐÁNH GIÁ ---
const reviewForm = document.getElementById("reviewForm");

if (reviewForm) {
    reviewForm.addEventListener("submit", function (e) {
        e.preventDefault();

        const submitBtn = document.getElementById("btn-send-feedback");
        const originalBtnText = submitBtn.innerHTML;

        // UX: Disable nút để tránh spam click
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Đang gửi...';

        // Lấy dữ liệu từ form
        const formData = new FormData(this);
        const params = new URLSearchParams(formData);

        fetch(this.getAttribute("action"), {
            method: "POST",
            body: params,
        })
            .then(response => {
                // Xử lý khi server yêu cầu đăng nhập (redirect đến login)
                if (response.redirected && response.url.includes("login")) {
                    Swal.fire({
                        icon: "warning",
                        title: "Yêu cầu đăng nhập",
                        text: "Bạn cần đăng nhập để gửi đánh giá!",
                        showCancelButton: true,
                        confirmButtonText: "Đăng nhập ngay",
                        cancelButtonText: "Hủy"
                    }).then((result) => {
                        if (result.isConfirmed) {
                            window.location.href = response.url;
                        }
                    });
                    return;
                }

                // Nếu thành công (Server redirect lại trang detail -> status 200)
                if (response.ok) {
                    Swal.fire({
                        icon: "success",
                        title: "Thành công!",
                        text: "Đánh giá của bạn đã được gửi.",
                        timer: 1500,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.reload();
                    });
                } else {
                    throw new Error("Server Error");
                }
            })
            .catch(error => {
                console.error("Lỗi:", error);
                Swal.fire({
                    icon: "error",
                    title: "Lỗi",
                    text: "Có lỗi xảy ra khi gửi đánh giá."
                });
            })
            .finally(() => {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalBtnText;
            });
    });
}

function increaseUI(productId) {
    const input = document.getElementById(`quantity-${productId}`);
    if (!input) return;
    input.value = (parseInt(input.value || "1", 10) + 1);
}

function decreaseUI(productId) {
    const input = document.getElementById(`quantity-${productId}`);
    if (!input) return;
    const cur = parseInt(input.value || "1", 10);
    if (cur > 1) input.value = cur - 1;
}

document.addEventListener("DOMContentLoaded", () => {
    const buttons = document.querySelectorAll(".add-btn,.buy-btn");
    if (!buttons.length) return;

    buttons.forEach(button => {
        button.addEventListener("click", (e) => {
            e.preventDefault();

            const productId = button.dataset.productId;
            const input = document.getElementById(`quantity-${productId}`);
            const qty = input ? parseInt(input.value || "1", 10) : 1;

            const returnUrl = window.location.pathname + window.location.search;

            const url = new URL(button.href, window.location.origin);
            url.searchParams.set("quantity", String(qty));
            url.searchParams.set("returnUrl", returnUrl);

            // 🔔 SweetAlert yêu cầu đăng nhập
            Swal.fire({
                icon: "warning",
                title: "Yêu cầu đăng nhập",
                text: "Bạn cần đăng nhập để sử dụng chức năng này!",
                showCancelButton: true,
                confirmButtonText: "Đăng nhập ngay",
                cancelButtonText: "Hủy"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = url.toString();
                }
            });
        });
    });
});


