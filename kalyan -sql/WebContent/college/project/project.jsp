<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
   
<%
String context = config.getServletContext().getContextPath();

int userid=0;
try{
  userid=(Integer)session.getAttribute("mid");
}
catch(Exception e){
	userid=0;
}
if(userid!=0){
%>
<body>
<div align="center">
<h1>Add a project</h1><br>
<form action="<%= context %>/project" method="post">
  Project: <input type="text" name="pname" placeholder="Project name"><br><br>
   Summary:<input type="text" name="summary" placeholder="Description" row="3"><br><br>
   Startdate: <input type= "date" name="startdate" ><br><br>
  <!--  Enddate :<input type="date" name="enddate" value="2001-3-4"><br> -->
   <input type="submit" value="Add a project">
</form>
<%}
else{ %>
	You have to login to add a project.
	<a href="/dot/college/login/login.html">Click here to login</a>
<%} %>
</div>


</body>
</html>