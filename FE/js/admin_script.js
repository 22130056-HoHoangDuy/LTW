
// Dùng cho trang Đơn hàng (admin_orders)
function updateStatusColor(select) {
    if (!select) return;

    select.classList.remove("processing", "shipping", "success", "cancel");

    switch (select.value) {
        case "Đang xử lý":
            select.classList.add("processing");
            break;
        case "Đang giao":
            select.classList.add("shipping");
            break;
        case "Hoàn tất":
            select.classList.add("success");
            break;
        case "Đã hủy":
            select.classList.add("cancel");
            break;
    }
}

// Dùng cho trang Tài khoản (admin_accounts) – thường gọi bằng onclick="toggleStatus(this)"
function toggleStatus(btn) {
    if (!btn) return;

    if (btn.classList.contains("btn-on")) {
        btn.classList.remove("btn-on");
        btn.classList.add("btn-off");
        btn.textContent = "Ngưng hoạt động";
    } else {
        btn.classList.remove("btn-off");
        btn.classList.add("btn-on");
        btn.textContent = "Đang hoạt động";
    }
}

// Dùng cho trang Voucher (admin_vouchers)
function toggleVoucherStatus(input) {
    if (!input) return;

    if (input.checked) {
        console.log("Voucher đang hoạt động");
    } else {
        console.log("Voucher đã bị tắt");
    }
}


//  MAIN SCRIPT – chạy sau khi DOM tải xong
document.addEventListener("DOMContentLoaded", () => {
    //  DASHBOARD CHARTS (admin_overview)
    if (typeof Chart !== "undefined") {
        const ctx1 = document.getElementById("revenueChart");
        if (ctx1) {
            new Chart(ctx1, {
                type: "line",
                data: {
                    labels: ["Th1", "Th2", "Th3", "Th4", "Th5", "Th6", "Th7", "Th8", "Th9", "Th10", "Th11"],
                    datasets: [{
                        label: "Doanh thu (triệu VND)",
                        data: [12, 19, 14, 22, 30, 28, 19, 23, 30, 29, 31],
                        borderColor: "#6c63ff",
                        backgroundColor: "rgba(108,99,255,0.1)",
                        borderWidth: 3,
                        tension: 0.3,
                        fill: true,
                        pointRadius: 4,
                        pointBackgroundColor: "#6c63ff",
                        pointHoverRadius: 6
                    }]
                },
                options: {
                    animation: { duration: 1000, easing: "easeOutQuart" },
                    plugins: { legend: { display: false } },
                    scales: {
                        y: { beginAtZero: true, grid: { color: "#eee" } },
                        x: { grid: { display: false } }
                    }
                }
            });
        }

        const ctx2 = document.getElementById("categoryChart");
        if (ctx2) {
            new Chart(ctx2, {
                type: "bar",
                data: {
                    labels: ["Sản phẩm trang trí", "Sản phẩm nội thất"],
                    datasets: [{
                        label: "Số đơn hàng",
                        data: [45, 30],
                        backgroundColor: [
                            "#6c63ff",
                            "#7a74ff"
                        ],
                        borderRadius: 8
                    }]
                },
                options: {
                    animation: { duration: 800, easing: "easeOutCubic" },
                    plugins: { legend: { display: false } },
                    scales: {
                        y: { beginAtZero: true, grid: { color: "#eee" } },
                        x: { grid: { display: false } }
                    }
                }
            });
        }
    }

    //  ADMIN_ORDERS – tô màu status-select
    const statusSelects = document.querySelectorAll(".status-select");
    if (statusSelects.length > 0) {
        statusSelects.forEach(s => updateStatusColor(s));
    }

    //  ADMIN_VOUCHERS – form + nút demo
    const voucherForm = document.getElementById("voucherForm");
    if (voucherForm) {
        voucherForm.addEventListener("submit", (e) => {
            e.preventDefault();
            alert("✅ Voucher mới đã được tạo (mô phỏng)!");
            voucherForm.reset();
        });

        const voucherContainer = document.querySelector(".voucher-form") || document.querySelector(".voucher-list");

        if (voucherContainer) {
            voucherContainer.querySelectorAll(".btn-on").forEach(btn =>
                btn.addEventListener("click", () => alert("🟢 Voucher đã được bật."))
            );
            voucherContainer.querySelectorAll(".btn-off").forEach(btn =>
                btn.addEventListener("click", () => alert("🔴 Voucher đã bị tắt."))
            );
            voucherContainer.querySelectorAll(".btn-delete").forEach(btn =>
                btn.addEventListener("click", () => confirm("⚠️ Xác nhận xóa voucher này?"))
            );
        }
    }


    //  ADMIN_PRODUCTS – nút Sửa / Xóa demo
    const productHeader = document.querySelector(".product-header");
    const productTable = document.querySelector(".data-table");

    if (productHeader && productTable) {
        // Chỉ gắn cho trang product
        const productBtnsOn = productTable.querySelectorAll(".btn-on");
        const productBtnsDelete = productTable.querySelectorAll(".btn-delete");

        productBtnsOn.forEach(btn =>
            btn.addEventListener("click", () => alert("Sửa"))
        );
        productBtnsDelete.forEach(btn =>
            btn.addEventListener("click", () => confirm("Xóa"))
        );
    }


    //  PRODUCT OVERLAY (Thêm sản phẩm)
    const openOverlayBtn = document.querySelector(".add-product-btn");
    const closeOverlayBtn = document.getElementById("closeOverlay");
    const productOverlay = document.getElementById("productOverlay");

    if (openOverlayBtn && productOverlay) {
        openOverlayBtn.addEventListener("click", () => {
            productOverlay.style.display = "flex";
        });
    }
    if (closeOverlayBtn && productOverlay) {
        closeOverlayBtn.addEventListener("click", () => {
            productOverlay.style.display = "none";
        });
    }
});
