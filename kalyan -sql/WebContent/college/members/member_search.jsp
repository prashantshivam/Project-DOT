<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search a tool </title>
</head>
<body>



<script>

var request1;
function tendInfo()
{
var v=document.vinform1.t1.value;
var url="/dot/college/members/member_query1.jsp?val="+v;

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


<br>
<h1>Search a Member</h1>
<form name="vinform1">
<input type="text" name="t1" onkeyup="tendInfo()">
</form>

<span id="amit1"> </span>
</form>
</body>
</html>