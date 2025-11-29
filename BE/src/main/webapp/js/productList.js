//Back to top page
const backBtn = document.getElementById("backToTop");
const footer = document.getElementById("footer-frame");
window.addEventListener("scroll", () => {
    const footerTop = footer.getBoundingClientRect().top;//get footer's position in page
    const windowHeight = window.innerHeight;
    if (window.scrollY > 400) {
        backBtn.classList.add("show");
    } else {
        backBtn.classList.remove("show");
    }
    if (footerTop < windowHeight) {
        backBtn.style.background = "white";
        backBtn.style.color = "blue";
    } else {
        backBtn.style.background = "#003dd4";
        backBtn.style.color = "white";
    }

});
backBtn.addEventListener("click", () => {
    window.scrollTo({top: 0, behavior: "smooth"});
});
//Add favorite product
const favorBtns = document.querySelectorAll(".filter-btn.favor-btn");
favorBtns.forEach((favorBtn)=>{
    favorBtn.addEventListener("click", () => {
        Swal.fire({
            icon: "success",
            title: "Đã thêm",
            text: "Sản phẩm đã được thêm vào danh sách yêu thích.",
            timer: 1500,
            showConfirmButton: false,
        });
    })
})
//Phân trang
const pages = document.querySelectorAll(".page-number");

pages.forEach((page) => {
    page.addEventListener("click", (e) => {
        e.preventDefault();
        pages.forEach(p => p.classList.remove("active"));
        page.classList.add("active");
    });
});

// Carousel custom (thay thế Bootstrap)
const carousel = document.getElementById("productListCarousel");
if (carousel) {
    const slidesContainer = carousel.querySelector(".carousel-slides");
    const slides = carousel.querySelectorAll(".carousel-slide");
    const prevBtn = carousel.querySelector(".carousel-control.prev");
    const nextBtn = carousel.querySelector(".carousel-control.next");
    const dots = carousel.querySelectorAll(".carousel-dots .dot");

    let currentIndex = 0;

    const updateCarousel = (index) => {
        const offset = -index * 100;
        slidesContainer.style.transform = `translateX(${offset}%)`;
        slides.forEach((slide, i) => {
            slide.classList.toggle("active", i === index);
        });
        dots.forEach((dot, i) => {
            dot.classList.toggle("active", i === index);
        });
    };

    const goToNext = () => {
        currentIndex = (currentIndex + 1) % slides.length;
        updateCarousel(currentIndex);
    };

    const goToPrev = () => {
        currentIndex = (currentIndex - 1 + slides.length) % slides.length;
        updateCarousel(currentIndex);
    };

    nextBtn.addEventListener("click", goToNext);
    prevBtn.addEventListener("click", goToPrev);

    dots.forEach((dot) => {
        dot.addEventListener("click", () => {
            const index = parseInt(dot.getAttribute("data-index"), 10);
            currentIndex = index;
            updateCarousel(currentIndex);
        });
    });

    // Tự động chạy slide mỗi 5s
    setInterval(goToNext, 5000);
}


