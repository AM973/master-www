<%-- 
    Document   : entrytodb
    Created on : Jan 9, 2014, 4:24:12 PM
    Author     : Angelos
--%>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Connection status</h1>
<% 
   
request.setCharacterEncoding("UTF-8");      
    
 String sticker = request.getParameter("comments");
 
 String fname=  session.getAttribute("User").toString();


   
   
            Connection connection = null; 
             Class.forName("com.mysql.jdbc.Driver");
              Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Vagelis?useUnicode=true&characterEncoding=UTF-8","root","%so11333");
    
              Statement st = conn.createStatement();
            
            
            
            
           int i = st.executeUpdate("insert into stickers(Username, Text) values ('" + fname + "','" + sticker + "')");
            
           if(i>0){
                    response.sendRedirect("success.jsp");
            }






%>
    </body>
</html>
