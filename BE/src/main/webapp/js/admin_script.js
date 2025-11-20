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
