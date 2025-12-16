<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<% if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
   response.sendRedirect("../index.jsp"); return; } %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link rel="stylesheet" href="./c.css" />
    <title>Add Product</title>
  </head>
  <body>
  <div class="back">
  <i class="fa fa-arrow-left" aria-hidden="true"></i>
  <a href="../../../../index.jsp">Back</a>
  </div>
  <div class="add_product">
    <form id="productForm">
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
        alt="Image Preview"
      /><br /><br />
    

      <button type="submit" id="submitBtn">Add Product</button>
    </form>
  </div>
    <div class="list_img">
      <div class="product-list" id="products"></div>
      </div>

    <script src="./id.js"></script>
    <script src="./img.js"></script>
  </body>
</html>
