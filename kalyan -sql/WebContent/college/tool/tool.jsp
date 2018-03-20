<%@ page import="java.sql.*"%>  
  
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter the tool name");  
}//else{  
//int id=Integer.parseInt(s);  
//out.print(id);  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dot","root","hadoop");  
PreparedStatement ps=con.prepareStatement("select * from tools where tname like ?");

 ps.setString(1,"%"+s+"%");
ResultSet rs=ps.executeQuery(); 

		while(rs.next()){
			
		%>
		
			  <a href="details?tid=<%=rs.getInt("tid") %>&id=0&meid=0"><%=rs.getString("tname") %></a>
			<% 
		}
		  
		 
	
	}
  catch(Exception e)

		{
			e.printStackTrace();
		}


 
%>

 
