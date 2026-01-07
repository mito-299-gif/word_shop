<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="start.jsp" %>

<%

    if (request.getParameter("logout") != null) {
        session.invalidate();
        response.sendRedirect("../index.jsp");
        return;
    }


    String username = request.getParameter("username1");
    String password = request.getParameter("password");

    if (username == null || password == null) {
        response.sendRedirect("../index.jsp");
        return;
    }

    try {

        String sql = "SELECT * "
                   + "FROM admin "
                   + "LEFT JOIN admin_user ON admin.id_Admin = admin_user.id_Admin "
                   + "LEFT JOIN admin_user_password ON admin_user.id_Admin_User = admin_user_password.id_admin_User "
                   + "WHERE ( (admin_user.Email = ? AND admin_user_password.Password = ?) "
                   + "     OR (admin_user_password.Number_Tel = ? AND admin_user_password.Password = ?) )";

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ps.setString(3, username);
        ps.setString(4, password);

        ResultSet rs = ps.executeQuery();

  
        if (rs.next()) {
            String role = rs.getString("Admin_User"); 

            session.setAttribute("username", username);
            session.setAttribute("password", password);
            session.setAttribute("name", rs.getString("Name"));
            session.setAttribute("role", role);

            if ("Admin".equalsIgnoreCase(role)) {
                response.sendRedirect("../Admin/index.jsp");
            } else if ("User".equalsIgnoreCase(role)) {
                response.sendRedirect("../User/index.jsp");
            } else {
                session.setAttribute("errorMessage", "no user");
                response.sendRedirect("../index.jsp");
            }
        } else {
            session.setAttribute("errorMessage", "user not found");
            response.sendRedirect("../index.jsp");
        }

        rs.close();
        ps.close();
        conn.close();

    } catch (Exception e) {
        out.println("ERROR : " + e.getMessage());
    }
%>
