// --- Chuyển đổi form ---
function showForm(formName) {
    const forms = document.querySelectorAll(".form");
    forms.forEach((f) => f.classList.remove("active"));
    document.getElementById(`${formName}-form`).classList.add("active");
}

// --- Hiện / Ẩn mật khẩu ---
document.addEventListener("DOMContentLoaded", () => {
    const toggleIcons = document.querySelectorAll(".toggle-password");

    toggleIcons.forEach(icon => {
        icon.addEventListener("click", (e) => {
            e.preventDefault();
            const input = icon.closest(".password-container").querySelector("input");
            const eyeIcon = icon.querySelector("i");

            if (input.type === "password") {
                input.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                input.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        });
    });
});


// --- Kiểm tra mật khẩu ---
const registerForm = document.getElementById("register-form");
const passwordInput = document.getElementById("register-password");
const confirmPasswordInput = document.getElementById("confirm-password");
const errorText = document.getElementById("password-error");

registerForm.addEventListener("submit", function (e) {
    const password = passwordInput.value;
    const confirmPassword = confirmPasswordInput.value;

    // Biểu thức kiểm tra độ mạnh
    const passwordRegex =
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!passwordRegex.test(password)) {
        e.preventDefault();
        errorText.textContent =
            "Mật khẩu phải có ít nhất 8 ký tự, bao gồm chữ hoa, chữ thường, số và ký tự đặc biệt.";
        return;
    }

    if (password !== confirmPassword) {
        e.preventDefault();
        errorText.textContent = "Mật khẩu xác nhận không khớp.";
        return;
    }

    errorText.textContent = "";
    // --- Tự động mở form theo query trên URL ---
});
window.addEventListener("DOMContentLoaded", () => {
    const params = new URLSearchParams(window.location.search);
    const form = params.get("form"); // lấy giá trị sau dấu ?form=
    if (form) showForm(form);
});
