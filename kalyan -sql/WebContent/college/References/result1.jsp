<%-- <%@page import="com.dot.College.CollegeUtils"%> --%>
<%@page import="com.dot.Reference.ReferenceUtils"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    
<%
System.out.println("check");
ReferenceUtils.insertref(request,response);
%>
</body>
</html>