<%-- <%@page import="com.dot.College.CollegeUtils"%> --%>

<%@page import="com.dot.Member.MemberUtils" %>
<%@page import="com.dot.Skills.SkillsUtils" %>

<%-- <%@page import="com.dot.Course.CoursesUtils" %>
<%@page import="com.dot.Achievements.AchievementUtils" %>
<%@page import="com.dot.Education.EducationUtils" %>
<%@page import="com.dot.Experience.ExperienceUtils" %>
<%@page import="com.dot.Project.ProjectUtils" %>
<%@page import="com.dot.Tools.ToolsUtils" %> --%>

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
				SkillsUtils.insertSkill(request, response);
			} 
			catch(Exception e)
			{
				out.println("hey");
			}

			/* try {
				SkillsUtils.insertSkill(request,response);
			} 
			catch(Exception e)
			{
				out.println("hey");
			} */
   %>
   
		
</body>
</html>