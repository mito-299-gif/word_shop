<%@ page import="java.sql.*" %>

<%
String url = "jdbc:mysql://localhost:3306/word_shop";
String dbUsername = "root";
String dbPassword = "Admin";
Connection conn = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUsername, dbPassword);


} catch (SQLException ex) {   
    
}
%>


