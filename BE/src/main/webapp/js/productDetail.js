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
const reviewForm = document.getElementById("reviewForm");

if (reviewForm) {
    reviewForm.addEventListener("submit", function (e) {
        // 2. Chặn reload trang mặc định
        e.preventDefault();

        const submitBtn = document.getElementById("btn-send-feedback");

        // Hiệu ứng UX: Disable nút và đổi text để người dùng biết đang gửi
        const originalBtnText = submitBtn.innerHTML;
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<i class="fa fa-spinner fa-spin"></i> Đang gửi...';

        const formData = new FormData(this);
        const actionUrl = this.getAttribute("action");

        fetch(actionUrl, {
            method: "POST",
            body: formData
        })
            .then(response => {
                // Trường hợp Server báo redirect (thường là về Login)
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
                    return; // Dừng tại đây
                }

                // Trường hợp thành công (Server trả về 200 OK)
                if (response.ok) {
                    return Swal.fire({
                        icon: "success",
                        title: "Thành công!",
                        text: "Đánh giá của bạn đã được gửi.",
                        timer: 2000,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.reload(); // Tải lại trang để hiện comment
                    });
                } else {
                    // Trường hợp Server trả lỗi (500, 400...)
                    throw new Error("Server Error");
                }
            })
            .catch(error => {
                console.error("Chi tiết lỗi:", error);
                Swal.fire({
                    icon: "error",
                    title: "Lỗi gửi đánh giá",
                    text: "Có lỗi xảy ra từ phía máy chủ. Vui lòng kiểm tra lại!"
                });
            })
            .finally(() => {
                // Khôi phục nút bấm dù thành công hay thất bại
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalBtnText;
            });
    });
}
function increaseQty() {
    var input = document.getElementById('quantity');
    input.value = parseInt(input.value) + 1;
}

function decreaseQty() {
    var input = document.getElementById('quantity');
    if (parseInt(input.value) > 1) {
        input.value = parseInt(input.value) - 1;
    }
}
