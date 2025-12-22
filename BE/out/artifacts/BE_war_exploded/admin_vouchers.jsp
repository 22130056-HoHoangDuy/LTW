<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/WEB-INF/admin_header.jsp" %>

<main class="main">
    <h2>Quản lý Voucher</h2>

    <!-- Form tạo voucher -->
    <section class="voucher-form">
        <h3>Tạo voucher mới</h3>
        <form id="voucherForm" class="form-grid">

            <div class="form-item">
                <label for="code">Mã voucher</label>
                <input type="text" id="code" placeholder="VD: SALE2025" required />
            </div>

            <div class="form-item">
                <label for="discount_value">Giá trị giảm</label>
                <input type="number" id="discount_value" placeholder="VD: 20" required />
            </div>

            <div class="form-item">
                <label for="discount_type">Loại giảm</label>
                <select id="discount_type">
                    <option value="percent">Phần trăm (%)</option>
                    <option value="amount">Giá trị (VNĐ)</option>
                </select>
            </div>

            <div class="form-item">
                <label for="quantity">Số lượng</label>
                <input type="number" id="quantity" placeholder="VD: 100" />
            </div>

            <div class="form-item">
                <label for="start_date">Ngày bắt đầu</label>
                <input type="date" id="start_date" />
            </div>

            <div class="form-item">
                <label for="end_date">Ngày kết thúc</label>
                <input type="date" id="end_date" />
            </div>

            <button type="submit" class="btn-primary">Tạo Voucher</button>
        </form>
    </section>

    <!-- Danh sách voucher -->
    <section class="voucher-list">
        <h3>Danh sách Voucher</h3>

        <table class="data-table">
            <thead>
                <tr>
                    <th>Mã</th>
                    <th>Giảm</th>
                    <th>Loại</th>
                    <th>Số lượng</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>

            <tbody id="voucherTableBody">

                <!-- Row 1 -->
                <tr>
                    <td>SALE50</td>
                    <td>50%</td>
                    <td>Phần trăm</td>
                    <td>120</td>

                    <td>
                        <label class="switch">
                            <input type="checkbox" checked onchange="toggleVoucherStatus(this)">
                            <span class="slider"></span>
                        </label>
                    </td>

                    <td>
                        <button class="btn-small btn-on">Sửa</button>
                        <button class="btn-small btn-delete">Xóa</button>
                    </td>
                </tr>

                <!-- Row 2 -->
                <tr>
                    <td>NEWYEAR2025</td>
                    <td>200,000đ</td>
                    <td>Giá trị</td>
                    <td>50</td>

                    <td>
                        <label class="switch">
                            <input type="checkbox" onchange="toggleVoucherStatus(this)">
                            <span class="slider"></span>
                        </label>
                    </td>

                    <td>
                        <button class="btn-small btn-on">Sửa</button>
                        <button class="btn-small btn-delete">Xóa</button>
                    </td>
                </tr>

            </tbody>
        </table>
    </section>
</main>

<aside class="right-panel"></aside>

<%@ include file="/WEB-INF/admin_footer.jsp" %>
