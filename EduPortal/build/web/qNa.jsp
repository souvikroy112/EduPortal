<%-- 
    Document   : qNa
    Created on : May 7, 2016, 1:26:49 PM
    Author     : SOUVIK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>

<html>
	<head>
		<title>Courses</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<script src="javascript/jquery.min.js"></script>
		<script src="javascript/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/mystyle_activity.css">
               
                 
                
	</head>
	<body>
	<!--first part-->
        <%! String value;
            boolean flag=false;
        %>
        <%
            Enumeration e = session.getAttributeNames();
            while (e.hasMoreElements()) 
            {
                String name = (String)e.nextElement();
                if(name.equals("userID"))
               {
                    value = session.getAttribute(name).toString();
                    flag=true;
                    break;
               }
            }
        %>
        <% 
            if(flag)
            {
                
        %>
	<section id="first">
		<div class="container">
			<div class="row clearfix">
				<div class="col-sm-6 text-center">
					<img src="picture/<%=session.getAttribute("course")%>.jpg" alt="Cinque Terre" width="350" height="250">
				</div>
				<div class="col-sm-6">
					<h1 style="text-transform: uppercase;"><%=session.getAttribute("course")%></h1>
				</div>
			</div>
		</div>
	</section>	
	<!--navigation bottom-->
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div  class="col-sm-12">
					<ul class="nav navbar-nav navbar-left">
						<li><a href="main_activity.jsp">OVERVIEW</a></li>
						<li><a href="course_content.jsp">COURSE CONTENT</a></li>
						<li><a href="qNa.jsp">COMMENTS</a></li>
						<li><a href="announcement.jsp">ANNOUNCEMENT</a></li>
						<li><a href="note.jsp">NOTES</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!--navigator top-->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
				<a class="navbar-brand" href="#">Learning Is Fun!</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="profile.jsp">HOME</a></li>
						<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                                <% out.print(value); %>
						<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal" data-target="#myModal1">About My Profile</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="/EduPortal/jsp/logout.jsp">Logout</a></li> 
						</ul>
					</li>
					</ul>
				</div>
			</div>
		</nav>
	<!--content-->
        <div class="modal fade" id="myModal1" role="dialog">
			<div class="modal-dialog">
			<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-check"></span> User Details</h4>
					</div>
					<div class="modal-body">
                                            <table style="width:100%;text-align: center;padding: 30px;">
                                                <%!
                                                     String sql;
                                                 %>
                                                 
                                                 <%
                                                      try
                                                        {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                                                            sql = "select id,name,email,mobile from users_table where username=?";
                                                            ps=con.prepareStatement(sql);
                                                            ps.setString(1,value);
                                                            rs=ps.executeQuery();
                                                            while(rs.next())
                                                                {
                                                              
                                                                    %>
                                                                    <tr>
                                                                        <td style="padding: 10px;">ID</td>
                                                                        <td><%=rs.getInt(1)%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 10px;">NAME</td>
                                                                        <td><%=rs.getString(2)%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 10px;">EMAIL</td>
                                                                        <td><%=rs.getString(3)%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 10px;">PHONE NO.</td>
                                                                        <td><%=rs.getString(4)%></td>
                                                                    </tr>
                                                                    <%
                                                                    
                                                                }
                                                            rs.close();
                                                            ps.close();
                                                            con.close();
            
                                                        }catch(Exception e1)
                                                        {
                                                            out.println(e1);
                                                        }
                                                   %>
                                            </table>
                                            
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-ok"></span> OK
						</button>
					</div>
				</div>
			</div>
		</div>
		 <section id="q_a">
			<div class="q_a">
				<div class="container">
                                    <h3>RECENT POSTS</h3>
                                    	<div class="jumbotron" style=" height:300px; overflow-y: scroll;">
                                <%! 
                                        Connection con=null;
                                        PreparedStatement ps=null;
                                        ResultSet rs=null;
                                        String sql1,sessiondata;
                                %>
                                
                                    
                                <% 
                                        try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                                        sessiondata=session.getAttribute("course").toString();
                                        sql1="select username,date_time,comments from users_table natural join comment_table natural join course_table where c_name='"+sessiondata+"' order by date_time desc";
                                        ps=con.prepareStatement(sql1);
                                        rs=ps.executeQuery();
                                %>
                                
                                <%
                                        while(rs.next())
                                        {
                                %>      
                                        <div class="media">
                                            <a class="pull-left" href="#">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading"><span style="color: red"><% out.println(rs.getString(1));%></span>
                                                     <span class="glyphicon glyphicon-time"> </span> 
                                                    <small><% out.println(rs.getString(2)); %></small>
                                                </h4>
                                                    <p> <i> <% out.println(rs.getString(3)); %> </i> </p>
                                            </div>
                                        </div>
                                <% 
                                        }     
                                        ps.close();
                                        rs.close();
                                        con.close();
                                        }
                                        catch(Exception er)
                                        {
                                         out.println("Error "+er);
                                        }
                                %>
                                </div>
                                <hr>

                                <h4>Leave a Comment:</h4>
                                <form role="form" action="jsp/post.jsp" method="post">
                                <div class="form-group">
                                <textarea name="comments" class="form-control" rows="3" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-block">Submit</button>
                                </form>
                                </div>
			</div>
		 </section>
		 <section id="footer">
			<div class="text-center">
				<a class="up-arrow" href="#myCarousel" data-toggle="tooltip" title="TO TOP">
					<span class="glyphicon glyphicon-chevron-up"></span>
				</a><br><br>
				<p>Copyright &copy; 2014 - <a href="http://www.jiscollege.ac.in/old_version/dept/cse/">VRS<sup>3</sup></a> | All Rights Reserved</p> 
			</div>
		</section>
                                <%
                                    }
                                    else
                                    out.println("You Need To Login To View/Post Comments");
                                %>
	</body>
</html>
