<style>
.box_too_box {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.box1,
.box2 {
  flex: 1;
}

.product-list {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  gap: 20px;
  padding: 20px 0;
}

@media (max-width: 768px) {
  .product-list {
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 15px;
  }

  .product-image {
    height: 150px;
  }
}

@media (max-width: 480px) {
  .product-list {
    grid-template-columns: 1fr;
    gap: 10px;
  }

  .product-actions {
    flex-direction: column;
  }

  .edit-btn,
  .delete-btn {
    width: 100%;
  }
}

.product-item {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  transition: transform 0.2s, box-shadow 0.2s;
}

.product-item:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

.product-image {
  width: 100%;
  height: 200px;
  object-fit: contain;
  display: block;
  background-color: #f8f9fa;
}

.product-info {
  padding: 15px;
}

.product-name {
  margin: 0 0 10px 0;
  font-size: 1.2em;
  color: #333;
}

.product-actions {
  display: flex;
  gap: 10px;
}

.edit-btn,
.delete-btn {
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.2s;
}

.edit-btn {
  background-color: #3498db;
  color: white;
}

.edit-btn:hover {
  background-color: #2980b9;
}

.delete-btn {
  background-color: #e74c3c;
  color: white;
}

.delete-btn:hover {
  background-color: #c0392b;
}

.div {
  width: 50%;
  height: 100px;
  border: 1px solid black;
  display: flex;
  justify-content: space-between;
  justify-items: center;
  align-items: center;
  padding: 0 20px;
}
</style>

<div class="box_too_box">
  <div class="box1">
    <%-- <form id="productForm">
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

      <button type="submit" id="submitBtn">Add Product</button>
    </form> --%>

    <h2>Products</h2>
    <%-- <button onclick="loadProducts()">Refresh</button> --%>

    <div class="product-list" id="products"></div>
    <div id = "name"></div>
     <div id = "image"></div>
      <div id = "delete"></div>
       <div id = "edit"></div>
  </div>
  <div class="box2"> qwsdad </div>
</div>

<script src="../../js/select.js"></script>
