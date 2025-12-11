<%@ page import="java.sql.*" %>
<%@ include file="start.jsp" %>


<%
   if (request.getParameter("logout") != null) {
       session.invalidate();
       response.sendRedirect("../index.jsp");
       return;
   }

   String userUsername = request.getParameter("username1");
   String userPassword = request.getParameter("password");

      
   try {
      
       String sql_user = "SELECT * FROM users WHERE (username = ? AND password = ?) OR (Email = ? AND password = ?) OR (Tel = ? AND password = ?)";
       PreparedStatement stmt = conn.prepareStatement(sql_user);
       stmt.setString(1, userUsername);
       stmt.setString(2, userPassword);
       stmt.setString(3, userUsername);
       stmt.setString(4, userPassword);
       stmt.setString(5, userUsername);
       stmt.setString(6, userPassword);
       ResultSet rs = stmt.executeQuery();

       String sql_admin = "SELECT * FROM admin WHERE username = ? AND password = ? ";
       PreparedStatement stmt_admin = conn.prepareStatement(sql_admin);
       stmt_admin.setString(1, userUsername);
       stmt_admin.setString(2, userPassword);
       ResultSet rs_admin = stmt_admin.executeQuery();

       if (rs.next()) {
           String name = rs.getString("name");
           session.setAttribute("name", name);
           session.setAttribute("password", userPassword);
           session.setAttribute("username", userUsername);
           response.sendRedirect("../User/index.jsp");

       } else if (rs_admin.next()) {
           session.setAttribute("username", userUsername);
           session.setAttribute("password", userPassword);
           response.sendRedirect("../Admin/index.jsp");
       } else {
           session.setAttribute("errorMessage", "Invalid username or password.");
           response.sendRedirect("../index.jsp");
       }

       rs.close();
       stmt.close();
       rs_admin.close();
       stmt_admin.close();
       conn.close();

   } catch (Exception e) {
       out.println("Error: " + e.getMessage());
   }
%>
