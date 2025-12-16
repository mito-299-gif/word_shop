function loadPagee(url) {
  fetch(url)
    .then((response) => response.text())
    .then((data) => {
      document.querySelector("#main-contentt").innerHTML = data;
    });
}
