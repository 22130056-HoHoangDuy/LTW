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
  if (confirm("Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng?")) {
    countItem--;
    if (countItem == 0) {
      const hide = (el) => {
        el.style.display = "none";
      };
      const showBlock = (el) => {
        el.style.display = "block";
      };

      const showInline = (el) => {
        el.style.display = "inline";
      };
      //Hidden items
      const container = document.querySelector(".container");
      const cartItem = document.querySelector(".cart-item");
      const emptyCart = document.querySelector(".empty-cart");
      const order = document.querySelector(".order-summary");
      //Thực hiện phương thức
      hide(order);
      hide(cartItem);
      showInline(container);
      showBlock(emptyCart);
    }
    //Hiển thị thông báo xoá
    Swal.fire({
      icon: "success",
      title: "Đã xóa!",
      text: "Sản phẩm đã được xóa khỏi giỏ hàng.",
      timer: 1500,
      showConfirmButton: false,
    });
  }
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
