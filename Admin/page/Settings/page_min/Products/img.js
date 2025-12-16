document.getElementById("image").addEventListener("change", function (event) {
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

const apiUrl = "https://api.whiteee.store/api/ps";

function initSelect() {
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
