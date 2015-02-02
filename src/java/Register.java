import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    request.setCharacterEncoding("UTF-8");
    
    int count = 0;
    String user = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    




    Connection connection = null;
    Statement s = null;
    try
    {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    }
    catch (Exception e)
    {
      System.out.println("driver failed registation");
      System.out.println(e.getMessage());
      System.exit(1);
    }
    try
    {
      String connectionURL = "jdbc:mysql://localhost:3306/Vagelis?useUnicode=true&characterEncoding=UTF-8";
      
      connection = DriverManager.getConnection(connectionURL, "root", "%so11333");
      
      s = connection.createStatement();
      







      int i = s.executeUpdate("insert into Users(F_name, L_name, Mail, User, Pass) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "')");
      response.sendRedirect("success.jsp");
      

      s.close();
    }
    catch (SQLException sqle)
    {
      System.out.println("Database failed");
      System.out.println("because " + sqle.getMessage());
    }
  }
  
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    processRequest(request, response);
  }
  
  public String getServletInfo()
  {
    return "Short description";
  }
}