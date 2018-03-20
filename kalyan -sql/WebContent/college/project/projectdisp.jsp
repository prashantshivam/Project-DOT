<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- <%@ page import="com.dot.CollegeUtils"%> --%>
<%@page import="com.dot.Member.MemberUtils" %>
<%@page import="com.dot.Skills.SkillsUtils" %>
<%@page import="com.dot.Course.CoursesUtils" %>
<%@page import="com.dot.Achievements.AchievementUtils" %>
<%@page import="com.dot.Education.EducationUtils" %>
<%@page import="com.dot.Experience.ExperienceUtils" %>
<%@page import="com.dot.Project.ProjectUtils" %>
<%@page import="com.dot.Tools.ToolsUtils" %>
<%@ page import="com.dot.Project.Project" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
           <title> Project Display</title>
</head>
<body>
  <!-- <a href="project.jsp">Add a project</a><br>
  <a href="Home.jsp">Home</a> -->
	    
	     
                  <div class="row">
                          <div class="col m12 ">
                              
                        <!-- <a href="login.html">Login</a>  -->
                           <a class="waves-effect waves-light btn" href="/dot/college/project/project.jsp">Add a Project</a> &emsp;
					      <a class="waves-effect waves-light btn" href="/dot/college/home/Home.jsp">HOME</a>
					      </div>
					      </div>
	    <div class="row">
	        
	            <div class="col m4 offset-m4">
	            
	                <h1> Projects</h1>
	            </div>
	            </div>
	        
	        </div>
	        
	        <div class="row">
	          
	             <div class="col m4 offset-m4">
	             
	                <h1> Search a project</h1>
	                
	                  <input type="text" name="t1" >
	                  
	                    	<!-- <input  value="" type="submit"> -->
	             
	             
	               <br><br>
	               
	                      <h4>Existing Project </h4> 
	             </div>
	        
	        </div>
		<% String context = config.getServletContext().getContextPath();
		List<Project> list1 = ProjectUtils.selectProject(request,response);
		

		
		 for (Project pj : list1) {
	         out.println(pj.getPid());
	       
	         out.println(pj.getPname());
	         out.println(pj.getPstatus());%><br>
	         <a href="<%= context %>/details?id=<%=pj.getPid()%>&meid=0&tid=0" >details</a><br><br><br>
	        <%
	        }
		
		%>
		 
             
            
        <div class="row">
          
             <div class="col m4 offset-m4">   
             
           <h4> </h4>       
			<%--  Project Name:	<%=l.usertype %><br>
			 Project Status:	<%=usertype1 %><br>
			 Start Date:	<%=usertype2 %><br>
			End Date:	<%=usertype3 %><br>
				
		     Summary:<%=usertype4 %><br>
               <a href="details?id=<%=usertyp%>&meid=0&tid=0" >details</a> --%>
               
                 
             
             </div>
        
        </div>

<br>
<% 


%>
    
          <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/js/materialize.min.js"></script>
</body>
</html>