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

// const commentInput = document.getElementById("feedback-input");
// const sendBtn = document.getElementById("btn-send-feedback");
// const commentContainer = document.getElementById("comment-list");
//
// if (commentInput && sendBtn) {
//     const toggleSendBtnColor = (isFocused) => {
//         if (isFocused) {
//             sendBtn.classList.add("focused");
//         } else {
//             sendBtn.classList.remove("focused");
//         }
//     };
//     commentInput.addEventListener("focus", () => toggleSendBtnColor(true));
//     commentInput.addEventListener("blur", () => toggleSendBtnColor(false));
//     const submitComment = () => {
//         const text = commentInput.value.trim();
//         if (!text) return;
//         // Tạo div comment
//         const commentDiv = document.createElement("div");
//         commentDiv.classList.add("comment-item");
//         // Header: tên + icon
//         commentDiv.innerHTML = `
//                         <div class="comment-header">
//                             <span>Lâm Doanh</span>
//                             <span style="color:green;">✔ Đã mua tại BabyStore.com.vn</span>
//                         </div>
//                         <div class="comment-content">${text}</div>
//                         <div class="comment-date">${new Date().toLocaleDateString(
//             "vi-VN"
//         )}</div>
//                     `;
//         commentContainer.appendChild(commentDiv);
//         commentInput.value = "";
//         toggleSendBtnColor(true);
//     };
//     sendBtn.addEventListener("click", submitComment);
//     commentInput.addEventListener("keydown", (e) => {
//         if (e.key === "Enter") {
//             e.preventDefault();
//             submitComment();
//         }
//     });
// }
// ;

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
