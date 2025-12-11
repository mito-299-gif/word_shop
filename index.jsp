<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login</title>
    <link rel="stylesheet" href="./style.css" />
  </head>
  <body>
    <div class="content">
      <div class="img_logo">
        <img src="" alt="" srcset="" />
      </div>
      <div class="login_name">
        <p>Word_shop</p>
      </div>
      <div class="form">
        <form action="<%=request.getContextPath()%>/server/repost_loing.jsp" method="post">
          <input type="text" name="username1" placeholder="Username, Email, or Phone" />
          <input type="password" name="password" placeholder="Password" />
          <input type="submit" value="login" />
        </form>
      </div>
    </div>
  </body>
      <script src="js/sweetalert2.all.min.js"></script>
        <% if (session.getAttribute("errorMessage") != null) { %>
          <script>
            Swal.fire({
              title: "Error",
              text: "<%= session.getAttribute("errorMessage") %>",
              icon: "error",
              button: "OK",
            });
          </script>
          <% session.removeAttribute("errorMessage"); %>
        <% } %>
</html>
</html>
