let quantity = 1;
let countItem = 1;

function updateTotal() {
    //Giá theo số lượng
    let pricePerItem = document.querySelector(".current-price").textContent;
    pricePerItem = parseInt(pricePerItem.replace(/[^\d]/g, ""));
    const subtotal = quantity * pricePerItem;
    //Tính thêm giảm giá
    let discountAmount = document.getElementById("discount").textContent;
    if (discountAmount) {
        discountAmount = parseInt(discountAmount.replace(/[^\d]/g, "")); // bỏ dấu . và chữ đ
    }
    // Cập nhật subtotal
    document.getElementById("quantity").value = quantity;
    document.getElementById("subtotal").textContent =
        subtotal.toLocaleString("vi-VN") + "đ";
    //Cập nhật tổng giá
    const total = subtotal - discountAmount;
    document.getElementById("total").textContent =
        total.toLocaleString("vi-VN") + "đ";
}

function increaseQuantity() {
    quantity++;
    updateTotal();
}

function decreaseQuantity() {
    if (quantity > 1) {
        quantity--;
        updateTotal();
    }
}

function removeItem() {
    Swal.fire({
        title: "Bạn có chắc xóa sản phẩm này không?",
        text: "Hành động này sẽ không được hoàn tác.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        cancelButtonText: "Không, để lại đi",
        confirmButtonText: "Có"
    }).then((result) => {
        if (!result.isConfirmed) return;
        countItem--;
        if (countItem === 0) {
            const hide = el => el.style.display = "none";
            const show = (el, type = "block") => el.style.display = type;

            hide(document.querySelector(".order-summary"));
            hide(document.querySelector(".cart-item"));
            show(document.querySelector(".container"), "inline");
            show(document.querySelector(".empty-cart"));
        }

        Swal.fire({
            title: "Đã xóa thành công!",
            text: "Sản phẩm đã được xóa khỏi giỏ hàng.",
            icon: "success"
        });
    });
}


function applyPromo() {
    const code = document.getElementById("promoCode").value.trim().toUpperCase();
    let discount = document.getElementById("discount");
    if (code === "CODE001") {
        Swal.fire({
            icon: "success",
            title: "Áp dụng giảm giá",
            text: "Mã giảm giá đã được áp dụng",
            timer: 1500,
            showConfirmButton: false,
        });
        discount.textContent = "1.500.000đ";
        updateTotal();
    } else if (code === "") {
        Swal.fire({
            icon: "error",
            title: "Chưa nhập mã",
            text: "Vui lòng nhập mã giảm giá",
            timer: 1500,
            showConfirmButton: false,
        });
    } else {
        Swal.fire({
            icon: "error",
            title: "Áp dụng giảm giá",
            text: "Mã giảm giá không tồn tại",
            timer: 1500,
            showConfirmButton: false,
        });
    }
}

const promoInput = document.querySelector(".promo-input");
if (promoInput) {
    promoInput.addEventListener("keydown", (e) => {
        if (e.key === "Enter" || e.key === " ") {
            applyPromo();
        }
    });
}

async function submitPayment() {
    await Swal.fire({
        icon: "success",
        title: "Thanh toán thành công",
        text: "Cảm ơn bạn đã mua hàng!",
        timer: 2000,
        showConfirmButton: false,
    });
    window.location.href = "../html/productList.html";
}
