const sidebar = document.getElementById("sidebar");
const mainContent = document.getElementById("main-content");
const toggleButton = document.getElementById("sidebar-toggle");
const sidebarLinks = document.querySelectorAll(".sidebar-nav a");

function toggleSidebar() {
  sidebar.classList.toggle("open");
  mainContent.classList.toggle("shifted");
}

toggleButton.addEventListener("click", toggleSidebar);

sidebarLinks.forEach((link) => {
  link.addEventListener("click", function () {
    if (sidebar.classList.contains("open")) {
      sidebar.classList.remove("open");
      mainContent.classList.remove("shifted");
    }
  });
});
