<%-- 
    Document   : course_content
    Created on : May 11, 2016, 7:13:36 PM
    Author     : SOUVIK
--%>
<%@page import="java.util.*,java.sql.*,java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <script type="text/javascript">
                   function playvid(a)
                    {
                        var nextVideo = a.getAttribute('value');
                        var videoPlayer = document.getElementById('video_a');
                        videoPlayer.src = nextVideo;
                    }
                                  </script>
                                  <script>
    $(document).ready(function() {
        function disableBack() { window.history.forward() }

        window.onload = disableBack();
        window.onpageshow = function(evt) { if (evt.persisted) disableBack() }
    });
</script>
                 
	</head>
	<body>
	<!--first part-->
        <%!
            Connection con=null;
            PreparedStatement ps=null;
            ResultSet rs=null;
            String value=null;
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
                                                    <%
                                                    Enumeration e = session.getAttributeNames();
                                                    while (e.hasMoreElements()) 
                                                    {
                                                            String name = (String)e.nextElement();
                                                            if(name.equals("userID"))
                                                            {
                                                                value = session.getAttribute(name).toString();
                                                                out.print(value);
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
                                                            ps.setString(1, value);
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
        <hr>
        <h3>
            <p style="margin-left: 5em;"> Hello Students , please refer to the following videos</p>
        </h3>
        <hr>
        
        
        
                 <div class="row  ">
					<div class="col-sm-6">
						<div class="contact-details">
							<!--<iframe style="margin-left: 10ex;" width="500px" height="500px" src="https://www.youtube.com/embed/zWg7U0OEAoE?list=PL5E96052C98F478A1" name="iframe_a" frameborder="0"  >
            
                                                        </ifame>-->
                                                        <video style="margin-left: 10ex;border: 1px #ffffff" width="500px" width="500px" height="500px" id="video_a" controls autoplay>
                                                    
                                                </video>
  
  
						</div>
					</div>
                     <div class="col-sm-6" style="width: 500px;height: 500px;overflow-y: scroll;">
						  
                                                        <div class="course_content">
                                                            <div class="panel panel-default">
                                                            <!-- Default panel contents -->
                                                                <div class="panel-heading text-center">
                                                                     <h5>Lectures</h5>
                                                                </div>
                                                                <!-- List group -->
                                                                <ul class="list-group">
                                                                    <% try{
                                                                        String sourceDirectory = getServletContext().getRealPath("")+ File.separator+"lecture"+File.separator+session.getAttribute("course")+File.separator;
                                                                        File f = new File(sourceDirectory);
                                                                        String [] fileNames = f.list();
                                                                        File [] fileObjects= f.listFiles();
                                                                        Arrays.sort(fileNames);
                                                                        Arrays.sort(fileObjects);
                                                                        for (int i = 0; i < fileObjects.length; i++) 
                                                                        {
                                                                            if(!fileObjects[i].isDirectory())
                                                                            {
                                                                                String folder=session.getAttribute("course").toString();
                                                                     %>
                                                                    <li class="list-group-item"><a href="#video_a" value="<%="http://localhost:8080/EduPortal/"+"lecture/"+session.getAttribute("course")+"/"+fileNames[i]%>"  onclick="playvid(this);"><span class="glyphicon glyphicon-ok img-rounded"></span><%=(i+1)+" "%><%= fileNames[i]%></a></li>
                                                                    
                                                                     <%
                                                                            }
                                                                         }
                                                                        
                                                                    }catch(Exception e2)
                                                                    {%>
                                                                    <h3 style="padding-left: 10px">Videos yet to be uploaded...</h3>
                                                                    <%}
                                                                      %>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        
                                                    </div>
				
                                                </div>
                                            </section> 
					</div>
				</div>
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
