<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
3 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%! Connection con=null;
    PreparedStatement pstat=null;
    ResultSet rs=null;
    String desig=null;
%>
<html>
	<head>
		<title> Education</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<script src="javascript/jquery.min.js"></script>
		<script src="javascript/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/mystyle.css">
		<script>
			$(document).ready(function(){
 			 // Add smooth scrolling to all links in navbar + footer link
 			 $(".navbar a, #footer a[href='#myCarousel']").on('click', function(event) {

 			 // Prevent default anchor click behavior
			  //event.preventDefault();

 			 // Store hash
 			 var hash = this.hash;

 			 // Using jQuery's animate() method to add smooth page scroll
			  // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
			  $('html, body').animate({
   			 scrollTop: $(hash).offset().top
  			}, 900, function(){

    			// Add hash (#) to URL when done scrolling (default click behavior)
    			window.location.hash = hash;
   				 });
  				});
				});
		</script>
                <script type="text/javascript">
                 function inform(){
                   alert("This site is still under maintenance. This course will be available within few days.");
                  }
                  function copydata() {
                       document.getElementById("new_name").value = document.getElementById("old_name").innerHTML;
                       document.getElementById("new_email").value= document.getElementById("old_email").innerHTML;
                       document.getElementById("new_ph").value=document.getElementById("old_ph").innerHTML;
                       document.getElementById("new_add").value=document.getElementById("old_add").innerHTML;
                       return true;
                  }
                   
                </script>
                <script src="javascript/formfilter.js"></script>
                <script src="javascript/formfilter1.js"></script>
               
	</head>
	<body>
            
            <%! String value,sql;%>
            <%
                Enumeration e = session.getAttributeNames();
                while (e.hasMoreElements()) 
                {
                    String name = (String)e.nextElement();
                    if(name.equals("userID"))
                    {
                        value = session.getAttribute(name).toString();
                    }
                }
            %>
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
                }
                catch(Exception ex)
                {
                    out.println(ex);
                }
            %>
                
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span> 
                                    </button>
				<a class="navbar-brand" href="#">Learning Is Fun!</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#about-us">ABOUT</a></li>
						<li><a href="#blog">Course</a></li>
						<li><a href="#contact">CONTACT</a></li>
						<li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                                        <%  out.print(value);%>
							<span class="caret"></span>
                                                    </a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="#" data-toggle="modal" data-target="#myModal1">About My Profile</a></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal2">Change Password</a></li>
							<li role="separator" class="divider"></li>
                                                        <li><a href="/EduPortal/jsp/logout.jsp">Logout</a>
                                                        </li> 
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

                                                 <%
                                                      try
                                                        {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                                                            sql = "select id,name,email,mobile from users_table where username=?";
                                                            pstat=con.prepareStatement(sql);
                                                            pstat.setString(1, session.getAttribute("userID").toString());
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
						<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-ok"></span> Ok
						</button>
						<p> <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#myModal4">Edit Details</a></p>
					</div>
				</div>
			</div>
		</div>
                <div class="modal fade" id="myModal4" role="dialog">
			<div class="modal-dialog">
			<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-check"></span> User Details</h4>
					</div>
					<div class="modal-body">
                                             <table style="width:100%;text-align: center;padding: 30px;">   
                                                 <%
                                                      try
                                                        {
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                                                            sql = "select name,email,mobile,address from users_table where username=?";
                                                            pstat=con.prepareStatement(sql);
                                                            pstat.setString(1, session.getAttribute("userID").toString());
                                                            rs=pstat.executeQuery();
                                                            while(rs.next())
                                                                {
                                                                    
                                                %>
                                                                    <tr>
                                                                        <td style="padding: 10px;">NAME</td>
                                                                        <td><div contenteditable="true" id="old_name"><%=rs.getString(1)%></div></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 10px;">EMAIL</td>
                                                                        <td><div contenteditale="true" id="old_email"><%=rs.getString(2)%></div></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 10px;">PHONE NO.</td>
                                                                        <td><div contenteditable="true" id="old_ph"><%=rs.getString(3)%></div></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 10px;">ADDRESS</td>
                                                                        <td><div contenteditable="true" id="old_add"><%=rs.getString(4)%></div></td>
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
						<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-ok"></span> Cancel
						</button>
                                            <form action="updatedetails.jsp" method="post" onsubmit="return copydata();">
                                                <input type="hidden" id="new_name" name="name">
                                                <input type="hidden" id="new_email" name="email">
                                                <input type="hidden" id="new_ph" name="phn">
                                                <input type="hidden" id="new_add" name="address"> 
                                                 <button type="submit" class="btn btn-danger btn-default pull-right"><span class="glyphicon glyphicon-ok"></span>Update Details
                                                
					            </button>
                                                <!--<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-ok"></span> Update Details
						</button>-->
                                            </form>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">
			<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-hand-down"></span> Change Password</h4>
					</div>
					<div class="modal-body">
                                            <form role="form" action="jsp/updatepsw.jsp" method="post" name="form_reg" onsubmit="return validateForm();">
							<div class="form-group">
								<input type="password" class="form-control"   name="passOld" placeholder="Old Password" maxlength="50">
							</div>
							<div class="form-group">
								<input type="password" class="form-control"  name="passNew" placeholder="New Password" maxlength="35">
							</div>
							<button type="submit" class="btn btn-block">Change Your Password
								<span class="glyphicon glyphicon-ok"></span>
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Carrol part-->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="picture/image1.jpg" alt="New York" style="width:100%;height:600" >
					<div class="carousel-caption">
						<h3>On Line Education Portal</h3>
						<p>Everybody can have it without paying any single penny</p>
					</div> 
				</div>

				<div class="item">
					<img src="picture/image2.jpeg" alt="Chicago"style="width:100%;height:600" >
					<div class="carousel-caption">
						<h3>Courses</h3>
						<p>We provide Engineering courses. But very soon other courses will be available.</p>
					</div> 
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 1st part--->
		<section id="about-us">
		<div class="container">
			<div class="text-center">
				<div class="col-sm-8 col-sm-offset-2">
					<h2>|| Why With Us? ||</h2>
					<p>We believe in the highest quality education, both online and in the classroom.
This web site has been created for learners and institutions that seek to transform themselves through cutting-edge technologies, innovative pedagogy and rigorous courses.
Through our institution, we present the best of higher education online, offering opportunities to anyone who wants to thrive, grow and achieve.
Our goals, however, go beyond offering courses and free content to the learners. We are committed to research that will allow us to understand how learners get trained, how technology can transform learning, and the ways faculty and professors employ to teach on campus and beyond.
As innovators and experimenters, we want to share what we discover. This platform is available as open-source. By conducting and publishing significant research on how learners get trained, we will empower and inspire educators around the world and promote success in Indian massive open online learning.
Our aim is to become a leading resource for learners by staying focused on the goals and principles set forth, when forming this online educational portal.</p>
				</div>
			</div>
			<div class="about-us">
				<div class="row text-center">
					<div class="col-sm-6 text-center">
						<h3>Why with us?</h3>
						<ul class="nav nav-tabs">
							<li class="active"><a href="#about" data-toggle="tab">About</a></li>
							<li><a href="#mission" data-toggle="tab">Mission</a></li>
							<li><a href="#community" data-toggle="tab">services</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="about">
								<div class="media">
									<img class="pull-left media-object" src="picture/image5.jpg" width=40% height=25% alt="about us">
									<div class="media-body">
										<p>This web site has been created for learners and institutions that seek to transform themselves through cutting edge technologies, innovative pedagogy and rigorous courses. Through our institution, we present the best of higher education online, offering opportunities to anyone who wants to thrive, grow and achieve.</p>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="mission">
								<div class="media">
									<img class="pull-left media-object" src="picture/mission.png" alt="about us">
									<div class="media-body">
										<p>Our only mission to do something new and better than other.Our aim is to become a leading resource for learners by staying focused on the goals and principles set forth, when forming this portal.</p>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="community">
								<div class="media">
									<img class="pull-left media-object" src="picture/services.png" alt="about us">
									<div class="media-body">
										<p>As innovators and experimenters, we want to share what we discover. This platform is available as open-source. We work hard to provide best to our students across the globe. This web site is regularly updated and more features will be added soon.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-6 text-center">
						<img src="picture/image4.jpg" class="img-rounded" alt="Cinque Terre" width="350" height="300">
					</div>
				</div>
			</div>
		</div>
		</section>
		<!-- 2nd part-->
		<section id="blog">
		<div class="container">
			<div class="row text-center clearfix">
				<div class="col-sm-8 col-sm-offset-2">
					<h2 class="title-one">|| OUR COURSES ||</h2>
					<p class="blog-heading">Free Online Tutorials & Courses</p>
				</div>
			</div>
			<div class="row text-center">
                            <%
                                  try
                                       {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                                            sql = "select c_id,c_name,description from course_table";
                                            pstat=con.prepareStatement(sql);
                                            rs=pstat.executeQuery();
                                            int counter=1;
                                            while(rs.next())
                                               {
                                                   
                            %>
                            
				<div class="col-sm-4">
					<div class="single-blog">
						<img src="picture/<%=rs.getString(2)%>.jpg" alt="" />
                                                <h2 style="text-transform: uppercase;"><%=rs.getString(2)%></h2>
						<div class="blog-content">
							<p><%=rs.getString(3)%></p>
						</div>
                                                <%session.setAttribute(rs.getString(1), rs.getString(2));%>
                                                <form action="SessioSetAttribute" method="post" >
                                                    <input type="hidden" value="<%=rs.getString(2)%>" name="course"></input>
                                                    <button class="btn btn-primary">Goto Course</button>
                                                    
                                                </form>
                                                
						 
					</div>
				</div>
                                                <%
                                                            counter++;
                                                                }
                                                            
                                                            rs.close();
                                                            pstat.close();
                                                            con.close();
            
                                                        }catch(Exception e1)
                                                        {
                                                            out.println(e1);
                                                        }
                                                   %>
				<!--<div class="col-sm-4">
					<div class="single-blog">
						<img src="picture/DataStructure.jpg" alt="" />
						<h2>DATA STRUCTURE</h2>
						<div class="blog-content">
								<p>In computer science, a data structure is a particular way of organizing data in a computer so that it can be used efficiently.</p>
						</div>
						<a href="#blog" class="btn btn-primary" onclick="inform()">Goto Course</a>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="single-blog">
						<img src="picture/Networking.jpg" alt="" />
						<h2>NETWORKING</h2>
						<div class="blog-content">
							<p>A computer network or data network is a telecommunications network which allows computers to exchange data.</p>
						</div>
						<a href="#blog" class="btn btn-primary" onclick="inform()">Goto Course</a>
					</div>
				</div>-->
			</div>
		<div>
		</section>
		
		<!-- 3rd part -->
		<section id="contact">
			<div class="container" id="contact">
				<div class="col-sm-8 col-sm-offset-2">
					<h2 class="title-one text-center">|| Contact ||</h2>
					<p class="blog-heading text-center"><em>We love our leaners!</em></p>
				</div>
				<div class="row text-center">
					<div class="col-sm-6">
						<div class="contact-details">
							<p>Leaner? Drop a note.</p>
							<p><span class="glyphicon glyphicon-map-marker"></span>Kalyani, Nadia, WB</p>
							<p><span class="glyphicon glyphicon-phone"></span>Phone: +91 0123456789</p>
							<p><span class="glyphicon glyphicon-envelope"></span>Email: mail@mail.com</p> 
						</div>
					</div>
                                        <%
                                            if(desig.equals("I"))
                                            {
                                        %>   
                                    <div class="col-sm-6">
                                        <div class="contact-details" style="overflow-y: scroll">
                                <%
                                        try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/souvikdb","root","Souvik@8013170910");
                                        pstat=con.prepareStatement("select name,email,message from contact_ask ;");
                                        rs=pstat.executeQuery();
                                        while(rs.next())
                                        {
                                %>
                                            <h5><%out.println(rs.getString(1));%></h5>
                                                <h5> <span class="glyphicon glyphicon-email"> </span> 
                                                    <% out.println(rs.getString(2)); %>
                                                </h5>
                                                    <p> <i> <% out.println(rs.getString(3)); %> </i> </p>
                                            
                                        
                                <% 
                                        }     
                                        pstat.close();
                                        rs.close();
                                        con.close();
                                        }
                                        catch(Exception er)
                                        {
                                         out.println("Error "+er);
                                        }
                                %>
                                        </div>
                                    </div>
                                <%
                                    }
                                %>
				</div>
			</div>
		</section>
		<!-- footer part-->
		<section id="footer">
			<div class="text-center">
				<a class="up-arrow" href="#myCarousel" data-toggle="tooltip" title="TO TOP">
					<span class="glyphicon glyphicon-chevron-up"></span>
				</a><br><br>
                                        <p>Copyright &copy; 2016 - <a href="http://www.jiscollege.ac.in/old_version/dept/cse/">VRS<sup>3</sup></a> | All Rights Reserved</p>
                                        <%
   // Set refresh, autoload time as 5 seconds
   //response.setIntHeader("Refresh", 1);
   // Get current time
   Calendar calendar = new GregorianCalendar();
   String am_pm;
   int hour = calendar.get(Calendar.HOUR);
   int minute = calendar.get(Calendar.MINUTE);
   int second = calendar.get(Calendar.SECOND);
   if(calendar.get(Calendar.AM_PM) == 0)
      am_pm = "AM";
   else
      am_pm = "PM";
   String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
   out.println("Current Time: " + CT + "\n");
%>
			</div>
                         
		</section>
                
	</body>
</html>