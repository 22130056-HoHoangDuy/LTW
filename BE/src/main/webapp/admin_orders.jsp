<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header.jsp" %>

<main class="main">
    <h2>Quản lý đơn hàng</h2>

    <table class="data-table">
        <thead>
        <tr>
            <th>Mã đơn</th>
            <th>Khách hàng</th>
            <th>Ngày đặt</th>
            <th>Tổng tiền</th>
            <th>Thanh toán</th>
            <th>Trạng thái</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td>#1023</td>
            <td>Nguyễn An</td>
            <td>28/10/2025</td>
            <td>1.200.000đ</td>
            <td>COD</td>
            <td>
                <select onchange="updateStatus(this, 1023)">
                    <option>Đang xử lý</option>
                    <option>Đang giao</option>
                    <option>Hoàn tất</option>
                    <option>Đã hủy</option>
                </select>
            </td>
        </tr>
        </tbody>
    </table>
</main>

<script>
function updateStatus(select, orderId) {
    fetch(`/admin/orders/status?id=${orderId}&status=${select.value}`)
        .then(res => res.text())
        .then(txt => {
            if (txt !== "OK") alert("Cập nhật thất bại");
        });
}
</script>

<aside class="right-panel"></aside>
<%@ include file="admin_footer.jsp" %>
