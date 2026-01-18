document.addEventListener("DOMContentLoaded", () => {

    const { revenueByMonth, ordersByCategory, contextPath } = window.ADMIN_DATA || {};

    /* ================= REVENUE CHART ================= */
    if (revenueByMonth && revenueByMonth.length) {

        const labels = revenueByMonth.map(r => `Tháng ${r.month}`);
        const data = revenueByMonth.map(r => r.revenue);

        new Chart(document.getElementById('revenueChart'), {
            type: 'bar',
            data: {
                labels,
                datasets: [{
                    label: 'Doanh thu (VNĐ)',
                    data
                }]
            }
        });
    }

    /* ================= CATEGORY CHART ================= */
    if (ordersByCategory && ordersByCategory.length) {

        new Chart(document.getElementById('categoryChart'), {
            type: 'doughnut',
            data: {
                labels: ordersByCategory.map(c => c.categoryName),
                datasets: [{
                    data: ordersByCategory.map(c => c.totalOrders)
                }]
            }
        });
    }

    /* ================= ACCOUNT STATUS ================= */
    window.updateStatus = function (select, id) {
        fetch(`${contextPath}/admin/accounts/status?id=${id}&status=${select.value}`)
            .then(res => res.text())
            .then(txt => {
                if (txt !== "OK") alert("Cập nhật thất bại");
            });
    };

    /* ================= PROFILE POPUP ================= */
    const popup = document.getElementById("profile-popup");

    window.showProfile = function (row) {
        const id = row.dataset.id;
        const rect = row.getBoundingClientRect();

        popup.style.top = rect.top + "px";
        popup.style.left = rect.right + 12 + "px";
        popup.style.display = "block";
        popup.innerHTML = "Loading...";

        fetch(`${contextPath}/admin/accounts/profile?accountId=${id}`)
            .then(res => res.json())
            .then(p => {
                popup.innerHTML = `
                    <img src="${p.avatar_url || '/img/default-avatar.png'}">
                    <b>${p.full_name || ''}</b><br>
                    📧 ${p.email || ''}<br>
                    📞 ${p.phone || ''}<br>
                    🏠 ${p.address || ''}<br>
                    ⚥ ${p.gender || ''}<br>
                `;
            })
            .catch(() => popup.innerHTML = "Không có dữ liệu");
    };

    window.hideProfile = () => popup.style.display = "none";
});
