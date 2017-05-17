<%-- 
    Document   : updatedetails
    Created on : May 15, 2016, 5:58:32 PM
    Author     : SOUVIK
--%>

 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%!
        Connection con=null;
        PreparedStatement pstat=null;
        String newname,newemail,newphn,newaddrs,sql,value;
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
                    newname=request.getParameter("name");
                    newemail=request.getParameter("email");
                    newphn=request.getParameter("phn");
                    newaddrs=request.getParameter("address");
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                     //out.println("Connection established");
                    sql = "update users_table set name=?,email=?,mobile=?,address=? where username=?";
                    pstat=con.prepareStatement(sql);
                    pstat.setString(1, newname);
                    pstat.setString(2, newemail);
                    pstat.setString(3, newphn);
                    pstat.setString(4, newaddrs);
                    pstat.setString(5, value);
                    pstat.executeUpdate();
                    pstat.close();
                    con.close();
                           
                    session.setAttribute("message", "Updated successfully");
                     request.getRequestDispatcher("jsp/successful.jsp").forward(
                            request, response);
                    }
                 }
                   catch(Exception e)
                             {
                                  session.setAttribute("message", "Not Updated successfully");
                                  request.getRequestDispatcher("jsp/notsuccessful.jsp").forward(
                                  request, response);
                              }              
                                
             
                        
                                 
                 
  
%>
