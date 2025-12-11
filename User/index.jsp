<% if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
    response.sendRedirect("../index.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login</title>
  </head>
  <body>
    <h2>Welcome, Admin <%= session.getAttribute("name") %>!</h2>
    <a href="<%=request.getContextPath()%>/server/repost_loing.jsp?logout=true">Logout</a>
  </body>
</html>
