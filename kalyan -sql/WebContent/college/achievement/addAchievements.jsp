<%@page import="com.dot.Achievements.AchievementUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*,java.text.DateFormat"%>
     <%@page import="java.io.*, java.util.*, java.util.Enumeration, java.text.DateFormat , java.text.SimpleDateFormat ,java.text.ParseException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
   <%

			try {
				//response.sendRedirect("http://localhost:8080/dot/college/profile/welcome.jsp");
				out.println("adsd1");
			    AchievementUtils.insertAchievements(request,response);
			    out.println("adsd");

			} 
			catch(Exception e)
			{
				out.println(e);
			}
   %>
   
		
</body>
</html>
