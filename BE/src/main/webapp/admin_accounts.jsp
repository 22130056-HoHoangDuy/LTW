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
       <c:forEach var="o" items="${orders}">
           <tr>
               <td>#${o.orderId}</td>
               <td>${o.userId}</td>
               <td>${o.orderDate}</td>
               <td>${o.totalAmount}đ</td>
               <td>${o.voucherId}</td>
               <td>${o.paymentMethod}</td>
               <td>
                   <select class="status-select"
                           onchange="updateStatus(this, ${o.orderId})">
                       <c:forEach var="st" items="${T(vn.edu.nlu.fit.be.model.OrderStatus).values()}">
                           <option value="${st}"
                               ${st == o.statusOrder ? "selected" : ""}>
                               ${st}
                           </option>
                       </c:forEach>
                   </select>
               </td>
           </tr>
       </c:forEach>
       </tbody>
    </table>
</main>

<!-- Right Panel để trống -->
<aside class="right-panel"></aside>

<%@ include file="/WEB-INF/admin_footer.jsp" %>

