<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tool Inserted</title>
</head>
<body>

  <%
      int n=Integer.parseInt(request.getParameter("id"));
     
 try{  
	 Class.forName("com.mysql.jdbc.Driver");  
	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dot","root","hadoop");  
	 PreparedStatement ps=con.prepareStatement("insert into worked_with(pid,tid) values (1,?)");

	  ps.setInt(1,n);
	 int rs=ps.executeUpdate();
	 con.close();  
	}
		catch(Exception e)
		
				{
					e.printStackTrace();
				}

    
  %>

</body>
</html> --%>