const form = document.querySelector(".contact-container form");
const submitContact = form.querySelector("button");
submitContact.addEventListener("click", (e) => {
    e.preventDefault();
    const inputs = form.querySelectorAll("input[required], textarea[required]");
    let isValid = true;

    // Kiểm tra xem có ô nào trống không
    inputs.forEach(input => {
        if (input.value.trim() === "") {
            isValid = false;
        }
    });

    if (!isValid) {
        Swal.fire({
            icon: "warning",
            title: "Thiếu thông tin!",
            text: "Vui lòng điền đầy đủ tất cả các trường bắt buộc.",
            confirmButtonText: "OK",
        });
        return;
    }
    // Nếu đủ thông tin thì hiện thông báo thành công
    Swal.fire({
        icon: "success",
        title: "Gửi thông tin liên hệ thành công",
        text: "Cảm ơn bạn đã tin tưởng chúng tôi!",
        timer: 2000,
        showConfirmButton: false,
    });
});