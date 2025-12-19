<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="admin_header.jsp" %>

<div class="dashboard">

    <!-- SIDEBAR -->
    <aside class="sidebar">
        <nav class="menu">

            <a href="${pageContext.request.contextPath}/admin/overview">
                <i class="fa-solid fa-house"></i>
                <span>Dashboard</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/orders">
                <i class="fa-solid fa-box"></i>
                <span>Đơn hàng</span>
            </a>

            <a href="${pageContext.request.contextPath}/admin/accounts" class="active">
                <i class="fa-solid fa-user"></i>
                <span>Tài khoản</span>
            </a>

        </nav>
    </aside>

    <!-- CONTENT -->
    <div class="content-wrapper">

        <main class="main">
            <h2>Quản lý tài khoản</h2>

            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="a" items="${accounts}">
                    <tr>
                        <td>${a.userId}</td>
                        <td>${a.username}</td>
                        <td>${a.email}</td>
                        <td>${a.createdAt}</td>
                        <td>
                            <select onchange="updateStatus(this, ${a.userId})">
                                <option value="ACTIVE"
                                        ${a.status == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
                                <option value="INACTIVE"
                                        ${a.status == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
                            </select>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </main>

        <aside class="right-panel"></aside>
    </div>
</div>

<script>
    function updateStatus(select, id) {
        fetch(`${pageContext.request.contextPath}/admin/accounts/status?id=${id}&status=${select.value}`)
            .then(res => res.text())
            .then(txt => {
                if (txt !== "OK") alert("Cập nhật thất bại");
            });
    }
</script>

<%@ include file="admin_footer.jsp" %>
