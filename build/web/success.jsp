<%-- 
    Document   : success
    Created on : Dec 11, 2014, 9:48:12 AM
    Author     : vagelis
--%>


<%
    if ((session.getAttribute("User") == null) || (session.getAttribute("User") == "")) {
%>
Welcome to tsipouroHQ please login..<br/>
<a href="login.jsp">Please Login</a>
<%} else {
         response.sendRedirect("welcome.jsp");
    }
%>