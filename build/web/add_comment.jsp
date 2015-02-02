

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/csstest.css" />
          <style>
               p{
                   font: italic normal 1.4em georgia, sans-serif;
	            letter-spacing: 1px; 
	            margin-bottom: 0; 
	            color: white;
               }
           </style>
        <title>Success</title>
    </head>
    
       <%
                      if ((session.getAttribute("User") == null) || (session.getAttribute("User") == "")) {
              %>
             You are not logged in<br/>
              <a href="login.jsp">Please Login</a>
           <%} else {
           %>
         
    <body>
         <form action="post_data.jsp" method="post">
            <p>  Add your comment Here  </p> <br />
            <
            <input name="comments" required="" placeholder="Post your comment of 200 max characters" id="comments" style="width:700px;height:80px;background-color:#768d87;color:#000000;font:24px/30px cursive;"  /> 
            <br />
           <input type="submit" value="Submit" style="background-color:#768d87;color:white;" />
           
     
         </form>
        
        <div id="footer">
            <h8> Designed by Vagelis Apostolidis  &copy 2015 </h8>
        </div>
        
    </body>
</html>
<%}%>