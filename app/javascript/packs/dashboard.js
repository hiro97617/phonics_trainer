document.addEventListener("DOMContentLoaded", function () {
  if (document.getElementById('navbarAction')) {
    document.getElementById('navbarAction').addEventListener('click', function() {
      let element = document.getElementById("toggleMenu");
      if (element.style.display === 'none') {
        element.style.display = 'block';
      } else {
        element.style.display = 'none';
      }
    });
    document.addEventListener("scroll", function () {
      var scrollposition = window.scrollY;
      var loginheader = document.getElementById("after-login-header");
      var navbaraction = document.getElementById("navbarAction");
      let toToggle = document.querySelectorAll(".toggleColour");
      let whiteLogo = document.getElementById("js-header-white");
      let orangeLogo = document.getElementById("js-header-orange");
      if (scrollposition > 10) {
        loginheader.classList.add("bg-white");
        loginheader.classList.remove("gradient");
        navbaraction.classList.remove("bg-white");
        navbaraction.classList.add("gradient");
        navbaraction.classList.remove("text-gray-800");
        navbaraction.classList.add("text-white");
        whiteLogo.classList.add("hidden");
        whiteLogo.classList.remove("inline-block");
        orangeLogo.classList.add("inline-block");
        orangeLogo.classList.remove("hidden");
        for (var i = 0; i < toToggle.length; i++) {
          toToggle[i].classList.add("text-gray-800");
          toToggle[i].classList.remove("text-white");
        }
      } else {
        loginheader.classList.remove("bg-white");
        navbaraction.classList.remove("gradient");
        navbaraction.classList.add("bg-white");
        navbaraction.classList.remove("text-white");
        navbaraction.classList.add("text-gray-800");
        whiteLogo.classList.add("inline-block");
        whiteLogo.classList.remove("hidden");
        orangeLogo.classList.add("hidden");
        orangeLogo.classList.remove("inline-block");
        for (var i = 0; i < toToggle.length; i++) {
          toToggle[i].classList.add("text-white");
          toToggle[i].classList.remove("text-gray-800");
        }
      }
    });
  };
})