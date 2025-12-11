<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/WEB-INF/admin_header.jsp" %>

<main class="main">
    <h2>Quản lý kho hàng</h2>

    <!-- FORM THÊM KHO -->
    <div class="voucher-form">
        <h3>Thêm kho mới</h3>

        <div class="form-grid">
            <div class="form-item">
                <label>Tên</label>
                <input type="text" placeholder="Ví dụ: Kho Hà Nội">
            </div>

            <div class="form-item">
                <label>Địa chỉ</label>
                <input type="text" placeholder="123 Nguyễn Trãi, Hà Nội">
            </div>

            <button class="btn-primary">Thêm kho hàng</button>
        </div>
    </div>

    <!-- DANH SÁCH KHO -->
    <div class="voucher-list">
        <h3>Danh sách kho hàng</h3>

        <table class="data-table">
            <thead>
                <tr>
                    <th>Mã kho hàng</th>
                    <th>Tên kho hàng</th>
                    <th>Địa chỉ</th>
                    <th>Số lượng SP</th>
                    <th>Hành động</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>1</td>
                    <td>Kho Hà Nội</td>
                    <td>123 Nguyễn Trãi, Hà Nội</td>
                    <td>280</td>
                    <td>
                        <button class="btn-small btn-on">Xem</button>
                        <button class="btn-small btn-off">Sửa</button>
                        <button class="btn-small btn-delete">Xóa</button>
                    </td>
                </tr>

                <tr>
                    <td>2</td>
                    <td>Kho Đà Nẵng</td>
                    <td>45 Trần Phú, Đà Nẵng</td>
                    <td>120</td>
                    <td>
                        <button class="btn-small btn-on">Xem</button>
                        <button class="btn-small btn-off">Sửa</button>
                        <button class="btn-small btn-delete">Xóa</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

</main>

<aside class="right-panel"></aside>

<%@ include file="/WEB-INF/admin_footer.jsp" %>
