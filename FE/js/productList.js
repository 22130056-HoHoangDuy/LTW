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
