<%-- 
    Document   : welcome
    Created on : Jan 30, 2015, 9:46:57 PM
    Author     : vagelis_pc
--%>




<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    
    
  
    
    
    <head>
       <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/csstest.css" />
        <title>Welcome</title>
    </head>
    
    
 
    
   
    <script>

function setCookie(cname,cvalue,exdays)
{
var d = new Date();
d.setTime(d.getTime()+(exdays*24*60*60*1000));
var expires = "expires="+d.toGMTString();
document.cookie = cname+"="+cvalue+"; "+expires;
}

function getCookie(cname)
{
var name = cname + "=";
var ca = document.cookie.split(';');
for(var i=0; i<ca.length; i++) 
  {
  var c = ca[i].trim();
  if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
return "";
}

function checkCookie()
{
var user=getCookie("username");
if (user!="")
  {
  alert("Welcome again " + user);
  }
else 
  {
  user = prompt("Please enter your name:","");
  if (user!="" && user!=null)
    {
    setCookie("username",user,30);
    }
  }
}

</script>

<body onload="checkCookie()"></body>
   
    <%
    if ((session.getAttribute("User") == null) || (session.getAttribute("User") == "")) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} 
    else {
%>
        <div class="container">
            <a href="map.jsp"> <button type="button" class="btn btn-primary">Map</button></a>
        </div>      
        <div class="container">
            <a href="add_comment.jsp"> <button type="button" class="btn btn-primary">Add_Comment</button></a>
        </div> 
        <div class="container">
            <a href="comments.jsp"> <button type="button" class="btn btn-primary">See Comments</button></a>
        </div>
        <div class="container">
            <a href="showcomment1.jsp"> <button type="button" class="btn btn-primary">Delete Comment</button></a>
        </div> 
        <div class="container">
            <a href="logout.jsp"> <button type="button" class="btn btn-primary">Logout</button></a>
        </div> 
        <div class="border">
          <p> back to  <a href="index.html">main page </a></p>
       </div>
         <div id="footer">
            <h8> Designed by Vagelis Apostolidis  &copy 2015 </h8>
        </div>
</html>


<%}%>