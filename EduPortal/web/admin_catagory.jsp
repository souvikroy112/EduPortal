<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
3 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
				<a class="navbar-brand" href="#">Learning Is Fun!</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav navbar-right">
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
		<!-- 1st part--->
                 <section id="admin">
                     <div class="admincatgory">
                        <div class="modal-header">
                            <h4><span class="glyphicon glyphicon-log-in"></span> Catagory</h4>
                        </div>
                        <div class="modal-body">
                                <form role="form" action="/EduPortal/admin_lecture.jsp" method="post"> 
                                	<button type="submit" class="btn btn-block">lectures        
                                        </button>
                                </form>
                                <form role="form" action="/EduPortal/admin_notes.jsp" method="post"> 
                                    <button type="submit" class="btn btn-block">notes        
                                    </button>
                                </form>
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