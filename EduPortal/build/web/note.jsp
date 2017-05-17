<%--
    Document   : osnote
    Created on : May 12, 2016, 6:30:19 PM
    Author     : SOUVIK
--%>

<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
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
                <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    </head>
    <body>
        <%! Connection con=null;
            PreparedStatement pstat=null;
            ResultSet rs=null;
            String desig=null;
            String value;
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
						<li><a href="#">NOTES</a></li>
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
                                                    <%
                                                    Enumeration e = session.getAttributeNames();
                                                    while (e.hasMoreElements()) 
                                                    {
                                                            String name = (String)e.nextElement();
                                                            if(name.equals("userID"))
                                                            {
                                                                value = session.getAttribute(name).toString();
                                                                out.print(value);
                                                                break;
                                                            }
                                                    }
                                                    %>
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
                                                            pstat=con.prepareStatement(sql);
                                                            pstat.setString(1, value);
                                                            rs=pstat.executeQuery();
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
                                                            pstat.close();
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
        <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                    pstat=con.prepareStatement("select designation from users_table where username=?");
                    pstat.setString(1, session.getAttribute("userID").toString());
                    rs=pstat.executeQuery();
                    while(rs.next())
                    {
                        desig=rs.getString(1);
                    }
                    pstat.close();
                    rs.close();
                    con.close();
                }
                catch(Exception ex)
                {
                    out.println(ex);
                }
        %>
        
        <section id="q_a">
			<div class="q_a">
				<div class="container">
                                    <h3>Notes</h3><br><br>
                                        <div class="col-sm-12" style="height: 500px;overflow-y: scroll;">
						  
                                                        <div class="course_content">
                                                            <div class="panel panel-default">
                                                            <!-- Default panel contents -->
                                                                <div class="panel-heading text-center">
                                                                     <h5>Notes</h5>
                                                                </div>
                                                                <!-- List group -->
                                                                <ul class="list-group">
                                                                    <% try{
                                                                        String sourceDirectory = getServletContext().getRealPath("")+ File.separator+"notes"+File.separator+session.getAttribute("course")+File.separator;
                                                                        File f = new File(sourceDirectory);
                                                                        String [] fileNames = f.list();
                                                                        File [] fileObjects= f.listFiles();
                                                                        Arrays.sort(fileNames);
                                                                        Arrays.sort(fileObjects);
                                                                        for (int i = 0; i < fileObjects.length; i++) 
                                                                        {
                                                                            if(!fileObjects[i].isDirectory())
                                                                            {                                      
                                                                     %>
                                                                    <li class="list-group-item"><a href="<%="http://localhost:8080/EduPortal/"+"notes/"+session.getAttribute("course")+"/"+fileNames[i]%>" target="iframe_a"><span class="glyphicon glyphicon-ok img-rounded"></span><%=(i+1)+" "%><%= fileNames[i]%></a></li>
                                                                    
                                                                     <%
                                                                            }
                                                                         }
                                                                    }catch(Exception e3)
                                                                    {%>
                                                                    <h1 style="padding-left: 100px">Notes yet to be uploaded...</h1>
                                                                    <%}
                                                                      %>
                                                                     
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        
                                        </div>
              
                
                                </div>
                        </div>
        </section>
        </section>
		 <section id="footer">
			<div class="text-center">
				<a class="up-arrow" href="#myCarousel" data-toggle="tooltip" title="TO TOP">
					<span class="glyphicon glyphicon-chevron-up"></span>
				</a><br><br>
				<p>Copyright &copy; 2016 - <a href="http://www.jiscollege.ac.in/old_version/dept/cse/">VRS<sup>3</sup></a> | All Rights Reserved</p> 
			</div>
		</section>                       
    </body>
</html>
