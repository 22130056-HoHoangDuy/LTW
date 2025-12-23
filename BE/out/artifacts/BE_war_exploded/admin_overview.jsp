<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>Admin - Tổng quan</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_chart.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>

    <!-- Chart JS -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>

<div class="dashboard">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <nav class="menu">
            <a href="${pageContext.request.contextPath}/admin/overview" class="active">
                <i class="fa-solid fa-house"></i>
                <span>Dashboard</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/orders">
                <i class="fa-solid fa-box"></i>
                <span>Đơn hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/products">
                <i class="fa-solid fa-cubes"></i>
                <span>Sản phẩm</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/accounts">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/settings">
                <i class="fa-solid fa-gear"></i>
                <span>Cài đặt</span>
            </a>
        </nav>
    </aside>

    <!-- CONTENT -->
    <div class="content-wrapper">

        <main class="main">
            <h2>Tổng quan</h2>

            <!-- CARDS -->
            <section class="dashboard-cards">

                <div class="card-large">
                    <div class="card-info">
                        <h4>Doanh thu</h4>
                        <p class="value">42.500.000đ</p>
                        <span class="trend up">
                            <i class="fa-solid fa-arrow-up"></i> +12%
                        </span>
                    </div>
                    <i class="fa-solid fa-coins icon"></i>
                </div>

                <div class="card-large">
                    <div class="card-info">
                        <h4>Đơn hàng</h4>
                        <p class="value">310</p>
                        <span class="trend up">
                            <i class="fa-solid fa-arrow-up"></i> +18%
                        </span>
                    </div>
                    <i class="fa-solid fa-cart-shopping icon"></i>
                </div>

                <div class="card-small">
                    <div class="card-info">
                        <h4>Khách hàng</h4>
                        <p class="value">1.280</p>
                    </div>
                    <i class="fa-solid fa-user-group icon"></i>
                </div>

                <div class="card-small">
                    <div class="card-info">
                        <h4>Sản phẩm</h4>
                        <p class="value">142</p>
                    </div>
                    <i class="fa-solid fa-boxes-stacked icon"></i>
                </div>

            </section>

            <!-- CHARTS -->
            <section class="charts-upgraded">

                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Doanh thu theo tháng</h3>
                        <select>
                            <option>30 ngày</option>
                            <option>7 ngày</option>
                            <option>90 ngày</option>
                        </select>
                    </div>
                    <canvas id="revenueChart"></canvas>
                </div>

                <div class="chart-card">
                    <div class="chart-header">
                        <h3>Đơn hàng theo danh mục</h3>
                        <select>
                            <option>Tháng này</option>
                            <option>Tuần này</option>
                        </select>
                    </div>
                    <canvas id="categoryChart"></canvas>
                </div>

            </section>

            <!-- RECENT ORDERS -->
            <section class="recent-orders">
                <h3>Đơn hàng gần nhất</h3>

                <table class="data-table">
                    <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Tổng tiền</th>
                        <th>Ngày</th>
                        <th>Trạng thái</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr>
                        <td>#1023</td>
                        <td>Nguyễn An</td>
                        <td>1.250.000đ</td>
                        <td>15/11/2024</td>
                        <td><span class="status on">Hoàn thành</span></td>
                    </tr>

                    <tr>
                        <td>#1024</td>
                        <td>Trần Bình</td>
                        <td>980.000đ</td>
                        <td>15/11/2024</td>
                        <td><span class="status off">Đang xử lý</span></td>
                    </tr>
                    </tbody>
                </table>
            </section>
        </main>

        <!-- RIGHT PANEL -->
        <aside class="right-panel">
            <h3>Công việc hôm nay</h3>
            <ul class="tasks">
                <li>
                    <div class="task-time">09:00</div>
                    <div class="task-info">Xác nhận đơn hàng #1023</div>
                </li>
                <li>
                    <div class="task-time">11:00</div>
                    <div class="task-info">Kiểm tra kho Đà Nẵng</div>
                </li>
                <li>
                    <div class="task-time">14:00</div>
                    <div class="task-info">Cập nhật sản phẩm mới</div>
                </li>
            </ul>
            <button class="add-btn">+</button>
        </aside>

    </div>
</div>

</body>
</html>
