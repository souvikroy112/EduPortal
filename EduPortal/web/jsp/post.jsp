<%-- 
    Document   : post
    Created on : May 11, 2016, 1:17:51 PM
    Author     : SOUVIK
--%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courses</title>
    </head>
    <body>
        <%! 
            Connection con=null;
            PreparedStatement ps=null;
            ResultSet rs=null;
            String value,course_id;
            int stuid;
        %>
        <%
            Enumeration e = session.getAttributeNames();
            while (e.hasMoreElements()) 
            {
                String name = (String)e.nextElement();
                if(name.equals("userID"))
                {
                    value = session.getAttribute(name).toString();
                    break;
                }
            }
        %>
        <%
            try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
            ps=con.prepareStatement("select id from users_table where username=?");
            ps.setString(1, value);
            rs=ps.executeQuery();
            while(rs.next())
            {
               stuid=rs.getInt(1);
            }
            ps=con.prepareStatement("select c_id from course_table where c_name=?");
            ps.setString(1,session.getAttribute("course").toString());
            rs=ps.executeQuery();
            while(rs.next())
            {
               course_id=rs.getString(1);
            }
            ps=con.prepareStatement("insert into comment_table(id,comments,c_id)"
                    + "values(?,?,?)");
            ps.setInt(1, stuid);
            ps.setString(2, request.getParameter("comments"));
            ps.setString(3, course_id);
            ps.executeUpdate();
            }
            catch(Exception err)
            {
                out.println(err);
            }
            response.sendRedirect("/EduPortal/qNa.jsp");
        %>
    </body>
</html>
