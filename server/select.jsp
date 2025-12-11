<%@ page import="java.sql.*" %>
<%@ include file="start.jsp" %>


<%
        String sql = "SELECT name, img FROM ps";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();    
   
%>



