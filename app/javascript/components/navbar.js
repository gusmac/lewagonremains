function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon-second');
  if (navbar) {
    let form = document.querySelector("#form-search-cont")
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 73) {
      if (form != null) form.style.marginTop = "75px"
        navbar.classList.add('navbar-second-fixed-top');
      } else {
       if (form != null) form.style.marginTop = "25px"
        navbar.classList.remove('navbar-second-fixed-top');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
