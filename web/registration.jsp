<%-- 
    Document   : registration
    Created on : Dec 11, 2014, 9:48:30 AM
    Author     : vagelis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <a href="login_failure.jsp"></a>
        <link rel="stylesheet" type="text/css" href="css/csstest.css" /> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Registration</title>
    </head>
    <body>
        <form method="post" action="Register">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" value="" required="" /></td>
                    </tr>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value="" required=""/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                        
                    </tr>
                    
                </tbody>
            </table>
            </center>
        </form>
        
       <div class="border">
          <p> back to  <a href="index.html">main page </a></p>
       </div>
        <div id="footer">
            <h8> Designed by Vagelis Apostolidis  &copy 2015 </h8>
        </div>
    </body>
</html>
