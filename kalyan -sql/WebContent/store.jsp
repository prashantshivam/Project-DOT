<%@page import="java.sql.*,java.util.*"%>
<%
String fname=request.getParameter("pname");
String lname=request.getParameter("summary");
String email=request.getParameter("date");

        try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dot", "root", "hadoop");
           Statement st=con.createStatement();
           int i=st.executeUpdate("insert into project(pname,pstatus,summary,startdate,enddate,documentation) values('"+fname+"','','"+lname+"')");
        out.println("Data is successfully inserted!");
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
        %>