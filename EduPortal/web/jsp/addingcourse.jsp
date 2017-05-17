<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%!
        Connection con=null;
        PreparedStatement pstat=null;
        ResultSet rs=null;
        String course_id,course_name,dept,instructor,description,sql;
%>
<%
    try
        {
            course_id= request.getParameter("course_id");
            course_name=request.getParameter("course_name");
            dept=request.getParameter("course_dept");
            instructor=request.getParameter("instructor");
            description=request.getParameter("description");
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
            //out.println("Connection established");
            sql = "INSERT INTO course_table VALUES (?,?,?,?,?)";
            pstat=con.prepareStatement(sql);
            pstat.setString(1,course_id);
            pstat.setString(2,course_name);
            pstat.setString(3,dept);
            pstat.setString(4,instructor);
            pstat.setString(5,description);
            pstat.executeUpdate();
            //out.println("Inserted records into the table...");

            //rs.close();
            pstat.close();
            con.close();
            session.setAttribute("message", "Registered successfully");
            request.getRequestDispatcher("successful.jsp").forward(
                request, response);
           
            
        }catch(Exception e)
        {
            session.setAttribute("message", "Not successfully registered");
            request.getRequestDispatcher("notsuccessful.jsp").forward(
                request, response);
            
        }
   %>