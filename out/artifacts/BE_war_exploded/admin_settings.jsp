<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Admin - Cài đặt hệ thống</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_chart.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>

    <!-- Custom CSS cho settings -->
    <style>
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
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.98); }
            to { opacity: 1; transform: scale(1); }
        }
    </style>
</head>

<body>

<div class="dashboard">
    <!-- SIDEBAR -->
    <aside class="sidebar">
        <nav class="menu">
            <a href="${pageContext.request.contextPath}/admin/overview">
                <i class="fa-solid fa-house"></i>
                <span>Dashboard</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/accounts">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/orders">
                <i class="fa-solid fa-box"></i>
                <span>Đơn hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/products">
                <i class="fa-solid fa-cubes"></i>
                <span>Sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/categories">
                <i class="fa-solid fa-layer-group"></i>
                <span>Danh mục sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/brands">
                <i class="fa-solid fa-tags"></i>
                <span>Thương hiệu</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/contacts">
                <i class="fa-solid fa-envelope"></i>
                <span>Liên hệ</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/stocks">
                <i class="fa-solid fa-warehouse"></i>
                <span>Kho hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/vouchers">
                <i class="fa-solid fa-ticket"></i>
                <span>Vouchers</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/settings" class="active">
                <i class="fa-solid fa-gear"></i>
                <span>Cài đặt</span>
            </a>
        </nav>
    </aside>
    <!-- CONTENT -->
    <div class="content-wrapper">

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
                            <label>Chế độ hiển thị</label>
                            <select id="theme-mode">
                                <option>Sáng</option>
                                <option>Tối</option>
                            </select>
                        </div>

                        <div class="form-item">
                            <label>Màu chủ đạo</label>
                            <input type="color" value="#6c63ff">
                        </div>

                        <div class="form-item">
                            <label>Logo website</label>
                            <input type="file" accept="image/*">
                        </div>

                        <button class="btn-primary">💾 Lưu thay đổi</button>
                    </form>
                </div>

                <!-- TAB: TÀI KHOẢN -->
                <div class="tab-content" id="account">
                    <form class="form-grid">

                        <div class="form-item">
                            <label>Tên hiển thị</label>
                            <input type="text" value="Admin">
                        </div>

                        <div class="form-item">
                            <label>Email</label>
                            <input type="email" value="admin@gmail.com">
                        </div>

                        <div class="form-item">
                            <label>Mật khẩu mới</label>
                            <input type="password" placeholder="••••••">
                        </div>

                        <button class="btn-primary">🔄 Cập nhật</button>
                    </form>

                    <div style="margin-top: 15px;">
                        <button class="btn-small btn-delete">🚪 Đăng xuất</button>
                    </div>
                </div>

            </div>
        </main>

        <!-- RIGHT PANEL -->
        <aside class="right-panel">
            <h3>💡 Gợi ý</h3>
            <ul class="tasks">
                <li>🌗 Chuyển sang chế độ tối để giảm mỏi mắt</li>
                <li>🎨 Chọn màu phù hợp thương hiệu</li>
                <li>🔐 Sử dụng mật khẩu mạnh</li>
            </ul>
        </aside>

    </div>
</div>

<script>
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
</script>

</body>
</html>
