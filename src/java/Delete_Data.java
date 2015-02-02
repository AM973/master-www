/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Delete_Data
  extends HttpServlet
{
  public void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    HttpSession session = request.getSession(true);
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("delete");
    String fname = session.getAttribute("User").toString();
    


    String USER = "root";
    String PASS = "%so11333";
    


    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    try
    {
      Class.forName("com.mysql.jdbc.Driver");
      

      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Vagelis?useUnicode=true&characterEncoding=UTF-8", USER, PASS);
      

      Statement st = conn.createStatement();
      
      int category = 0;
      int i = st.executeUpdate("delete from stickers where ID = '" + id + "' && UserName ='" + fname + "'  ");
      if (fname == null){ response.sendRedirect("welcome.jsp");}
      response.sendRedirect("showcomment1.jsp");
    }
    catch (ClassNotFoundException ex)
    {
      System.out.println("Delete_Data");
      System.out.println(ex.getMessage());
      System.exit(1);
    }
    catch (SQLException ex)
    {
      System.out.println("Delete_Data");
      System.out.println(ex.getMessage());
      System.exit(1);
    }
    catch (IOException ex)
    {
      System.out.println("Delete_Data");
      System.out.println(ex.getMessage());
      System.exit(1);
    }
  }
  
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
