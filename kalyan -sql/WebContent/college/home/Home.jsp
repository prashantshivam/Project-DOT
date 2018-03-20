<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.dot.DbUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
     <title>Home </title>
     <%
     int mid=0;
     try{
    mid=(Integer)session.getAttribute("mid");
     }
     catch(Exception e)
     {
    	 mid=0;
     }
   //  List<String> list1 = DbUtils.data(request,response);
	  
	// System.out.println(list1.get(1));
     
     %>
   </head>
<body> 
                               
                               <br><br>
                            <%   if(mid!=0){%>
                               <div class="row">
                                <div class="col m2 offset-m10">
                                    
                                    <a class="waves-effect waves-light btn" href="/dot/college/logout/logout.jsp">Logout</a>
                                 </div>   
                                </div>   <%} %>  
      <div class="row center-align">
       
           <h1 > Welcome to our Website </h1> 
           
     </div>
     
    <div class="row">
       <div class="col m4 offset-m5">
		  <%   if(mid==0){%>
		     <form action="/dot/college/login/login.html">
		   <!--  <input type="submit" value="Login" /> -->
		    <a class="waves-effect waves-light btn-large" href="/dot/college/login/login.html">Login</a>
		       </form>  <br>
		  <%} 
		  else{%> 
			<!--   <a href="welcome.jsp">Profile</a> -->
			  <a class="waves-effect waves-light btn-large" href="/dot/college/profile/welcome.jsp">Profile</a>
		  <% }
		  %> 
		  </div>
  </div>
  
     <div class="row">
       <div class="col m4 offset-m5">
		    <form action="tool_Search.jsp">
		      <!-- <input type="submit" value="Tools" /> -->
		        <a class="waves-effect waves-light btn-large" href="/dot/college/tool/tool_Search.jsp" >Tools</a>
		      
		       </form>
		    <br>
		   	  </div>
        </div>
   
		    <div class="row">
                  <div class="col m4 offset-m5">
		               <form action="member_search.jsp">
		               <!--  <input type="submit" value="Members" /> -->
		                   <a class="waves-effect waves-light btn-large"  href="/dot/college/members/member_search.jsp">Members</a>
		             </form>
		           	  </div>
           </div>   
		             
        <br>
        
        <div class="row">
                  <div class="col m4 offset-m5">
				         <form action="projectdisp.jsp">
				          <!--  <input type="submit" value="Projects" /> -->
			                   <a class="waves-effect waves-light btn-large" href="/dot/college/project/projectdisp.jsp" >Project</a>
				         </form>
				           	  </div>
           </div>     

  
         <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/js/materialize.min.js"></script>
</body>
</html>