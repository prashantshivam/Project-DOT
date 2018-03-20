<%@page import="com.dot.Member.Member"%>
<%@page import="com.dot.Member.MemberProject"%>
<%@page import="com.dot.Skills.Skills"%>
<%@page import="com.dot.Course.Courses"%>
<%@page import="com.dot.Achievements.Achievements"%>
<%@page import="com.dot.Education.Education"%>
<%-- <%@page import="com.dot.CollegeUtils"%> --%>
<%@page import="com.dot.Member.MemberUtils"%>
<%@page import="com.dot.Education.EducationUtils"%>

<%@page import="com.dot.Experience.Experience"%>
<%@page import="com.dot.Achievements.AchievementUtils"%>
<%@page import="com.dot.Course.CoursesUtils"%>
<%@page import="com.dot.Skills.SkillsUtils"%>
<%@page import="com.dot.Member.MemberUtils"%>
<%@page import="com.dot.Experience.ExperienceUtils"%>
<%@ page import="java.sql.*"%> 
 <%@ page import="java.sql.*,java.util.*,java.text.DateFormat"%>
     <%@page import="java.io.*, java.util.*, java.util.Enumeration, java.text.DateFormat , java.text.SimpleDateFormat ,java.text.ParseException" %> 
<!DOCtype html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">




<body><br>

       <div class="row center-align">
	   
	        <div class="col m2 offset-m8">
                   <!-- 	<a href="logout.jsp">Logout</a>  &emsp; <a href="Home.jsp">Home</a> -->
					   &emsp;
					    <a class="waves-effect waves-light btn" href="/dot/college/home/Home.jsp">HOME</a>
				</div>
		   </div>			    
					    
   
       <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
                     <h1> Members</h1>
                      
                      </div>
                            </div>
<%


int n=Integer.parseInt(request.getParameter("mid"));    

  

        PreparedStatement ps=null; 
        List<Member> list3 = MemberUtils.selectMember(request,response);



        for (Member mem : list3){
  	  
       
  
%><br>
      <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
		         	Name:	<%=mem.getFname() %>
				       <%=mem.getLname() %>
				       </div>
				         </div>
				         
			<div class="row center-align">
	   
	           <div class="col m2 offset-m4">	
				       Date Of Birth:  <%=mem.getDob()%>
				      </div>
				          </div>
				 <div class="row center-align">
	   
	                 <div class="col m2 offset-m4">            
				         Mobile Number: <%=mem.getMobileno() %>
				         </div>
				        </div>
				   
				   <div class="row center-align">
	   
	                   <div class="col m2 offset-m4">        
				        Facebook:  <a href="<%=mem.getFacebook()%>"><%=mem.getFacebook()%></a>
				          </div>
				         </div>
				      
				        
				      <div class="row center-align">
	   
	                       <div class="col m2 offset-m4">     
				           LinkedIn   <a href="<%=mem.getLinkedin()%>"><%=mem.getLinkedin()%></a>
				      </div>
				      </div>
				      
			<div class="row center-align">
	   
	           <div class="col m2 offset-m4">	      
				  Twitter: <a href="<%=mem.getTwitter()%>"><%=mem.getTwitter()%></a>
				  </div>
				 </div>
				 
				<div class="row center-align">
	   
	           <div class="col m2 offset-m4">   
				 Website:   <a href="<%=mem.getWebsite()%>"><%=mem.getWebsite()%></a>
				   </div>
				   </div>



<%}
        
        %>
        
        <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
        
                        <h1>Education</h1>
                    </div>
                        </div>
     <%
      
    	 
    	 
     List<Education> list4 = EducationUtils.selectEducation(request,response);



     for (Education ed : list4){
            
    
  %><br>
    
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
          
         <div class="row center-align">
	   
	           <div class="col m2 offset-m4"> 
                     <h1>Achievements</h1>
                   </div>
                   </div>  
                     
                     <%

                     List<Achievements> list5 = AchievementUtils.selectAchieve(request,response);



                     for (Achievements ach : list5){
           
              
               
             
      
    %><br>
      
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
    				

    <%} %>
    
       <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
                  <h1>Courses</h1>
                  </div>
                    </div>
                  <%
                  
                 List <Courses>list6 = CoursesUtils.selectCourse(request,response);



                  for (Courses cs : list6){
        
           
              %><br>
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
      				
      				



      <%} %>
      
      <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
                   <h1>Skills</h1>
                 </div>
                  </div>  
                   <%
                   List <Skills> list7 = SkillsUtils.selectSkill(request,response);



                   for (Skills sk : list7){
                 
                   
                 
          
        %><br>
             <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
        				Skill:<%=sk.getSkill() %>
        			</div>
        			  </div>	



        <%} 
                %>
                
                
           <div class="row center-align">
	   
	           <div class="col m2 offset-m4">     
                <h1>Projects</h1>
                </div>
                 </div>
                <%  
                
                List <MemberProject> list8 = MemberUtils.selectMemberProject(request,response);
                
                for (MemberProject mp : list8){
             
           
    
  %><br>
     <div class="row center-align">
	   
	           <div class="col m2 offset-m4">
  			Project Name:	<%=mp.getPname()%>
  				
        </div>
         </div>


  <%}  %>
  
  
         <div class="row center-align">
	   
	           <div class="col m2 offset-m4">     
                <h1>Experience</h1>
                </div>
                 </div>
        
       
          <%
          List <Experience> list9 = ExperienceUtils.selectExperience(request, response);
          
          
          for (Experience ex : list9){
          
          %><br><br>
          
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
		         
		        
		         
          <%}  %>
   
   
   <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/js/materialize.min.js"></script>
   
   </html>