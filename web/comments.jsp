<%-- 
    Document   : dashboard
    Created on : Jan 15, 2014, 4:39:53 PM
    Author     : vasilis
--%>
<%@ page import ="java.sql.*" %>



<%  request.setCharacterEncoding("UTF-8");
   
    
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Vagelis?useUnicode=true&characterEncoding=UTF-8","root","%so11333");
    
    Statement st = conn.createStatement();
    
    
    ResultSet rs;
    rs = st.executeQuery("select * from stickers ");
    
    while(rs.next()){
        String id = rs.getString(1);
        String usr =rs.getString(2);
        String sticker = rs.getString(3);
    
    
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="newcss.css" />
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    <body>
        
        <div class="border">
             <p> <%= id %>.  <%=sticker%>  by <%=usr%> </p>
        </div>
   


<%  }  %>
     


     <div class="container">
            <a href="javascript:history.back()"> <button type="button" class="btn btn-primary">Back</button></a>
        </div> 
<div id="footer">
            <h8> Designed by Vagelis Apostolidis  &copy 2015 </h8>
        </div>
  

 </body>
 
        
</html>

