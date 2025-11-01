let quantity = 1;
let countItem = 1;
const pricePerItem = 3910000;

function updateTotal() {
  const subtotal = quantity * pricePerItem;
  document.getElementById("quantity").value = quantity;
  document.getElementById("subtotal").textContent =
    subtotal.toLocaleString("vi-VN") + "đ";
  document.getElementById("total").textContent =
    subtotal.toLocaleString("vi-VN") + "đ";
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
      const progressBar = document.querySelector(".progress-bar");
      const cartItem = document.querySelector(".cart-item");
      const emptyCart = document.querySelector(".empty-cart");
      const order = document.querySelector(".order-summary");
      hide(order);
      hide(cartItem);
      hide(progressBar);
      showInline(container);
      showBlock(emptyCart);
    }

    alert("Sản phẩm đã được xóa!");
  }
}

function applyPromo() {
  const code = document.getElementById("promoCode").value.trim().toUpperCase();
  if (code === "CODE001") {
    alert("Mã giảm giá đã được áp dụng!");
  } else if (code) {
    alert("Mã giảm giá không hợp lệ!");
  }
}
