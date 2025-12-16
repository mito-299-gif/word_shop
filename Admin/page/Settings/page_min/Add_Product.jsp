<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<% if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
   response.sendRedirect("../index.jsp"); return; } %>
<style>
  .product_add {
    margin-left: auto;
    margin-right: auto;
    margin-top: 200px;
    background-color: #f5f5f5;
    background-color: white;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
    max-width: 400px;
    width: 100%;
  }
</style>
<div class="product_add">
   <form id="productFormm" action="" onsubmit="return false">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required /><br /><br />

      <label for="image">Image:</label>
      <input
        type="file"
        id="image"
        name="img"
        accept="image/*"
        required
      /><br /><br />

      <img
        id="imagePreview"
        style="display: none; max-width: 200px; max-height: 200px"
        alt="Image Preview"
      /><br /><br />

      <button type="submittt" id="submitBtnnn">Add Product</button>
    </form>

    <script>
      document
        .getElementById("image")
        .addEventListener("change", function (event) {
          const file = event.target.files[0];
          const preview = document.getElementById("imagePreview");
          if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
              preview.src = e.target.result;
              preview.onerror = function () {
                preview.src = "";
                preview.style.display = "none";
              };
              preview.style.display = "block";
            };
            reader.readAsDataURL(file);
          } else {
            preview.src = "";
            preview.style.display = "none";
          }
        });
    </script>
</div>
