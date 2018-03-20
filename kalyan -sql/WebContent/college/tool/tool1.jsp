<%@ page import="java.sql.*"%>  
<%@ page import="com.dot.Reference.Reference" %>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dot.Reference.ReferenceUtils" %>

<!DOCtype html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String context = config.getServletContext().getContextPath();
%>
<script src="<%= context %>/js/jquery-1.11.1.js" type="text/javascript"></script>
 <script>
$(document).ready(function() {
	$('#path').click(function(event) {
		var name = $('#ipath').val();
		var name1 = $('#jpath').val();
		var name2 = $('#kpath').val();
		$.get("<%= context %>/college/References/result1.jsp", {
			path : name,
			path1:name1,
			path2:name2,
			isparent : false
		}, function(responseText) {
			$('#display').html(responseText);
		});
	});
});   </script>
<script>
$(document).ready(function() {
	$('.upvote').click(function(event) {
		var name = $('.ref').val();
		$.get('/dot/college/tool/upvote.jsp', {
			upvote : name,
			isparent : false
		}, function(responseText) {
			$('#display1').html(responseText);
		});
	});
});  
</script><%
int m=0;
try{
 m = (Integer) session.getAttribute("mid");
}
catch(Exception e)
{
	m=0;
}

%>
<body><br>

<h4>links:</h4><br>
<%
int n=Integer.parseInt(request.getParameter("tid"));
List<Reference> list2 = ReferenceUtils.selectReference(request,response);

for (Reference rf : list2) {%>
 <br> <br>  <a href="http://<%=rf.getRlink()%>" target=_blank><%=rf.getRlink() %></a>;<br>
  <%
    out.println(rf.getA());}
%>
         

<%-- <form id="refer1"> 
<input type="hidden" value="<%=refid%>" class="ref" name="ref">  <input type="hidden" name="tid" id="tid" value=<%=n%> >
<input type="submit" class="upvote" value="Upvote">
</form>

<form><input type="hidden" value="<%=refid%>" id="ref"> 
 <input type="hidden" name="tid" id="jpath" value=<%=n%>><input type="submit" id="downvote" value="Downvote">
 </form>
 <div id="display1"></div>  --%>
 
 
   <br>
   <br><br>
    
       
       
<!--   <button type="submit" form="form1" value="Add">Add</button>
 --> 
 <%if(m!=0){ %>
 <h3>Add a link for this tool</h3>
  <form id="refer">
  <input type="text" name="rlink" id="ipath" placeholder="link">
   <input type="hidden" name="tid" id="jpath" value=<%=n%> >
    <input type="integer" name="level" id="kpath" min=1 max=3 placeholder="level">
     <input type="submit" value="Add" id="path">
  </form>
  <div id="display"></div>
  
  <%} %>
  </body>
 
   
   
   </html>