<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/admin_header.jsp" %>
<main class="main">
    <h2>Quản lý tài khoản</h2>

    <!-- Thanh tìm kiếm -->
    <div class="search-box">
        <input type="text" placeholder="Tìm kiếm tài khoản...">
        <i class="fa-solid fa-magnifying-glass"></i>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>Mã khách hàng</th>
                <th>Tên khách hàng</th>
                <th>Email</th>
                <th>Ngày tạo</th>
                <th>Trạng thái</th>
            </tr>
        </thead>

        <tbody>
            <!-- Demo data (sau này sẽ thay bằng dữ liệu từ controller) -->
            <tr>
                <td>KH001</td>
                <td>Nguyễn An</td>
                <td>an@gmail.com</td>
                <td>10/01/2025</td>
                <td>
                    <button class="btn-small btn-on" onclick="toggleStatus(this)">Đang hoạt động</button>
                </td>
            </tr>

            <tr>
                <td>KH002</td>
                <td>Lan Anh</td>
                <td>lan@gmail.com</td>
                <td>03/02/2025</td>
                <td>
                    <button class="btn-small btn-off" onclick="toggleStatus(this)">Ngưng hoạt động</button>
                </td>
            </tr>

            <tr>
                <td>KH003</td>
                <td>Minh Phúc</td>
                <td>phuc@gmail.com</td>
                <td>17/03/2025</td>
                <td>
                    <button class="btn-small btn-on" onclick="toggleStatus(this)">Đang hoạt động</button>
                </td>
            </tr>
        </tbody>
    </table>
</main>

<!-- Right Panel để trống -->
<aside class="right-panel"></aside>

<%@ include file="/WEB-INF/admin_footer.jsp" %>

