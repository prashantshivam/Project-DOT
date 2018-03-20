
<%@page import="com.dot.Skills.NotSkills"%>
<%@page import="com.dot.Skills.Skills"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.dot.Achievements.Achievements"%>
<%@page import="com.dot.Education.Education"%>
<%-- <%@page import="com.dot.CollegeUtils"%> --%>
<%@page import="com.dot.Member.MemberUtils"%>
<%@page import="com.dot.Skills.SkillsUtils"%>
<%@page import="com.dot.Course.CoursesUtils"%>
<%@page import="com.dot.Achievements.AchievementUtils"%>
<%@page import="com.dot.Education.EducationUtils"%>
<%@page import="com.dot.Experience.ExperienceUtils"%>
<%@page import="com.dot.Member.Member"%>
<%@page import="com.dot.Course.Courses"%>
<%@page import="com.dot.Experience.Experience"%>
   <%@ page import="java.sql.*,java.util.*,java.text.DateFormat"%>
     <%@page import="java.io.*, java.util.*, java.util.Enumeration, java.text.DateFormat , java.text.SimpleDateFormat ,java.text.ParseException" %>

<!DOCTYPE html>
	<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	   <!-- Compiled and minified CSS -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
 	<title>Welcome Page</title>
	</head>
<body>
	
	<div class="row center-align">
	   
	     <div class="col m2 offset-m4">
	      
	        <br> <br>
			<h4>	Welcome,
				
				 <%!String FName;
					String LName;
					int mob;
					int mid;
					
					String facebook;
					String linkedin;
					String twitter;
					String website ;
				%> 
		
				<%=session.getAttribute("username")%></div></h4>
				<!-- 	<a href="logout.jsp">Logout</a>  &emsp; <a href="Home.jsp">Home</a> -->
					  <a class="waves-effect waves-light btn" href="/dot/college/logout/logout.jsp">Logout</a> &emsp;
					    <a class="waves-effect waves-light btn" href="/dot/college/home/Home.jsp">HOME</a>

    </div>

	<%
		String username = session.getAttribute("username").toString();
		String pass = session.getAttribute("pass").toString();
		String mid1 = session.getAttribute("mid").toString();
		mid = Integer.parseInt(mid1);
		 Connection con = null;
		PreparedStatement ps = null; 
		 ResultSet rs = null;
		ResultSet rs1[] = null; 
		String sql = "select * from member where mid=?";
		 String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/dot";
		String user = "root";
		String dbpsw = "hadoop"; 

	

		if (mid != 0) {
			
			 List<Member> list3 = MemberUtils.selectMember(request,response);
			
			 for (Member mem : list3){
          %>
	
	<div class="row">
          <div class="col m2 offset-m4">
	                     First name:
						<%=mem.getFname()%>
					  Last name:
				          <%=mem.getLname()%><br>
		  	     </div>	
	       </div> 
	  
	 
	   <div class="row">
              <div class="col m2 offset-m4">  
	      	      <br> dob:<%=mem.getDob()%>
		      </div>	
	       </div>
	 
	  <div class="row">
          <div class="col m2 offset-m4">
				  Mob:
					<%=mem.getMobileno()%>
		    </div>	
	       </div> 
	     
	       
	    <div class="row">
              <div class="col m2 offset-m4">       
		   
	          	<br> facebook: <a href="<%=mem.getFacebook()%>"><%=mem.getFacebook()%></a>
		     </div>	
	       </div>
	       
	       
	    <div class="row">
              <div class="col m2 offset-m4"> 	
	        	<br> linkedin: <a href="<%=mem.getLinkedin()%>"><%=mem.getLinkedin()%></a>
	          </div>	
	       </div>
	       
	        	
		 <div class="row">
              <div class="col m2 offset-m4"> 
		          <br> twitter:<a href="<%=mem.getTwitter()%>"><%=mem.getTwitter()%></a>
		         </div>	
	       </div>  
		        
		        <div class="row">
                    <div class="col m2 offset-m4">    
							   <br> website: <a href="<%=mem.getWebsite()%>"><%=mem.getWebsite()%></a>
						</div>
					        </div>	
							
		   
          <% }}%>	 
					   
			 <form method="post" action="/dot/college/profile/updateProfile.jsp">	
					   <input type="submit" name="edit" value="edit profile"><br>
	            		
	       	<br>
			</form>
			

       <div class="row">
              <div class="col m2 offset-m4"> 
				<FORM ENCTYPE="multipart/form-data" ACTION="/dot/college/profile/addImage.jsp" METHOD=POST>
				  upload image:<INPUT NAME="file" TYPE="file"><br>
				  <input type="submit" value="Send File">
				</FORM>
		   </div>	
	             </div>  		




		
		      <div class="row">
                <div class="col m2 offset-m4"> 
                     <h2>Skills</h2>
		<%
			//sql = "select * from skills where sid in (select sid from has_skills where mid =? )";
		  List <Skills> list7 = SkillsUtils.selectSkill(request,response);
        for (Skills sk : list7){

				
		%>

		<%=sk.getSkill()%><br>
		<%
			}
			
		%>
		<%
		 List <NotSkills> list8 = SkillsUtils.selectnotSkill(request,response);
		%>
			<form method="get" action="/dot/college/skills/addSkill.jsp">
			
		 <% String a = "s"; %> -
		 
		<select name="skill">
			<% 
			for (NotSkills sk : list8){
			
			     a =sk.getSkill(); %>
			     	
			    <option value="<%=a %>"> <%=a %> </option> 
			    
			<%
			
				}
			
				
			%>
		</select> 
		
		  <br>
		
			<input  value="add new skill" type="submit">
		   
		    </div>	
	             </div> 
	</form>
	
	
	
	<div class="row">
                <div class="col m4 offset-m4"> 
	
	
	
	<h2>Courses</h2>
	</p>
		
			<%
				
				
						 List<Courses> list6 = CoursesUtils.selectCourse(request,response);
						
						 for (Courses cs: list6){
		
					
			%>
			
			     <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
      				Name: <%=cs.getTitle() %>
      				</div>
      				  </div>
      				<div class="row center-align">
	   
	                      <div class="col m2 offset-m4">  
      			        Description:	<%=cs.getDescription() %>
      			        	</div>
      			        	</div>
      			        	
      			 <div class="row center-align">
	   
	                 <div class="col m2 offset-m4">    
	                    	
      			        Course Date:	<%=cs.getCdate()%>
      			        	</div>
      			        	</div>
      				
			    
			<%
				}
				
			%>
	
	<form action="/dot/college/courses/addCourses.jsp" method="get">
			Title: <input type="text" name="title" /> Description: <input
					type="text" name="description"/ >
		    Course Date<input type="date" name="cdate" />
				
					<input name="courses" value="add new one" type="submit">
					
					  </div>	
	             </div> 
		         
      </form>


	<div class="row">
                <div class="col m4 offset-m4">
  
 	
		<h2>Achievements</h2>
		
		<%
			List<Achievements> list5=null;
				
			list5 = AchievementUtils.selectAchieve(request,response);
				
				 for (Achievements ach: list5){
		%>
		
		<div class="row center-align">
	   
	           <div class="col m2 offset-m4">
    			Title:	<%=ach.getTitle() %>
    				</div>
    				</div>
    				<div class="row center-align">
	   
	           <div class="col m2 offset-m4">
	              Description:    <%=ach.getDescription() %>
    				</div>
    				</div>
    				
    			<div class="row center-align">
	   
	           <div class="col m2 offset-m4"> 	
    			Date:	  <%=ach.getDate()%>
    				</div>
    				</div>
    			<div class="row center-align">
	   
	                  <div class="col m2 offset-m4">	
    				Issuer:  <%=ach.getIssuer() %>
    				    </div>
    				    </div>
		
		
		<%
			}%>
			
		  <form action="/dot/college/achievement/addAchievements.jsp" method="get">
		Title: <input type="text" name="title" /> Description: <input
			type="text" name="description"/ > Issuer<input type="text"
			name="isuser" /> Issue Date<input type="date" name="date" />
		
			<input name="achievements" value="add new one" type="submit">
		
		   </div>	
	             </div> 
	</form>


            	<div class="row">
                    <div class="col m4 offset-m4">

		<h2>Education</h2>
		</p>
		<%
		 List<Education> list4 = EducationUtils.selectEducation(request,response);



	     for (Education ed : list4){
		%>
		
		<div class="row center-align">
	   
	           <div class="col m2 offset-m4">
  				  Name:   <%=ed.getDegree() %>
  				    </div>
  				   </div>
  				
  				<div class="row center-align">
	   
	                <div class="col m2 offset-m4">     
  				        Institute:  <%=ed.getStream() %>
  				          </div>
  				         </div>
  				      
  				<div class="row center-align">
	   
	                 <div class="col m2 offset-m4">          
  				     Stream:    <%=ed.getInstitute()%>
  				     </div>
  				     </div>
  				     
  				     <div class="row center-align">
	   
	                     <div class="col m2 offset-m4">
  			             Grade:  	<%=ed.getStartdate() %>
  			               </div>
  			              </div>
  			               <div class="row center-align">
	   
	                     <div class="col m2 offset-m4">
  			             Grade:  	<%=ed.getEnddate() %>
  			               </div>
  			              </div> 
		
		  <%} 
          
          %>
          
		<form action="/dot/college/education/addEducation.jsp" method="post">
			degree: <input type="text" name="degree" /><br> Grade: <input
				type="text" name="grade"/ ><br> Institute<input
				type="text" name="institute" /><br> Start Date<input type="date"
				name="startdate" /><br> End Date<input type="date"
				name="enddate" /><br> Stream:<input type="text" name="stream" /><br>
			
				<input name="education" value="add new one" type="submit">
		
		  
		   </div>	
	             </div> 
	</form>
	
	  	<div class="row">
                    <div class="col m4 offset-m4">
                    
                    <h2>Experience</h2>
		</p>
		 <%
		 List <Experience> list9 = ExperienceUtils.selectExperience(request, response);
         
         
         for (Experience ex : list9){
		%> 
		
		   
            <div class="row">
                <div class="col m2 offset-m4">
  			     Title:	<%=ex.getTitle()%>
  				
		        </div>
		         </div>
		       
		       <div class="row">  
		         <div class="col m2 offset-m4">
  			     Descprition:	<%=ex.getDescription()%>
  				
		        </div>
		         </div>
		         
		         
		       <div class="row">  
		         <div class="col m2 offset-m4">
  			     Company name:	<%=ex.getCompany()%>
  				
		        </div>
		         </div>
		         
		        <div class="row"> 
		         <div class="col m2 offset-m4">
  			     Location:	<%=ex.getLocation()%>
  				
		        </div>
		         </div>
		       
		       
		       <div class="row">  
		         <div class="col m2 offset-m4">
  			     Start Date:	<%=ex.getSdate()%>
  				
		        </div>
		         </div>
		         
		         
		        <div class="row"> 
		         <div class="col m2 offset-m4">
  			      End date:	<%=ex.getEdate()%>
  				
		        </div>
		         </div>
		         
		         
		         <div class="row">
		         <div class="col m2 offset-m4">
  			      Tools:	<%=ex.getTools()%>
  				
		        </div>
		         </div>
		         
		         
		           <%} 
          
          %>
		 
		 	<form action="/dot/college/experience/addExperience.jsp" method="post">
		title: <input type="text" name="title" /><br> description: <input
			type="text" name="description" ><br> Start Date<input
			type="date" name="sdate" /><br> End Date<input type="date"
			name="edate" /><br> company<input type="text" name="company" /><br>
		Location:<input type="text" name="location" /><br> tools<input
			type="text" name="tools" /><br>
		
			<input name="experience" value="add new one" type="submit">
		
		    </div>	
	             </div> 
	</form>







	
	  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/js/materialize.min.js"></script>
	   <script>
     $(document).ready(function() {
        $('select').material_select();
    });
  </script>
</body>
</html>