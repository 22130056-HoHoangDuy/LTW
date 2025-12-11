<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/WEB-INF/admin_header.jsp" %>

<main class="main">
    <h2>Quản lý danh mục</h2>

    <!-- Form thêm danh mục -->
    <section class="voucher-form">
        <h3>Thêm danh mục mới</h3>
        <form class="form-grid">
            <div class="form-item">
                <label for="cat-name">Tên danh mục</label>
                <input type="text" id="cat-name" placeholder="Nhập tên danh mục" />
            </div>

            <div class="form-item">
                <label for="cat-status">Trạng thái</label>
                <select id="cat-status">
                    <option value="on">Hiển thị</option>
                    <option value="off">Ẩn</option>
                </select>
            </div>

            <button type="submit" class="btn-primary">Thêm danh mục</button>
        </form>
    </section>

    <!-- Danh sách danh mục -->
    <section class="voucher-list">
        <h3>Danh sách danh mục</h3>
        <table class="data-table">
            <thead>
                <tr>
                    <th>Tên danh mục</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>Đồ nội thất</td>
                    <td><span class="status on">Hiển thị</span></td>
                    <td>
                        <button class="btn-small btn-off">Ẩn</button>
                        <button class="btn-small btn-delete">Xóa</button>
                    </td>
                </tr>

                <tr>
                    <td>Đồ trang trí phòng</td>
                    <td><span class="status on">Hiển thị</span></td>
                    <td>
                        <button class="btn-small btn-off">Ẩn</button>
                        <button class="btn-small btn-delete">Xóa</button>
                    </td>
                </tr>

                <tr>
                    <td>Đồ chơi & Vật phẩm trang trí</td>
                    <td><span class="status on">Hiển thị</span></td>
                    <td>
                        <button class="btn-small btn-off">Ẩn</button>
                        <button class="btn-small btn-delete">Xóa</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>
</main>

<aside class="right-panel"></aside>

<%@ include file="/WEB-INF/admin_footer.jsp" %>
