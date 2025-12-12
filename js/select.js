const apiUrl = "https://api.whiteee.store/api/ps";

async function loadProducts() {
  try {
    const res = await fetch(apiUrl);

    if (!res.ok) {
      throw new Error(`HTTP error! status: ${res.status}`);
    }
    const products = await res.json();
    const productsDiv = document.getElementById("products");
    productsDiv.innerHTML = "";

    products.forEach((p) => {
      const div = document.createElement("div");
      div.className = "product-item";

      div.innerHTML =
        (p.img
          ? `<img src="${p.img}" alt="${p.name}" class="product-image" />`
          : '<div class="product-image-placeholder">No Image</div>') +
        `<div class="product-info">
          <h3 class="product-name">${p.name}</h3>
          <div class="product-actions">
            <button class="edit-btn" onclick="editProduct(${
              p.id
            }, '${p.name.replace(/'/g, "\\'")}')">Edit</button>
            <button class="delete-btn" onclick="deleteProduct(${
              p.id
            })">Delete</button>
          </div>
        </div>`;
      productsDiv.appendChild(div);
    });
  } catch (err) {
    console.error("Load products error:", err);
    // alert("Failed to load products. Check console for details.");
  }
}

async function editProduct(id, oldName) {
  const newName = prompt("Enter new name:", oldName);
  if (!newName) return;

  const changeImage = confirm("Change image?");

  if (changeImage) {
    const input = document.createElement("input");
    input.type = "file";
    input.accept = "image/*";

    await new Promise((resolve) => {
      input.onchange = async (e) => {
        const file = e.target.files[0];
        if (!file) {
          resolve();
          return;
        }

        const formData = new FormData();
        formData.append("name", newName);
        formData.append("img", file);

        try {
          const res = await fetch(`${apiUrl}/${id}`, {
            method: "PUT",
            body: formData,
          });
          const data = await res.json();
          // alert(data.message);
        } catch (err) {
          console.error("Edit product with image error:", err);
          // alert("Error updating product with image");
        }
        loadProducts();
        resolve();
      };
      input.click();
    });
  } else {
    try {
      const options = {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name: newName }),
      };
      const res = await fetch(`${apiUrl}/${id}`, options);
      const data = await res.json();
      alert(data.message);
    } catch (err) {
      console.error("Edit product name only error:", err);
      // alert("Error updating product name");
    }
    loadProducts();
  }
}

async function deleteProduct(id) {
  if (!confirm("Are you sure you want to delete this product?")) return;
  try {
    const res = await fetch(`${apiUrl}/${id}`, { method: "DELETE" });
    const data = await res.json();

    loadProducts();
  } catch (err) {
    console.error("Delete error:", err);
    // alert("Error deleting product. Check console for details.");
  }
}

function initSelect() {
  loadProducts();

  const productForm = document.getElementById("productForm");
  if (productForm) {
    productForm.addEventListener("submit", async (e) => {
      e.preventDefault();

      const submitBtn = document.getElementById("submitBtn");
      const name = document.getElementById("name").value;
      const file = document.getElementById("image").files[0];

      if (!name) return alert("Please enter product name.");
      if (!file) return alert("Please select an image");

      // ปิดปุ่มและแสดงสถานะโหลด
      submitBtn.disabled = true;
      submitBtn.textContent = "Saving...";

      const formData = new FormData();
      formData.append("name", name);
      formData.append("img", file);

      try {
        const res = await fetch(apiUrl, { method: "POST", body: formData });
        const data = await res.json();

        // ตรวจสอบสถานะการตอบกลับ
        if (res.ok) {
          // alert(data.message);
          loadProducts();
          document.getElementById("productForm").reset(); // ล้างฟอร์ม
        } else {
          alert(`Failed to add product: ${data.message || "Unknown error"}`);
        }
      } catch (err) {
        console.error("Add product error:", err);
        // alert("Error saving product");
      } finally {
        // เปิดปุ่มและเปลี่ยนข้อความกลับ
        submitBtn.disabled = false;
        submitBtn.textContent = "Add Product";
      }
    });
  }
}

// โหลดผลิตภัณฑ์เมื่อเพจโหลดเสร็จ
initSelect();
