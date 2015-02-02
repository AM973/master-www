<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");    
session.setAttribute("User", null);
session.invalidate();
response.sendRedirect("index.html");
%>

