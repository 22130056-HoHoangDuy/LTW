// ===============================
// LẤY CÁC NÚT TRONG SIDEBAR
// ===============================
const btnInfo = document.getElementById("btn-info");
const btnOrders = document.getElementById("btn-orders");
const btnFavorite = document.getElementById("btn-favorite");

// ===============================
// LẤY CÁC SECTION
// ===============================
const infoSection = document.getElementById("info-section");
const ordersSection = document.getElementById("orders-section");
const favoriteSection = document.getElementById("favorite-section");

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
// LƯU THÔNG TIN
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
});
