
document.addEventListener("DOMContentLoaded", function () {
  if (document.getElementById('nav-toggle')) {
    document.getElementById('nav-toggle').addEventListener('click', function() {
    let element = document.getElementById("beforeToggle");
    if (element.style.display === 'none') {
      element.style.display = 'block';
    } else {
      element.style.display = 'none';
    }
      })
      }
})
