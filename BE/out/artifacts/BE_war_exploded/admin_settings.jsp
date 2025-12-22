<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="/WEB-INF/admin_header.jsp" %>

<style>
    /* ===== Custom styling cho settings page ===== */
    .settings-container {
        background: #fff;
        border-radius: 20px;
        padding: 25px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        animation: fadeIn 0.6s ease;
    }

    .settings-tabs {
        display: flex;
        gap: 20px;
        margin-bottom: 25px;
        border-bottom: 2px solid #eee;
    }

    .settings-tab {
        cursor: pointer;
        font-weight: 600;
        padding: 10px 15px;
        position: relative;
        color: #777;
        transition: color 0.3s ease;
    }

    .settings-tab.active {
        color: #6c63ff;
    }

    .settings-tab.active::after {
        content: "";
        position: absolute;
        bottom: -2px;
        left: 0;
        width: 100%;
        height: 3px;
        background: #6c63ff;
        border-radius: 3px;
        animation: slideIn 0.3s ease;
    }

    .tab-content {
        display: none;
        animation: fadeInUp 0.5s ease;
    }

    .tab-content.active {
        display: block;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: scale(0.98); }
        to { opacity: 1; transform: scale(1); }
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideIn {
        from { width: 0; }
        to { width: 100%; }
    }

    .btn-primary {
        background: linear-gradient(135deg, #6c63ff, #918bff);
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 10px rgba(108, 99, 255, 0.3);
    }

    .form-item input:focus,
    .form-item select:focus {
        border-color: #6c63ff;
        outline: none;
        box-shadow: 0 0 5px rgba(108, 99, 255, 0.3);
        transition: 0.2s;
    }
</style>

<main class="main">
    <h2>Cài đặt hệ thống</h2>

    <div class="settings-container">

        <!-- TAB HEADER -->
        <div class="settings-tabs">
            <div class="settings-tab active" data-tab="theme">🎨 Giao diện</div>
            <div class="settings-tab" data-tab="account">👤 Tài khoản</div>
        </div>

        <!-- TAB: GIAO DIỆN -->
        <div class="tab-content active" id="theme">
            <form class="form-grid">

                <div class="form-item">
                    <label for="theme-mode">Chế độ hiển thị</label>
                    <select id="theme-mode">
                        <option>Sáng</option>
                        <option>Tối</option>
                    </select>
                </div>

                <div class="form-item">
                    <label for="color">Màu chủ đạo</label>
                    <input type="color" id="color" value="#6c63ff">
                </div>

                <div class="form-item">
                    <label for="logo">Logo website</label>
                    <input type="file" id="logo" accept="image/*">
                </div>

                <button type="submit" class="btn-primary">💾 Lưu thay đổi</button>

            </form>
        </div>

        <!-- TAB: TÀI KHOẢN -->
        <div class="tab-content" id="account">

            <form class="form-grid">

                <div class="form-item">
                    <label for="admin-name">Tên hiển thị</label>
                    <input type="text" id="admin-name" value="Hồ Hoàng Duy">
                </div>

                <div class="form-item">
                    <label for="admin-email">Email</label>
                    <input type="email" id="admin-email" value="hoduy2921@gmail.com">
                </div>

                <div class="form-item">
                    <label for="admin-pass">Mật khẩu mới</label>
                    <input type="password" id="admin-pass" placeholder="•••••••">
                </div>

                <button type="submit" class="btn-primary">🔄 Cập nhật</button>
            </form>

            <div style="margin-top: 15px;">
                <button class="btn-small btn-delete">🚪 Đăng xuất</button>
            </div>

        </div>

    </div>
</main>

<aside class="right-panel">
    <h3>💡 Gợi ý</h3>
    <ul class="tasks">
        <li><div>🌗 Chuyển sang chế độ tối giúp giảm mỏi mắt.</div></li>
        <li><div>🎨 Hãy chọn màu phù hợp với nhận diện thương hiệu.</div></li>
        <li><div>🔐 Đặt mật khẩu mạnh để bảo vệ tài khoản.</div></li>
    </ul>
</aside>

<script>
    // --- Tab switching ---
    const tabs = document.querySelectorAll(".settings-tab");
    const contents = document.querySelectorAll(".tab-content");

    tabs.forEach(tab => {
        tab.addEventListener("click", () => {
            tabs.forEach(t => t.classList.remove("active"));
            contents.forEach(c => c.classList.remove("active"));

            tab.classList.add("active");
            document.getElementById(tab.dataset.tab).classList.add("active");
        });
    });

    // --- Theme Preview ---
    const themeSelect = document.getElementById('theme-mode');
    themeSelect.addEventListener('change', () => {
        if (themeSelect.value === 'Tối') {
            document.body.style.background = '#1f1f2e';
            document.body.style.color = '#eee';
        } else {
            document.body.style.background = '#f5f7fb';
            document.body.style.color = '#333';
        }
    });
</script>

<%@ include file="/WEB-INF/admin_footer.jsp" %>
