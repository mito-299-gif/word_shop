function initImagePreview() {
  const imageInput = document.getElementById("image");
  if (imageInput) {
    imageInput.removeEventListener("change", handleImageChange);
    imageInput.addEventListener("change", handleImageChange);
  }
}

function handleImageChange(event) {
  const file = event.target.files[0];
  const preview = document.getElementById("imagePreview");
  if (preview) {
    if (file) {
      preview.src = URL.createObjectURL(file);
      preview.style.display = "block";
    } else {
      preview.src = "";
      preview.style.display = "none";
    }
  }
}

// Init on page load
if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", initImagePreview);
} else {
  initImagePreview();
}
