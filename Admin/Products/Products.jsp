<form
  action="../../WEB-INF/classesUploadServlet.class"
  method="post"
  enctype="multipart/form-data"
>
  ชื่อ:
  <input type="text" name="name" required /><br /><br />

  รูปภาพ:
  <input type="file" name="image" accept="image/*" required /><br /><br />

  <button type="submit">บันทึก</button>
</form>
