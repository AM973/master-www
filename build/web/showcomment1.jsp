
<%@ page import ="java.sql.*" %>

 <link rel="stylesheet" type="text/css" href="csstest.css" />
 
<%  
    if ((session.getAttribute("User") == null) || (session.getAttribute("User") == "")) {
%>

You are not logged in<br/>
<a href="login.jsp">Please Login</a>

<%
    }else{
%>

<%  request.setCharacterEncoding("UTF-8");
    String fname=  session.getAttribute("User").toString();
    
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Vagelis?useUnicode=true&characterEncoding=UTF-8","root","%so11333");
    
    Statement st = conn.createStatement();
    
    
    ResultSet rs;
    rs = st.executeQuery("select * from stickers where UserName = '"+ fname +"'");
    
    while(rs.next()){
        String id = rs.getString(1);
        
        String sticker = rs.getString(3);
    
    
%>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" type="text/css" href="csstest.css" />
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/newcss.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>  
    
    <body>
        
        <div class="border">
             <p> <%= id %>.  <%=sticker%>  by <%=fname%> </p>
        </div>
   


<%  }  %>
       
       
       <div id="right" >
         <a href="add_comment.jsp" class="classname" ><button type="button" class="btn btn-primary">Post</button></a>
        </div>
        <a href="logout.jsp" class="classname"  > <button type="button" class="btn btn-primary">Logout</button></a>
        <br />
       
       <form action="Delete_Data" method="post">
         <input name="delete" required="" placeholder="Enter the ID post to delete" id="delete" style="width:500px;height:50px;background-color:#768d87;color:white;font:24px/30px cursive;"   /> 
         <br />
        <input type="submit" value="Submit" style="background-color:#768d87;color:white;" />
      </form>


       <br />
       <cnt>
       <div id="stick">
          <a href="welcome.jsp" class="classname"  > <button type="button" class="btn btn-primary">Menu</button></a>
       </div>
           <div id="footer">
            <h8> Designed by Vagelis Apostolidis  &copy 2015 </h8>
        </div>
       </cnt>

  

 </body>
 
        
</html>

<% } %>