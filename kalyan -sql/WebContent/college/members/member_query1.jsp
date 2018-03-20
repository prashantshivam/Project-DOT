<%@ page import="java.sql.*"%> 
<%@page import="com.dot.DbUtils"%> 
  
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kalyan Hadoop Training @ ORIENIT</title>
 <script>
  
		 /*  $(document).ready(function(){
		      $("#users").change(function(){
		          var value = $(this).val();
		          $.get("member_query2.jsp",{q:value},function(data){
		           $("#javaquery").html(data);
		          });
		      });
		  }); */
  
  
  </script> 
<%  
String s=request.getParameter("val");  
if(s==null || s.trim().equals("")){  
out.print("Please enter the member name");  
}//else{  
//int id=Integer.parseInt(s);  
//out.print(id);  
try{  
/* Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dot","root","hadoop");   */
Connection con = DbUtils.getConnection();

PreparedStatement ps=con.prepareStatement("select * from member where fname like ?");

 ps.setString(1,"%"+s+"%");
ResultSet rs=ps.executeQuery(); 

		while(rs.next()){
			
		%>
		    <form method="get" action="/dot/college/members/member_query2.jsp" id="users">
		    
			
			<%--   <a href="tool1?tid=<%=rs.getInt("tid") %>&id=0&meid=0"><%=rs.getString("tname") %></a> --%>
			  <input type="hidden" name="mid" value=<%=rs.getInt("mid")%>>
			  <button type="submit"  value="Submit"><%=rs.getString("fname") %><%=rs.getString("lname") %></button>
			</form>  
			<% 
		}
		  
		 
	
	}
  catch(Exception e)

		{
			e.printStackTrace();
		}


 
%>
		<html>
		
		 <body> 
		    
        <div id="javaquery"></div>  
		 </body>
		</html>
 
