 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%!
        Connection con=null;
        PreparedStatement pstat=null;
        String passwordNew,sql,value;
        boolean flag=false;
%>
<%
     
        Enumeration e2 = session.getAttributeNames();
        while (e2.hasMoreElements()) 
            {
                String name = (String)e2.nextElement();
                if(name.equals("userID"))
                    {
                                  value = session.getAttribute(name).toString();
                                  flag=true;
                                  break;
                     }
            }
                    
            try
              {
                    if(flag)
                    {
                    passwordNew=request.getParameter("passNew");
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                    sql = "update users_table set password=? where username=?";
                    pstat=con.prepareStatement(sql);
                    pstat.setString(1, passwordNew);
                    pstat.setString(2, value);
                    pstat.executeUpdate();
                    pstat.close();
                    con.close();
                           
                    session.setAttribute("message", "Updated successfully");
                     request.getRequestDispatcher("successful.jsp").forward(
                            request, response);
                    }
                 }
                   catch(Exception e)
                             {
                                  session.setAttribute("message", "Not Updated successfully");
                                  request.getRequestDispatcher("notsuccessful.jsp").forward(
                                 request, response);
                              }              
%>
