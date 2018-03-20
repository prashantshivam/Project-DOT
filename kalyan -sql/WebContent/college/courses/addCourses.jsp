<%@page import="com.dot.Course.CoursesUtils"%>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*,java.text.DateFormat"%>
     <%@page import="java.io.*, java.util.*, java.util.Enumeration, java.text.DateFormat , java.text.SimpleDateFormat ,java.text.ParseException" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%
		
			try {
				CoursesUtils.insertCourses(request,response);
			} catch (Exception e) {
				out.println("c");
				System.out.println(e);
			}
		
		%>
		
</body>
</html>