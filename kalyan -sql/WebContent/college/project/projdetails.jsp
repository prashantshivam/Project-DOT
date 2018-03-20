<%@page import="com.dot.Tools.Tools"%>
<%@page import="com.dot.Project.ProjectLink"%>
<%@page import="com.dot.Member.MemberProject"%>
<%@page import="com.dot.Project.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- <%@page import="com.dot.CollegeUtils" %> --%>

<%@page import="com.dot.Member.MemberUtils" %>
<%@page import="com.dot.Skills.SkillsUtils" %>
<%@page import="com.dot.Course.CoursesUtils" %>
<%@page import="com.dot.Achievements.AchievementUtils" %>
<%@page import="com.dot.Education.EducationUtils" %>
<%@page import="com.dot.Experience.ExperienceUtils" %>
<%@page import="com.dot.Project.ProjectUtils" %>
<%@page import="com.dot.Tools.ToolsUtils" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.99.0/css/materialize.min.css">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title> Project Details</title>
</head>
<body>

            
   
				<% int userid=0;
				try{
				  userid=(Integer)session.getAttribute("mid");
				}
				catch(Exception e){
					userid=0;
				}
				%>
				
                  <div class="row">
                          <div class="col m12 ">
                               <%if(userid==0) {%>
                        <!-- <a href="login.html">Login</a>  -->
                           <a class="waves-effect waves-light btn" href="/dot/college/login/login.html">Login</a> &emsp;
					      <a class="waves-effect waves-light btn" href="/dot/college/home/Home.jsp">HOME</a>
					      </div>
					      </div>
                <%}%> 
<%if(userid!=0){ %>

       <div class="row">
               <div class="col m12 ">
					<!-- <a href="logout.jsp"> Logout</a> -->
					 <a class="waves-effect waves-light btn" href="/dot/college/logout/logout.jsp">Logout</a> &emsp;
								    <a class="waves-effect waves-light btn" href="/dot/college/home/Home.jsp">HOME</a>
								  </div>
					      </div>   
<%}%><%

int a;
int m=0;
int tid=0;
int user_id=0;
a=(Integer)request.getAttribute("id");

	
	List<MemberProject> list1= ProjectUtils.selectProjectAdmin(request, response, a, userid);

for (MemberProject mp : list1)
  {
	  user_id=mp.getIsadmin();
	  
  }

%>
<% List<Project> list= ProjectUtils.selectProjectdetail(request, response, a);
for (Project pj : list)
{
%>
		<div class="row">
               <div class="col m4 offset-m4">
			     Project Name  :  <%=pj.getPname() %>
			      </div>
			     </div>
			<div class="row">
               <div class="col m4 offset-m4">        
			     Project Status:   <% if(pj.getPstatus()==0){ %>
			          <p>Running</p>
			             <%}
			              else if(pj.getPstatus()==1){ %> 
			                <h4> Completed</h4>
			                  <%} %>
			       </div>
			      </div>
			   
			  <div class="row">
                 <div class="col m2 offset-m4">      
			           Start Date:<%=pj.getStartdate()%>
			        </div>
			       </div>
			     
			  <div class="row">
                  <div class="col m2 offset-m4">       
		      	    End Date: <%=pj.getEnddate() %>
		      	    </div>
			       </div>
			       <div class="row">
                      <div class="col m2 offset-m4">
			           Summary: <%=pj.getSummary() %>
			         </div>
			       </div>
<br>
  
     <div class="row">
               <div class="col m4 offset-m4">
                     <h3>Project links</h3>
					<% 
					} 
					
List<ProjectLink> list2= ProjectUtils.selectProjectlink(request, response, a);
					
					for(ProjectLink pjl:list2)
					{	
						String plink =pjl.getPlink();
						%>
						<br>
						<a href="http://<%=plink%>" target=_blank><%=plink %></a>
						<%
					}
					
					%>

     <br>
     
		  <%if(user_id!=0){ %>
		<h3>Add a projectlink</h3>
		<form action="details" method="get">
		<input type="text" name="plink">
		<input type="hidden" name="id" value=<%=a %>>
		<input type="hidden" name="meid" value=<%=0 %>>
		<input type="hidden" name="tid" value=<%=tid %>>
		
		<input type="submit" value="Add">
		</form>

          </div>
             </div>
        
<br><br>


<%
if((Integer)request.getAttribute("check")==2){
	
	ProjectUtils.insertlink(request,response,a);}
%>
<% } %>

<br>
        <div class="row">
               <div class="col m4 offset-m4">
						<%if(user_id!=0){ %>
						<br><h3>Add members</h3>
<%@ page import="java.sql.*"%>
<script>
var request;
function sendInfo()
{
var v=document.vinform.t1.value;
var url="/dot/college/members/index.jsp?val="+v;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('amit').innerHTML=val;
}
}

var request1;
function tendInfo()
{
var v=document.vinform1.t1.value;
var url="/dot/college/tool/tool.jsp?val="+v;

if(window.XMLHttpRequest){
request1=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request1=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request1.onreadystatechange=tetInfo;
request1.open("GET",url,true);
request1.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function tetInfo(){
if(request1.readyState==4){
var val=request1.responseText;
document.getElementById('amit1').innerHTML=val;
}
}
</script>
			<form name="vinform">
			<input type="text" name="t1" onkeyup="sendInfo()">
			</form>

<span id="amit"> </span>

  </form>
     </div>
         </div>

 <% if((Integer)request.getAttribute("check")==1){
	MemberUtils.insertprojmem(request,response,a);
}

%>
<% } %><br><br><br><br>


   <div class="row">
               <div class="col m4 offset-m4">
                     <h3>Members</h3>
                     </div>
                     </div>
<% 
 
List<MemberProject> list3= MemberUtils.selectMemberProjectdetail(request, response, a);

for (MemberProject mpd : list3){
	
	String fname = mpd.getFname();
	String lname=mpd.getLname();
	%>
	<br>
	 <div class="row">
               <div class="col m2 offset-m4">
	                <%=fname %> <%=lname %>
	             </div>
	         </div>                
	<%
} 
%>

<br>
<%if(user_id!=0){ %>
 <div class="row">
               <div class="col m2 offset-m4">
			<h3>Add tool</h3>
			<form name="vinform1">
			<input type="text" name="t1" onkeyup="tendInfo()">
			</form>

<span id="amit1"> </span>
</form>
  </div>
    </div>

<%
if((Integer)request.getAttribute("check")==3){
	ProjectUtils.insertprojtool(request,response,a);}
%>
<% } %>

   <div class="row">
               <div class="col m2 offset-m4">
                      <h1>Tools</h1>
                      </div>
                      </div>
<%
	 List<Tools> list5 = ToolsUtils.selectTools(request, response);

for (Tools tl : list5)
  {
	  String tname = tl.getTname();
		
		%>
		<br>
	 <div class="row">
               <div class="col m2 offset-m4">	
		     <%=tname %>
		       </div>
		       </div>
		<%
  }%>
</body>
</html>