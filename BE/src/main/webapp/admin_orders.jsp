<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/WEB-INF/admin_header.jsp" %>

<main class="main">
    <h2>Quản lý đơn hàng</h2>

    <!-- Thanh tìm kiếm -->
    <div class="search-box">
        <input type="text" placeholder="Tìm kiếm đơn hàng...">
        <i class="fa-solid fa-magnifying-glass"></i>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>Mã đơn</th>
                <th>Khách hàng</th>
                <th>Ngày đặt</th>
                <th>Tổng tiền</th>
                <th>Mã voucher</th>
                <th>Thanh toán</th>
                <th>Trạng thái</th>
            </tr>
        </thead>

        <tbody>

            <!-- Demo dữ liệu - sau sẽ thay bằng dữ liệu từ DB -->
            <tr>
                <td>#1023</td>
                <td>Nguyễn An</td>
                <td>28/10/2025</td>
                <td>1.200.000đ</td>
                <td>VOUCHER15</td>
                <td>COD</td>
                <td>
                    <select class="status-select" onchange="updateStatusColor(this)">
                        <option>Đang xử lý</option>
                        <option>Đang giao</option>
                        <option>Hoàn tất</option>
                        <option>Đã hủy</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>#1022</td>
                <td>Minh Phúc</td>
                <td>27/10/2025</td>
                <td>950.000đ</td>
                <td>—</td>
                <td>Card</td>
                <td>
                    <select class="status-select" onchange="updateStatusColor(this)">
                        <option>Hoàn tất</option>
                        <option>Đang xử lý</option>
                        <option>Đang giao</option>
                        <option>Đã hủy</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td>#1021</td>
                <td>Lan Anh</td>
                <td>27/10/2025</td>
                <td>2.150.000đ</td>
                <td>SALE10</td>
                <td>COD</td>
                <td>
                    <select class="status-select" onchange="updateStatusColor(this)">
                        <option>Đang giao</option>
                        <option>Đang xử lý</option>
                        <option>Hoàn tất</option>
                        <option>Đã hủy</option>
                    </select>
                </td>
            </tr>

        </tbody>
    </table>
</main>

<aside class="right-panel"></aside>

<%@ include file="/WEB-INF/admin_footer.jsp" %>
