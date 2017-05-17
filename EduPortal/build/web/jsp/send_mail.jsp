<%-- 
    Document   : send_mail
    Created on : May 12, 2016, 10:25:02 AM
    Author     : SOUVIK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Education</title>
    </head>
    <body>
      <%! 
          Connection con=null;
          PreparedStatement ps=null;
      %>
      <%
          try
          {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                ps=con.prepareStatement("insert into contact_ask(name,email,message)"
                        + "values(?,?,?);");
                ps.setString(1, request.getParameter("name"));
                ps.setString(2, request.getParameter("email"));
                ps.setString(3, request.getParameter("message"));
                ps.executeUpdate();
                ps.close();
                con.close();
                response.sendRedirect("/EduPortal/index.html");
          }
          catch(Exception e1)
          {
              out.println(e1);
          }
     %>
    </body>
</html>
