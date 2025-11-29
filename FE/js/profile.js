// ===============================
// LẤY CÁC NÚT TRONG SIDEBAR
// ===============================
const btnInfo = document.getElementById("btn-info");
const btnOrders = document.getElementById("btn-orders");
const btnFavorite = document.getElementById("btn-favorite");
const btnChangePass = document.getElementById("btn-change-pass");

// ===============================
// LẤY CÁC SECTION
// ===============================
const infoSection = document.getElementById("info-section");
const ordersSection = document.getElementById("orders-section");
const favoriteSection = document.getElementById("favorite-section");
const passwordSection = document.getElementById("password-section");

// ===============================
// HÀM RESET ACTIVE
// ===============================
function resetActive() {
    document.querySelectorAll(".sidebar li").forEach(li => li.classList.remove("active"));
    document.querySelectorAll(".section").forEach(sec => sec.classList.remove("active"));
}

// ===============================
// CLICK — THÔNG TIN CÁ NHÂN
// ===============================
btnInfo.addEventListener("click", () => {
    resetActive();
    btnInfo.classList.add("active");
    infoSection.classList.add("active");
});

// ===============================
// CLICK — ĐƠN HÀNG ĐÃ MUA
// ===============================
btnOrders.addEventListener("click", () => {
    resetActive();
    btnOrders.classList.add("active");
    ordersSection.classList.add("active");
});

// ===============================
// CLICK — YÊU THÍCH
// ===============================
btnFavorite.addEventListener("click", () => {
    resetActive();
    btnFavorite.classList.add("active");
    favoriteSection.classList.add("active");
});

// ===============================
// CLICK — ĐỔI MẬT KHẨU
// ===============================
btnChangePass.addEventListener("click", () => {
    resetActive();
    btnChangePass.classList.add("active");
    passwordSection.classList.add("active");
});

// ===============================
// PREVIEW ẢNH AVATAR
// ===============================
const avatarInput = document.getElementById("avatar-upload");
const avatarPreview = document.getElementById("avatar-preview");

avatarInput.addEventListener("change", function () {
    const file = this.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            avatarPreview.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }
});

// ===============================
// LƯU THÔNG TIN CÁ NHÂN
// ===============================
document.getElementById("save-btn").addEventListener("click", () => {
    const info = {
        full_name: document.getElementById("full_name").value,
        phone: document.getElementById("phone").value,
        address: document.getElementById("address").value,
        gender: document.getElementById("gender").value,
        bod: document.getElementById("bod").value
    };

    alert("Thông tin đã được lưu:\n" + JSON.stringify(info, null, 2));

    // Nếu cần gửi lên Server Servlet:
    // fetch("/UpdateProfileServlet", { method: "POST", body: JSON.stringify(info) })
});

// ===============================
// ĐỔI MẬT KHẨU
// ===============================
document.getElementById("change-pass-btn").addEventListener("click", () => {

    const oldPass = document.getElementById("old_password").value;
    const newPass = document.getElementById("new_password").value;
    const confirmPass = document.getElementById("confirm_password").value;

    // Validate
    if (!oldPass || !newPass || !confirmPass) {
        alert("Vui lòng nhập đầy đủ thông tin!");
        return;
    }

    if (newPass.length < 6) {
        alert("Mật khẩu mới phải ít nhất 6 ký tự!");
        return;
    }

    if (newPass !== confirmPass) {
        alert("Mật khẩu nhập lại không khớp!");
        return;
    }

    alert("Đổi mật khẩu thành công!");

    // Gửi Servlet khi bạn có API
    /*
    fetch("/ChangePasswordServlet", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
            old_password: oldPass,
            new_password: newPass
        })
    })
    .then(res => res.json())
    .then(data => alert(data.message));
    */
});
