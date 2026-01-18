<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <title>Admin - Quản lý sản phẩm</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_style.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"/>
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

            <a href="${pageContext.request.contextPath}/admin/products" class="active">
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

            <a href="${pageContext.request.contextPath}/admin/settings">
                <i class="fa-solid fa-gear"></i>
                <span>Cài đặt</span>
            </a>
        </nav>
    </aside>

    <!-- MAIN -->
    <main class="main">
        <h2>Quản lý sản phẩm</h2>

        <!-- HEADER -->
        <div class="product-header">
            <button class="btn-primary" onclick="openAdd()">
                <i class="fa-solid fa-plus"></i> Thêm sản phẩm
            </button>

            <form method="get" action="${pageContext.request.contextPath}/admin/products" class="search-box">
                <input type="text" name="search" placeholder="Nhập tên sản phẩm..." value="${param.search}">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>

        <!-- TABLE -->
        <table class="data-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Tên</th>
                <th>Danh mục</th>
                <th>Giá</th>
                <th>Hình ảnh</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${products}">
                <tr>
                    <td>${p.productId}</td>
                    <td>${p.productName}</td>
                    <td>${categoryMap[p.categoryId]}</td>
                    <td>${p.productPrice}</td>

                    <td>
                        <c:if test="${not empty p.productImage}">
                            <img
                                    src="${p.productImage}"
                                    alt="${p.productName}"
                                    style="width:70px;height:70px;object-fit:cover;border-radius:6px">
                        </c:if>
                    </td>

                    <td>
                        <button class="btn-small btn-on"
                                onclick="openEdit(this)"
                                data-id="${p.productId}"
                                data-name="${p.productName}"
                                data-price="${p.productPrice}"
                                data-category="${p.categoryId}"
                                data-brand="${p.brandId}">
                            Sửa
                        </button>

                        <button class="btn-small btn-delete"
                                onclick="deleteProduct(${p.productId})">
                            Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </main>
</div>

<!-- OVERLAY -->
<div class="product-overlay" id="overlay">
    <div class="product-modal">
        <h3 id="modalTitle">Thêm sản phẩm</h3>

        <form method="post"
              action="${pageContext.request.contextPath}/admin/products/save"
              enctype="multipart/form-data">

            <input type="hidden" name="productId" id="productId"/>

            <label>Tên sản phẩm</label>
            <input type="text" name="productName" id="productName" required/>

            <label>Giá</label>
            <input type="number" name="productPrice" id="productPrice" required/>

            <label>Danh mục</label>
            <select name="categoryId" id="categoryId">
                <c:forEach var="c" items="${categories}">
                    <option value="${c.categoryId}">${c.categoryName}</option>
                </c:forEach>
            </select>

            <label>Thương hiệu</label>
            <select name="brandId" id="brandId" required>
                <c:forEach var="b" items="${brands}">
                    <option value="${b.brandId}">
                            ${b.brandName}
                    </option>
                </c:forEach>
            </select>

            <label>Kích thước</label>
            <input type="text" name="productSize" id="productSize"/>

            <label>Chất liệu</label>
            <input type="text" name="productMaterial" id="productMaterial"/>

            <label>Hình ảnh</label>
            <input type="file" name="image"/>

            <div class="modal-actions">
                <button class="btn-primary">Lưu</button>
                <button type="button" class="btn-delete" onclick="closeOverlay()">Hủy</button>
            </div>
        </form>
    </div>
</div>

<!-- JS -->
<script>
    const overlay = document.getElementById("overlay");

    function openAdd() {
        document.getElementById("modalTitle").innerText = "Thêm sản phẩm";
        document.querySelector("form").reset();
        document.getElementById("productId").value = "";
        overlay.style.display = "flex";
    }

    function openEdit(btn) {
        document.getElementById("modalTitle").innerText = "Sửa sản phẩm";

        document.getElementById("productId").value = btn.dataset.id;
        document.getElementById("productName").value = btn.dataset.name;
        document.getElementById("productPrice").value = btn.dataset.price;
        document.getElementById("categoryId").value = btn.dataset.category;
        document.getElementById("brandId").value = btn.dataset.brand;

        overlay.style.display = "flex";
    }

    function closeOverlay() {
        overlay.style.display = "none";
    }

    function deleteProduct(id) {
        if (!confirm("Xóa sản phẩm này?")) return;

        fetch("${pageContext.request.contextPath}/admin/products/delete?id=" + id, {
            method: "POST"
        }).then(res => res.text())
            .then(txt => {
                if (txt === "OK") location.reload();
                else alert("Xóa thất bại");
            });
    }
</script>

</body>
</html>
