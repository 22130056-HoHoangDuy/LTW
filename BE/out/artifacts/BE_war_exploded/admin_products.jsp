<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/WEB-INF/admin_header.jsp" %>

<!-- PRODUCT OVERLAY (MODAL) -->
<div class="product-overlay" id="productOverlay">
    <div class="product-modal">
        <h3>Thêm sản phẩm mới</h3>

        <div class="form-grid">
            <div class="form-item">
                <label>Tên sản phẩm</label>
                <input type="text" placeholder="Nhập tên sản phẩm" />
            </div>

            <div class="form-item">
                <label>Giá</label>
                <input type="number" placeholder="Nhập giá" />
            </div>

            <div class="form-item">
                <label>Ảnh (URL)</label>
                <input type="text" placeholder="Link ảnh sản phẩm" />
            </div>

            <div class="form-item">
                <label>Thương hiệu</label>
                <input type="text" placeholder="Ví dụ: ODM, TopKids..." />
            </div>

            <div class="form-item">
                <label>Kích thước</label>
                <input type="text" placeholder="Ví dụ: Vừa, 1m2, nhỏ..." />
            </div>

            <div class="form-item">
                <label>Trọng lượng (gram)</label>
                <input type="number" placeholder="Ví dụ: 500" />
            </div>

            <div class="form-item">
                <label>Chất liệu</label>
                <input type="text" placeholder="Nhựa, gỗ tự nhiên..." />
            </div>

            <div class="form-item">
                <label>Tình trạng</label>
                <label class="switch">
                    <input type="checkbox" checked>
                    <span class="slider"></span>
                </label>
            </div>

            <div class="form-item">
                <label>Danh mục</label>
                <select>
                    <option>Chọn danh mục</option>
                    <option value="1">Đồ nội thất</option>
                    <option value="2">Đồ trang trí</option>
                    <option value="3">Đồ chơi</option>
                </select>
            </div>

            <div class="form-item textarea-full">
                <label>Mô tả sản phẩm</label>
                <textarea></textarea>
            </div>
        </div>

        <div class="modal-actions">
            <button class="btn-primary">Thêm sản phẩm</button>
            <button class="btn-small btn-delete" id="closeOverlay">Hủy</button>
        </div>
    </div>
</div>

<!-- MAIN CONTENT -->
<main class="main">
    <h2>Quản lý sản phẩm</h2>

    <div class="product-header">
        <button class="btn-primary add-product-btn">
            <i class="fa-solid fa-plus"></i> Thêm sản phẩm
        </button>

        <div class="search-box">
            <input type="text" placeholder="Tìm kiếm sản phẩm...">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>
    </div>

    <table class="data-table">
        <thead>
            <tr>
                <th>Mã sản phẩm</th>
                <th>Tên sản phẩm</th>
                <th>Danh mục</th>
                <th>Giá</th>
                <th>Hành động</th>
            </tr>
        </thead>

        <tbody>
            <tr>
                <td>001</td>
                <td>Bộ bàn ghế học sinh chống gù 001</td>
                <td>Đồ nội thất</td>
                <td>6.500.000đ</td>
                <td>
                    <button class="btn-small btn-on">Sửa</button>
                    <button class="btn-small btn-delete">Xóa</button>
                </td>
            </tr>

            <tr>
                <td>002</td>
                <td>Tranh trang trí tường phòng bé TG081</td>
                <td>Đồ trang trí</td>
                <td>950.000đ</td>
                <td>
                    <button class="btn-small btn-on">Sửa</button>
                    <button class="btn-small btn-delete">Xóa</button>
                </td>
            </tr>
        </tbody>
    </table>
</main>

<aside class="right-panel"></aside>

<%@ include file="/WEB-INF/admin_footer.jsp" %>
