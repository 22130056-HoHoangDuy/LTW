// ===== Biểu đồ Doanh thu theo tháng =====
const ctx1 = document.getElementById('revenueChart');
new Chart(ctx1, {
    type: 'line',
    data: {
        labels: ['Th1', 'Th2', 'Th3', 'Th4', 'Th5', 'Th6', 'Th7', 'Th8', 'Th9', 'Th10', 'Th11'],
        datasets: [{
            label: 'Doanh thu (triệu VND)',
            data: [12, 19, 14, 22, 30, 28, 19, 23, 30, 29, 31],
            borderColor: '#6c63ff',
            backgroundColor: 'rgba(108,99,255,0.1)',
            borderWidth: 3,
            tension: 0.3,
            fill: true,
            pointRadius: 4,
            pointBackgroundColor: '#6c63ff',
            pointHoverRadius: 6
        }]
    },
    options: {
        animation: { duration: 1000, easing: 'easeOutQuart' },
        plugins: { legend: { display: false }},
        scales: {
            y: { beginAtZero: true, grid: { color: '#eee' }},
            x: { grid: { display: false }}
        }
    }
});

// ===== Biểu đồ Đơn hàng theo danh mục =====
const ctx2 = document.getElementById('categoryChart'); // <--- Sửa đúng ID
new Chart(ctx2, {
    type: 'bar',
    data: {
        labels: ['Sản phẩm trang trí', 'Sản phẩm nội thất'],
        datasets: [{
            label: 'Số đơn hàng',
            data: [45, 30, 20, 15, 10],
            backgroundColor: [
                '#6c63ff',
                '#7a74ff',
                '#8a85ff',
                '#a39fff',
                '#c5c2ff'
            ],
            borderRadius: 8
        }]
    },
    options: {
        animation: { duration: 800, easing: 'easeOutCubic' },
        plugins: { legend: { display: false }},
        scales: {
            y: { beginAtZero: true, grid: { color: '#eee' }},
            x: { grid: { display: false }}
        }
    }
});
//admin_orders
    function updateStatusColor(select) {
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

    // Auto apply màu cho tất cả status khi load
    document.querySelectorAll(".status-select").forEach(s => updateStatusColor(s));

//admin_accounts
function toggleStatus(btn) {
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
// admin_voucher
    function toggleVoucherStatus(input) {
    if (input.checked) {
    console.log("Voucher đang hoạt động");
} else {
    console.log("Voucher đã bị tắt");
}
}
    // Xử lý sự kiện tạo voucher (demo)
    const form = document.getElementById("voucherForm");
    form.addEventListener("submit", (e) => {
    e.preventDefault();
    alert("✅ Voucher mới đã được tạo (mô phỏng)!");
    form.reset();
});

    // Các nút hành động demo
    document.querySelectorAll(".btn-on").forEach(btn =>
    btn.addEventListener("click", () => alert("🟢 Voucher đã được bật."))
    );
    document.querySelectorAll(".btn-off").forEach(btn =>
    btn.addEventListener("click", () => alert("🔴 Voucher đã bị tắt."))
    );
    document.querySelectorAll(".btn-delete").forEach(btn =>
    btn.addEventListener("click", () => confirm("⚠️ Xác nhận xóa voucher này?"))
    );

//admin_product
    document.querySelectorAll(".btn-on").forEach(btn =>
    btn.addEventListener("click", () => alert("Sửa"))
    );

    document.querySelectorAll(".btn-delete").forEach(btn =>
    btn.addEventListener("click", () => confirm("Xóa"))
    );

