const apiUrl = "http://localhost:3000/api/ps";

async function loadProducts() {
  try {
    const res = await fetch(apiUrl);
    const products = await res.json();
    const productsDiv = document.getElementById("products");
    productsDiv.innerHTML = "";

    products.forEach((p) => {
      const div = document.createElement("div");
      div.className = "product-item";
      div.innerHTML =
        (p.img
          ? '<img src="' +
            p.img +
            '" alt="' +
            p.name +
            '" class="product-image" />'
          : "") +
        '<div class="product-info">' +
        '<h3 class="product-name">' +
        p.name +
        "</h3>" +
        '<div class="product-actions">' +
        '<button class="edit-btn" onclick="window.location.href=\'edit.html?id=' +
        p.id +
        "'\">Edit</button>" +
        '<button class="delete-btn" onclick="deleteProduct(' +
        p.id +
        ')">Delete</button>' +
        "</div>" +
        "</div>";
      productsDiv.appendChild(div);
    });
  } catch (err) {
    console.error("Load products error:", err);
  }
}

// Edit product
async function editProduct(id, oldName) {
  const newName = prompt("Enter new name:", oldName);
  if (!newName) return;

  const changeImage = confirm("Change image?");
  let options;

  if (changeImage) {
    const input = document.createElement("input");
    input.type = "file";
    input.accept = "image/*";
    input.onchange = async (e) => {
      const file = e.target.files[0];
      if (!file) return;

      const formData = new FormData();
      formData.append("name", newName);
      formData.append("img", file);

      options = { method: "PUT", body: formData };
      const res = await fetch(apiUrl + "/" + id, options);
      const data = await res.json();
      alert(data.message);
      loadProducts();
    };
    input.click();
  } else {
    options = {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ name: newName }),
    };
    const res = await fetch(apiUrl + "/" + id, options);
    const data = await res.json();
    alert(data.message);
    loadProducts();
  }
}

// Delete product
async function deleteProduct(id) {
  if (!confirm("Are you sure?")) return;
  try {
    const res = await fetch(apiUrl + "/" + id, { method: "DELETE" });
    const data = await res.json();
    alert(data.message);
    loadProducts();
  } catch (err) {
    console.error("Delete error:", err);
  }
}

// Initialize function
function initSelect() {
  loadProducts();
  const productForm = document.getElementById("productForm");
  if (productForm) {
    productForm.addEventListener("submit", async (e) => {
      e.preventDefault();
      const submitBtn = document.getElementById("submitBtn");
      const name = document.getElementById("name").value;
      const file = document.getElementById("image").files[0];
      if (!file) return alert("Please select an image");

      // Disable button and show loading
      submitBtn.disabled = true;
      submitBtn.textContent = "Saving...";

      const formData = new FormData();
      formData.append("name", name);
      formData.append("img", file);

      try {
        const res = await fetch(apiUrl, { method: "POST", body: formData });
        const data = await res.json();
        alert(data.message);
        loadProducts();
        document.getElementById("productForm").reset();
      } catch (err) {
        console.error("Add product error:", err);
        alert("Error saving product");
      } finally {
        // Re-enable button
        submitBtn.disabled = false;
        submitBtn.textContent = "Add Product";
      }
    });
  }
}

// Load products on page load
initSelect();
