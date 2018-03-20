<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Error</title>
</head>
<body>
<center><p style="color:red">Sorry, your record is not available.</p></center>
<% //getServletContext().getRequestDispatcher("login.html").include(request, response);

System.out.println("Wrong user name or password");%>
<p><a href="/dot/college/login/login.html">click here to login again</a></p>


 
</body>
</html>



