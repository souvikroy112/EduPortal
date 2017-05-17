<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<%!
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String username_client,password_client,sql,admin_designation;
        boolean flag;
        int id;
%>
<%
    try
        {
            flag=false;
            username_client=request.getParameter("adminuser");
            password_client=request.getParameter("adminpassword");
            admin_designation=request.getParameter("designation");
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
            //out.println("Connection established");
            sql = "select id,username,password,designation from users_table";
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next())
            {
                if(rs.getString(2).equals(username_client) && rs.getString(3).equals(password_client) && rs.getString(4).equals(admin_designation))
                {
                   id=rs.getInt(1);
                   flag=true;
                }
            }
            if(flag==true)
            {
                 
                 // Get session creation time.
                Date createTime = new Date(session.getCreationTime());
                // Get last access time of this web page.
                Date lastAccessTime = new Date(session.getLastAccessedTime());
                String userIDKey = new String("userID");
                String userID = new String(request.getParameter("adminuser"));
                String Idkey=new String("Id");
                String Id=new String(""+id);
                // Check if this is new comer on your web page.
                if (session.isNew())
                {
                    session.setAttribute(userIDKey, userID);
                    session.setAttribute(Idkey,Id);
                    
                } 
                userID = (String)session.getAttribute(userIDKey);
                response.sendRedirect("/EduPortal/admin_profile.jsp");
            }
            else
            {
                session.setAttribute("message", "incorrect username or password");
                request.getRequestDispatcher("notsuccessful.jsp").forward(
                request, response);
                session.invalidate();
            }

            rs.close();
            ps.close();
            con.close();
            
        }catch(Exception e)
        {
            out.println(e);
        }
   %>