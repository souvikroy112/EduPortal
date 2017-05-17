<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%!
        Connection con=null;
        PreparedStatement pstat=null;
        ResultSet rs=null;
        String name,email,mobile,address,username,password,sql;
%>
<%
    try
        {
            name= request.getParameter("Name");
            email=request.getParameter("Email");
            mobile=request.getParameter("Mobile");
            address=request.getParameter("Address");
            username=request.getParameter("Username");
            password=request.getParameter("Password");
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
            //out.println("Connection established");
            sql = "INSERT INTO users_table(name,email,mobile,address,username,password) VALUES (?,?,?,?,?,?)";
            pstat=con.prepareStatement(sql);
            pstat.setString(1,name);
            pstat.setString(2,email);
            pstat.setString(3,mobile);
            pstat.setString(4,address);
            pstat.setString(5,username);
            pstat.setString(6,password);
            pstat.executeUpdate();
            out.println("Inserted records into the table...");

            //rs.close();
            pstat.close();
            con.close();
            session.setAttribute("message", "Registered successfully");
            request.getRequestDispatcher("successful.jsp").forward(
                request, response);
            session.invalidate();
            
        }catch(Exception e)
        {
            session.setAttribute("message", "Not successfully registered");
            request.getRequestDispatcher("notsuccessful.jsp").forward(
                request, response);
            session.invalidate();
        }
   %>