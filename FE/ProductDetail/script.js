const tabList = document.querySelectorAll(".nav-item");
const productDetail = document.querySelector(".product-detail");
//
const detail = `<div class="product-detail">
          <div class="content">
            <div class="highlight">🔥Mẫu bàn học cải tiến</div>
            <p>
              Cải tiến với chất liệu từ gỗ tự nhiên nguyên khối, mẫu bàn tầm
              trung với kích thước <strong>100cm × 60cm</strong>, được thiết kế
              tối ưu công năng cho bé giúp tăng tính thẩm mỹ và không gian học
              tập — giải trí cho bé một cách tốt nhất.
            </p>
          </div>
          <img src="img/detail/detail_1.png" alt="Hình ảnh bị lỗi" />
          <div class="content">
            <div class="highlight">☑️Bàn được cập nhật</div>
            <p>
              Cập nhật ngoài không gian học đa dụng còn bổ sung nhiều tính năng
              như kệ máy tính bàn, bàn từ tính, bảng note đa dụng... tăng tính
              tiện dụng của bàn học với mẫu mới.
            </p>
          </div>
          <img src="img/detail/detail_2.png" alt="Hình ảnh bị lỗi" />
          <div class="content">
            <div class="highlight">
              ❤️ Bàn học thông minh cho bé ROS 100 có nhiều tiện ích hơn
            </div>
            <ul>
              <li>☑️ Không gian kệ và ngăn kéo được thiết kế rộng rãi</li>
              <li>
                ☑️ Kệ máy tính bản được thiết kế ẩn giúp bé dễ dàng học tập giải
                trí
              </li>
              <li>
                ☑️ Trang bị Bản từ tính phía sau giúp bé dễ dàng ghim note trên
                bảng
              </li>
              <li>
                ☑️ Mặt bàn trang bị lớp Matte chống lóa chống bán bẩn, chống thấm
                và chống bám bụi hiệu quả
              </li>
              <li>☑️ Trang bị tay quay để nâng hạ bàn một cách dễ dàng hơn</li>
              <li>☑️ Bàn có trang bị thêm móc treo cặp tiện dụng cho bé</li>
            </ul>
          </div>
          <img src="img/detail/detail_3.png" alt="Hình ảnh bị lỗi" />
          <div class="content">
            <div class="highlight">☑️Bàn được cập nhật</div>
            <p>
              Cập nhật ngoài không gian học đa dụng còn bổ sung nhiều tính năng
              như kệ máy tính bàn, bàn từ tính, bảng note đa dụng... tăng tính
              tiện dụng của bàn học với mẫu mới.
            </p>
          </div>
          <img src="img/detail/detail_4.png" alt="Hình ảnh bị lỗi" />
          <div class="content">
            <div class="highlight">
              ⚡Bàn học có kích thước rộng rãi với các thông số:⚡
            </div>
            <ul>
              <li>☑️ Kích thước mặt bàn 100cm*60cm</li>
              <li>
                ☑️ Mặt nghiêng của bàn từ 0-55 độ với kích thước được nâng cấp
                hơn đến 73cm
              </li>
              <li>☑️ Trang bị 5 kệ tiện dụng, chiều cao kệ đến 60cm</li>
              <li>
                ☑️ Chân bàn trang bị thép không rỉ có thể nâng hạ từ 52cm - 78cm
              </li>
              <li>
                ☑️ Mặt chân bàn đến 60cm nâng cao khả năng ổn định của bàn
              </li>
            </ul>
          </div>
          <img src="img/detail/detail_5.png" alt="Hình ảnh bị lỗi" />
          <div class="content">
            <div class="highlight">
              🌳 Bàn được trang bị hoàn toàn từ gỗ tự nhiên từ mặt bàn đến các
              kệ 🌳
            </div>
            <ul>
              <li>
                ☑️ Mặt bàn được phủ đến 2 lớp gồm lớp chống mài mòn giúp bàn
                chống bụi và bị trầy mòn trong quá trình dùng lâu dài
              </li>
              <li>
                ☑️ Ngoài ra bàn còn trang bị thêm lớp chống lóa giúp bản vệ mắt
                cho bé một cách ưu việt
              </li>
              <li>
                ☑️ Mặt bàn còn trang bị viền bảo vệ giúp bàn tăng độ bền ngăn
                ngừa thấm nước
              </li>
            </ul>
          </div>
          <img src="img/detail/detail_6.png" alt="Hình ảnh bị lỗi" />
        </div>`;
const spec = "Đang cập nhật thêm";
tabList.forEach((link) => {
  link.addEventListener("click", (e) => {
    e.preventDefault();
    tabList.forEach((l) => l.classList.remove("active"));
    link.classList.add("active");
    if (link.textContent.trim() === "Chi tiết") {
      productDetail.innerHTML = detail;
    } else {
      productDetail.innerHTML = spec;
    }
  });
});
window.addEventListener("DOMContentLoaded", () => {
  const activeTab = document.querySelector(".nav-link.active");
  if (activeTab) {
    if (activeTab.textContent.trim() === "Chi tiết") {
      productDetail.innerHTML = detail;
    } else {
      productDetail.innerHTML = spec;
    }
  }
});
