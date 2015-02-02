import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login
  extends HttpServlet
{
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    HttpSession session = request.getSession(true);
    request.setCharacterEncoding("UTF-8");
    
    String userid = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    





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
      
      ResultSet rs = s.executeQuery("select * from Users where User='" + userid + "' and Pass='" + pwd + "'");
      if (rs.next())
      {
        session.setAttribute("User", userid);
        response.sendRedirect("success.jsp");
      }
      else
      {
        response.sendRedirect("login_failure.jsp");
      }
      rs.close();
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
  
  @Override
  public String getServletInfo()
  {
    return "Short description";
  }
}
