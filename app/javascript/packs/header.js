document.addEventListener("DOMContentLoaded", function () {
  if (document.getElementById('navAction')) {
  var scrollpos = window.scrollY;
  var header = document.getElementById("header");
  var navcontent = document.getElementById("nav-content");
  var navaction = document.getElementById("navAction");
  var toToggle = document.querySelectorAll(".toggleColour");
  var whiteLogo = document.getElementById("js-header-white");
  var orangeLogo = document.getElementById("js-header-orange");

  document.addEventListener("scroll", function () {
    /*Apply classes for slide in bar*/
    scrollpos = window.scrollY;

    if (scrollpos > 10) {
      header.classList.add("bg-white");
      navaction.classList.remove("bg-white");
      navaction.classList.add("gradient");
      navaction.classList.remove("text-gray-800");
      navaction.classList.add("text-white");
      whiteLogo.classList.add("hidden");
      whiteLogo.classList.remove("inline-block");
      orangeLogo.classList.add("inline-block");
      orangeLogo.classList.remove("hidden");
      //Use to switch toggleColour colours
      for (var i = 0; i < toToggle.length; i++) {
        toToggle[i].classList.add("text-gray-800");
        toToggle[i].classList.remove("text-white");
      }
      header.classList.add("shadow");
      navcontent.classList.remove("bg-gray-100");
      navcontent.classList.add("bg-white");
    } else {
      header.classList.remove("bg-white");
      navaction.classList.remove("gradient");
      navaction.classList.add("bg-white");
      navaction.classList.remove("text-white");
      navaction.classList.add("text-gray-800");
      whiteLogo.classList.add("inline-block");
      whiteLogo.classList.remove("hidden");
      orangeLogo.classList.add("hidden");
      orangeLogo.classList.remove("inline-block");
      //Use to switch toggleColour colours
      for (var i = 0; i < toToggle.length; i++) {
        toToggle[i].classList.add("text-white");
        toToggle[i].classList.remove("text-gray-800");
      }

      header.classList.remove("shadow");
      navcontent.classList.remove("bg-white");
      navcontent.classList.add("bg-gray-100");
    }
  });
  var navMenuDiv = document.getElementById("nav-content");
  var navMenu = document.getElementById("nav-toggle");

  document.onclick = check;
  function check(e) {
    var target = (e && e.target) || (event && event.srcElement);

    //Nav Menu
    if (!checkParent(target, navMenuDiv)) {
      // click NOT on the menu
      if (checkParent(target, navMenu)) {
        // click on the link
        if (navMenuDiv.classList.contains("hidden")) {
          navMenuDiv.classList.remove("hidden");
        } else {
          navMenuDiv.classList.add("hidden");
        }
      } else {
        // click both outside link and outside menu, hide menu
        navMenuDiv.classList.add("hidden");
      }
    }
  }
  function checkParent(t, elm) {
    while (t.parentNode) {
      if (t == elm) {
        return true;
      }
      t = t.parentNode;
    }
    return false;
  }
  };
});


var afterNavMenu = document.getElementById("after-login-nav-toggle");

document.onclick = check;
function check() {
  const afterNavMenuDiv = document.getElementById("after-login-nav-content");
      if (afterNavMenuDiv.classList.contains("hidden")) {
        afterNavMenuDiv.classList.remove("hidden");
      } else {
        afterNavMenuDiv.classList.add("hidden");
      }
  }



