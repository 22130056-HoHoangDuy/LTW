<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="admin_header.jsp" %>

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
       <c:forEach var="a" items="${accounts}">
           <tr>
               <td>${a.userId}</td>
               <td>${a.username}</td>
               <td>${a.email}</td>
               <td>${a.createdAt}</td>
               <td>
                   <select onchange="updateStatus(this, ${a.userId})">
                       <option value="ACTIVE" ${a.status == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
                       <option value="INACTIVE" ${a.status == 'INACTIVE' ? 'selected' : ''}>INACTIVE</option>
                   </select>
               </td>
           </tr>
       </c:forEach>
       </tbody>
    </table>
</main>

<!-- Right Panel để trống -->
<aside class="right-panel"></aside>

<%@ include file="admin_footer.jsp" %>

