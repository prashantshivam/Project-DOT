<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
    
	
<% 
//String link=request.getParameter("path");
int refid =Integer.parseInt(request.getParameter("upvote"));
System.out.println("insert"+refid);
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;

String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/dot";
String user = "root";
String password = "hadoop";
String sql= "select vote from votes where mid=1 and refid=?";
String sql1= "insert into votes() values(?,1,?)";
int num=0;
int v=0;
System.out.println("insert"+refid);
try {
	
	
Class.forName(driverName);
con = DriverManager.getConnection(url, user, password);
ps = con.prepareStatement(sql);
ps.setInt(1,refid);

 rs = ps.executeQuery(); 

	 while (rs.next()) {
         num = rs.getInt("vote");
         System.out.println(num);
         
	
	
}
	 if(num==0)
		 v=1;
	 else 
		 v=0;
	
	%>
<% 
}
catch(SQLException sqe)
{
out.println("home"+sqe);
System.out.println(sqe);
}

System.out.println("insert"+refid);
try{
	ps = null;
	ps = con.prepareStatement(sql1);
	ps.setInt(1,refid);
	ps.setInt(2,v);

	 int rs1 = ps.executeUpdate(); 
	 System.out.println("inserted"+rs1);
	
}

catch(SQLException sqe)
{
out.println("home"+sqe);
System.out.println("2"+sqe);
}



//out.println("<h1>6868</h1>");
%>


</body>
</html>