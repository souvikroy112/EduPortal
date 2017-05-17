<!DOCTYPE html >
<%
    if (!session.isNew())
       {
            response.sendRedirect("profile.jsp");
       }
    else
    {
        session.invalidate();
    }
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
                    <script
                        src="http://maps.googleapis.com/maps/api/js">
                         
                    </script>

                    <script>
                    function initialize()
                    {
                        var mapOpt = {
                             center:new google.maps.LatLng(22.9596,88.4473),
                             zoom:18,
                              mapTypeId:google.maps.MapTypeId.ROADMAP
  };
var map=new google.maps.Map(document.getElementById("googleMap"),mapOpt);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
		<script>
			$(document).ready(function(){
 			 // Add smooth scrolling to all links in navbar + footer link
 			 $(".navbar a, #footer a[href='#myCarousel']").on('click', function(event) {

 			 // Prevent default anchor click behavior
			  event.preventDefault();

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
                    function greeting(){
                    alert("Thank you. Your message is stored in our database. We will reply to you as early as possible.");
            }
        </script>
                <script src="javascript/formfilter.js"></script>
                <script src="javascript/formfilter1.js"></script>
	</head>
	<body>
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
						<li><a href="#" data-toggle="modal" data-target="#myModal1">LOG IN</a></li>
						<li><a href="#" data-toggle="modal" data-target="#myModal2">REGISTER</a></li>
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
						<h4><span class="glyphicon glyphicon-log-in"></span> Log In</h4>
					</div>
					<div class="modal-body">
                                             
                        <form role="form" action="jsp/login.jsp" method="post" name="form_login" onsubmit="return validateClient();">
							<div class="form-group">
								<input type="name" class="form-control" id="username_login" autocomplete="off" name="Username" placeholder="Username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password_login" name="Password" placeholder="Password" >
							</div>
							<button type="submit" class="btn btn-block">Log In 
								<span class="glyphicon glyphicon-ok"></span>
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						<p>New User? <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#myModal2">Register</a></p>
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
						<h4><span class="glyphicon glyphicon-hand-down"></span> Register</h4>
					</div>
					<div class="modal-body">
                        <form role="form" action="jsp/Registration.jsp" method="post" name="form_reg" onsubmit="return validateForm();">
							<div class="form-group">
								<input type="name" class="form-control" id="name_reg" name="Name" placeholder="Name" maxlength="50">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="email_reg" name="Email" placeholder="Email" maxlength="35">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="mobile_reg" name="Mobile" maxlength="10" placeholder="Mobile No.">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="address_reg" name="Address" maxlength="100" placeholder="Address">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="username_reg" name="Username" maxlength="35" placeholder="Username">
							</div>
							<div class="form-group">
								<input type="password" class="form-control" id="password_reg" name="Password" maxlength="35" placeholder="Password">
							</div>
							<button type="submit" class="btn btn-block">Register
								<span class="glyphicon glyphicon-ok"></span>
							</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-danger pull-left" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> Cancel
						</button>
						<p>Already registered? <a href="#" data-dismiss="modal" data-toggle="modal" data-target="#myModal1">Login</a></p>
					</div>
				</div>
			</div>
		</div>
		<!-- Carousel part-->
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
						<h3>Online Education Portal</h3>
						<p>Everybody can learn without paying any single penny</p>
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
						<h3>About us?</h3>
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
				<div class="col-sm-4">
					<div class="single-blog">
						<img src="picture/operating system.jpg" alt="" />
						<h2>OPERATING SYSTEM</h2>
						<div class="blog-content">
							<p>An operating system (OS) is system software that manages computer hardware and software resources and provides common services for computer programs.</p>
						</div>
						<a href="#" class="btn btn-primary"data-toggle="modal" data-target="#myModal1">View Course</a>
					</div>
				</div>
				<div class="col-sm-4">
                                    <div class="single-blog">
						<img src="picture/data structure.jpg" alt="" />
						<h2>DATA STRUCTURE</h2>
						<div class="blog-content">
						<p>In computer science, a data structure is a particular way of organizing data in a computer so that it can be used efficiently.</p>
						</div>
						<a href="#" class="btn btn-primary"data-toggle="modal" data-target="#myModal1">View Course</a>
                                    </div>
				</div>
				<div class="col-sm-4">
					<div class="single-blog">
						<img src="picture/networking.jpg" alt="" />
						<h2>NETWORKING</h2>
						<div class="blog-content">
							<p>A computer network or data network is a telecommunications network which allows computers to exchange data.</p>
						</div>
						<a href="#" class="btn btn-primary"data-toggle="modal" data-target="#myModal1">View Course</a>
					</div>
				</div>
			</div>
			</div>
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
					<div class="col-sm-6">
						<div class="single-form-section">
                            <form id="contact-form" class="contact" name="contact_form" method="post" action="jsp/send_mail.jsp" onsubmit="greeting()">
                                                        <h3>  <p style="color: purple"> Have a question? Ask us.</p> </h3>
								<div class="form-group">
									<input type="text" name="name" class="form-control name-field" required="required" placeholder="Your Name">
								</div>
								<div class="form-group">
									<input type="email" name="email" class="form-control mail-field" required="required" placeholder="Your Email">
								</div> 
								<div class="form-group">
									<textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Message"></textarea>
								</div> 
								<div class="form-group">
									<button type="submit" class="btn btn-primary">Send</button>
								</div>
							</form>
						</div>
					</div>
				</div>
                                <div class="row text-center">
                                    <div class="col-sm-12">
                                        <div id="googleMap" style="height:380px;"></div>
                                        
                                    </div>
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
			</div>
		</section>
	</body>
</html>