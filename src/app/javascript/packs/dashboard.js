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
};
})
