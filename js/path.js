function loadPage(url) {
  const options = {
    method: "GET",
    cache: "default",
  };

  fetch(url, options)
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#main-content").innerHTML = data;

      // Wait for DOM to be ready before executing scripts
      setTimeout(() => {
        // Execute scripts
        const scripts = document
          .querySelector("#main-content")
          .querySelectorAll("script");
        scripts.forEach((script) => {
          const newScript = document.createElement("script");
          if (script.src) {
            newScript.src = script.src;
            newScript.onload = () => {
              // Call init functions after script loads
              if (typeof initSelect === "function") {
                initSelect();
              }
              if (typeof initImagePreview === "function") {
                initImagePreview();
              }
            };
          } else {
            newScript.textContent = script.textContent;
          }
          document.head.appendChild(newScript);
        });

        // For inline scripts, call init functions
        if (typeof initSelect === "function") {
          initSelect();
        }
        if (typeof initImagePreview === "function") {
          initImagePreview();
        }
      }, 100);
    })
    .catch((error) => {
      console.error("Fetch error:", error);
      document.querySelector("#main-content").innerHTML =
        "เกิดข้อผิดพลาดในการโหลดเนื้อหา";
    });
}
loadPage("../Admin/page/Home/Home.jsp");
