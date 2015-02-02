<%-- 
    Document   : login
    Created on : Dec 11, 2014, 9:47:13 AM
    Author     : vagelis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/newcss1.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
       <form method="post" action="Login" >
            <center>
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Yet Not Registered!! <a href="registration.jsp">Register Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
         
        
       <div id="border">
          <p> back to  <a href="index.html">main page </a></p>
       </div>
        <div id="footer">
            <h8> Designed by Vagelis Apostolidis  &copy 2015 </h8>
        </div>
    </body>
</html>

