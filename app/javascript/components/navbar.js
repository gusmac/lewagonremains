function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon-second');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 73) {
        navbar.classList.add('navbar-second-fixed-top');
      } else {
        navbar.classList.remove('navbar-second-fixed-top');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
