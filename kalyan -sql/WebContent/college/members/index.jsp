<%@ page import="java.sql.*"%>

<%
String s=request.getParameter("val");
//int a= Integer.parseInt(request.getParameter("pid"));
if(s==null || s.trim().equals("")){
//out.print(a);
}else{
//int id=Integer.parseInt(s);
//out.print(id);
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dot","root","hadoop");
PreparedStatement ps=con.prepareStatement("select * from member where fname LIKE ?");
ps.setString(1,"%" + s + "%");
//ps.setInt(2,a);
ResultSet rs=ps.executeQuery();
while(rs.next()){%>

<a href="details?meid=<%=rs.getInt("mid")%>&id=0&tid=0" ><%=rs.getString("fname")%></a>

<%}
con.close();
}catch(Exception e){e.printStackTrace();}
}
%>