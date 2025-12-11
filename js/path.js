function loadPage(url) {
  const options = {
    method: "GET",
    cache: "default",
  };

  fetch(url, options)
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#main-content").innerHTML = data;
      if (typeof initSelect === "function") {
        initSelect();
      }
    })
    .catch((error) => {
      console.error("Fetch error:", error);
      document.querySelector("#main-content").innerHTML =
        "เกิดข้อผิดพลาดในการโหลดเนื้อหา";
    });
}
loadPage("../Admin/Home/Home.jsp");
