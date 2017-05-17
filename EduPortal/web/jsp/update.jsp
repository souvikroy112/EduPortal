 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%!
        Connection con=null;
        PreparedStatement pstat=null;
        ResultSet rs=null;
        String passwordOld,passwordNew,sql;
        boolean flag;
        int id,value;
%>
<%
     
        Enumeration e2 = session.getAttributeNames();
        while (e2.hasMoreElements()) 
            {
                String name = (String)e2.nextElement();
                if(name.equals("Id"))
                    {
                                  value = Integer.parseInt(session.getAttribute(name).toString());
                     }
            }
                    
            try
              {
                    flag=false;
                    passwordOld=request.getParameter("passOld");
                    passwordNew=request.getParameter("passNew");
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/EduPortal","root","Souvik@8013170910");
                     //out.println("Connection established");
                    sql = "update userreg set password=" + passwordNew +" where password="+ passwordOld + " and id=" + value;
                    pstat=con.prepareStatement(sql);
                    pstat.executeUpdate();
                    //rs.close();
                    pstat.close();
                    con.close();
                           
                    session.setAttribute("message", "Updated successfully");
                     request.getRequestDispatcher("successful.jsp").forward(
                            request, response);
                 }
                   catch(Exception e)
                             {
                                  session.setAttribute("message", "Not Updated successfully");
                                  request.getRequestDispatcher("notsuccessful.jsp").forward(
                                 request, response);
                              }              
                                
             
                        
                                 
                 
  
%>
