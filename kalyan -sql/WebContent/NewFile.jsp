<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/dot";
String user = "root";
String password = "hadoop";

String sql = "select * from admin";

try {
	
	
Class.forName(driverName);
con = DriverManager.getConnection(url, user, password);
ps = con.prepareStatement(sql);
rs = ps.executeQuery(); 
%>



<%
while(rs.next())
{
String usertype = rs.getString("adid");
String usertype1 = rs.getString("username");

String usertype2 = rs.getString("password");

%>
<%=usertype %>
<%=usertype1 %>
<%=usertype2 %>
<br>
<% 
}
}
catch(SQLException sqe)
{
out.println("home"+sqe);
}
%>





</body>
</html>