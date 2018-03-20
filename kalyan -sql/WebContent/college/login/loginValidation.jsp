<%@page import="com.dot.DbUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%! String userdbName;
String userdbPsw;
%>
<%
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/dot";
String user = "root";
String dbpsw = "hadoop";

String sql = "select * from login where username=? and password=?";

String name = request.getParameter("username");
String password = request.getParameter("pass");

if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals(""))) )
{
try{
/* Class.forName(driverName);
con = DriverManager.getConnection(url, user, dbpsw); */

con = DbUtils.getConnection();
ps = con.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, password);
rs = ps.executeQuery();
if(rs.next())
{ 
userdbName = rs.getString("username");
userdbPsw = rs.getString("password");
int mid = rs.getInt("mid");
if(name.equals(userdbName) && password.equals(userdbPsw) )
{
session.setAttribute("username",userdbName);
session.setAttribute("mid",mid);
session.setAttribute("pass",userdbPsw);
response.sendRedirect("/dot/college/profile/welcome.jsp"); 
} 
}
else
response.sendRedirect("error.jsp");

}
catch(SQLException sqe)
{
out.println(sqe);
} 
}
else
{
%>
<center><p style="color:red">Error In Login</p></center>
<h2> Either Username Or password is blank</h2>
<p><a href="/dot/college/login/login.html">click here to login again</a></p>
<% 


}
%>
  
</body>
</html>
