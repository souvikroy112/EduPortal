package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.sql.*;

public final class admin_005fprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

 Connection con=null;
    PreparedStatement pstat=null;
    ResultSet rs=null;
    String desig=null;

 String value,sql;
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n");
      out.write("3 \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\t<head>\n");
      out.write("\t\t<title> Education</title>\n");
      out.write("\t\t<meta charset=\"utf-8\">\n");
      out.write("\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("\t\t<meta name=\"keywords\" content=\"Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio\" /> \n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("\t\t<script src=\"javascript/jquery.min.js\"></script>\n");
      out.write("\t\t<script src=\"javascript/bootstrap.min.js\"></script>\n");
      out.write("\t\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/mystyle.css\">\n");
      out.write("                <link rel=\"stylesheet\" type=\"text/css\" href=\"css/mystyle_activity.css\">\n");
      out.write("\t\t<script>\n");
      out.write("\t\t\t$(document).ready(function(){\n");
      out.write(" \t\t\t // Add smooth scrolling to all links in navbar + footer link\n");
      out.write(" \t\t\t $(\".navbar a, #footer a[href='#myCarousel']\").on('click', function(event) {\n");
      out.write("\n");
      out.write(" \t\t\t // Prevent default anchor click behavior\n");
      out.write("\t\t\t  //event.preventDefault();\n");
      out.write("\n");
      out.write(" \t\t\t // Store hash\n");
      out.write(" \t\t\t var hash = this.hash;\n");
      out.write("\n");
      out.write(" \t\t\t // Using jQuery's animate() method to add smooth page scroll\n");
      out.write("\t\t\t  // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area\n");
      out.write("\t\t\t  $('html, body').animate({\n");
      out.write("   \t\t\t scrollTop: $(hash).offset().top\n");
      out.write("  \t\t\t}, 900, function(){\n");
      out.write("\n");
      out.write("    \t\t\t// Add hash (#) to URL when done scrolling (default click behavior)\n");
      out.write("    \t\t\twindow.location.hash = hash;\n");
      out.write("   \t\t\t\t });\n");
      out.write("  \t\t\t\t});\n");
      out.write("\t\t\t\t});\n");
      out.write("\t\t</script>\n");
      out.write("                <script type=\"text/javascript\">\n");
      out.write("                 function inform(){\n");
      out.write("                   alert(\"This site is still under maintenance. This course will be available within few days.\");\n");
      out.write("                  }\n");
      out.write("                  function copydata() {\n");
      out.write("                       document.getElementById(\"new_name\").value = document.getElementById(\"old_name\").innerHTML;\n");
      out.write("                       document.getElementById(\"new_email\").value= document.getElementById(\"old_email\").innerHTML;\n");
      out.write("                       document.getElementById(\"new_ph\").value=document.getElementById(\"old_ph\").innerHTML;\n");
      out.write("                       document.getElementById(\"new_add\").value=document.getElementById(\"old_add\").innerHTML;\n");
      out.write("                       return true;\n");
      out.write("                  }\n");
      out.write("                </script>\n");
      out.write("                <script src=\"javascript/formfilter.js\"></script>\n");
      out.write("                <script src=\"javascript/formfilter1.js\"></script>\n");
      out.write("\t</head>\n");
      out.write("\t<body>\n");
      out.write("            ");
      out.write("\n");
      out.write("            ");

                Enumeration e = session.getAttributeNames();
                while (e.hasMoreElements()) 
                {
                    String name = (String)e.nextElement();
                    if(name.equals("userID"))
                    {
                        value = session.getAttribute(name).toString();
                    }
                }
            
      out.write("\n");
      out.write("            ");

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
            
      out.write("\n");
      out.write("                \n");
      out.write("\t\t<nav class=\"navbar navbar-default navbar-fixed-top\">\n");
      out.write("\t\t\t<div class=\"container-fluid\">\n");
      out.write("\t\t\t\t<div class=\"navbar-header\">\n");
      out.write("\t\t\t\t<a class=\"navbar-brand\" href=\"#\">Learning Is Fun!</a>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"collapse navbar-collapse\" id=\"myNavbar\">\n");
      out.write("\t\t\t\t\t<ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("\t\t\t\t\t\t<li class=\"dropdown\">\n");
      out.write("                                                    <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">\n");
      out.write("                                                        ");
  out.print(value);
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<span class=\"caret\"></span>\n");
      out.write("                                                    </a>\n");
      out.write("                                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                                        <li><a href=\"#\" data-toggle=\"modal\" data-target=\"#myModal1\">About My Profile</a></li>\n");
      out.write("\t\t\t\t\t\t\t<li><a href=\"#\" data-toggle=\"modal\" data-target=\"#myModal2\">Change Password</a></li>\n");
      out.write("\t\t\t\t\t\t\t<li role=\"separator\" class=\"divider\"></li>\n");
      out.write("                                                        <li><a href=\"/EduPortal/jsp/logout.jsp\">Logout</a>\n");
      out.write("                                                        </li> \n");
      out.write("                                                    </ul>\n");
      out.write("                                                </li>\n");
      out.write("\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t\t<div class=\"modal fade\" id=\"myModal1\" role=\"dialog\">\n");
      out.write("\t\t\t<div class=\"modal-dialog\">\n");
      out.write("\t\t\t<!-- Modal content-->\n");
      out.write("\t\t\t\t<div class=\"modal-content\">\n");
      out.write("\t\t\t\t\t<div class=\"modal-header\">\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("\t\t\t\t\t\t<h4><span class=\"glyphicon glyphicon-check\"></span> User Details</h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"modal-body\">\n");
      out.write("                                            <table style=\"width:100%;text-align: center;padding: 30px;\">\n");
      out.write("\n");
      out.write("                                                 ");

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
                                                                    
                                                
      out.write("\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">ID</td>\n");
      out.write("                                                                        <td>");
      out.print(rs.getInt(1));
      out.write("</td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">NAME</td>\n");
      out.write("                                                                        <td>");
      out.print(rs.getString(2));
      out.write("</td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">EMAIL</td>\n");
      out.write("                                                                        <td>");
      out.print(rs.getString(3));
      out.write("</td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">PHONE NO.</td>\n");
      out.write("                                                                        <td>");
      out.print(rs.getString(4));
      out.write("</td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    ");

                                                                }
                                                            rs.close();
                                                            pstat.close();
                                                            con.close();
            
                                                        }catch(Exception e1)
                                                        {
                                                            out.println(e1);
                                                        }
                                                   
      out.write("\n");
      out.write("                                            </table>\n");
      out.write("                                            \n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"modal-footer\">\n");
      out.write("\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-danger btn-default pull-left\" data-dismiss=\"modal\">\n");
      out.write("\t\t\t\t\t\t\t<span class=\"glyphicon glyphicon-ok\"></span> Ok\n");
      out.write("\t\t\t\t\t\t</button>\n");
      out.write("\t\t\t\t\t\t<p> <a href=\"#\" data-dismiss=\"modal\" data-toggle=\"modal\" data-target=\"#myModal4\">Edit Details</a></p>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("                <div class=\"modal fade\" id=\"myModal4\" role=\"dialog\">\n");
      out.write("\t\t\t<div class=\"modal-dialog\">\n");
      out.write("\t\t\t<!-- Modal content-->\n");
      out.write("\t\t\t\t<div class=\"modal-content\">\n");
      out.write("\t\t\t\t\t<div class=\"modal-header\">\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("\t\t\t\t\t\t<h4><span class=\"glyphicon glyphicon-check\"></span> User Details</h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"modal-body\">\n");
      out.write("                                             <table style=\"width:100%;text-align: center;padding: 30px;\">   \n");
      out.write("                                                 ");

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
                                                                    
                                                
      out.write("\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">NAME</td>\n");
      out.write("                                                                        <td><div contenteditable=\"true\" id=\"old_name\">");
      out.print(rs.getString(1));
      out.write("</div></td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">EMAIL</td>\n");
      out.write("                                                                        <td><div contenteditale=\"true\" id=\"old_email\">");
      out.print(rs.getString(2));
      out.write("</div></td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">PHONE NO.</td>\n");
      out.write("                                                                        <td><div contenteditable=\"true\" id=\"old_ph\">");
      out.print(rs.getString(3));
      out.write("</div></td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    <tr>\n");
      out.write("                                                                        <td style=\"padding: 10px;\">ADDRESS</td>\n");
      out.write("                                                                        <td><div contenteditable=\"true\" id=\"old_add\">");
      out.print(rs.getString(4));
      out.write("</div></td>\n");
      out.write("                                                                    </tr>\n");
      out.write("                                                                    ");

                                                                }
                                                            rs.close();
                                                            pstat.close();
                                                            con.close();
            
                                                        }catch(Exception e1)
                                                        {
                                                            out.println(e1);
                                                        }
                                                   
      out.write("\n");
      out.write("                                            </table>\n");
      out.write("                                            \n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"modal-footer\">\n");
      out.write("\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-danger btn-default pull-left\" data-dismiss=\"modal\">\n");
      out.write("\t\t\t\t\t\t\t<span class=\"glyphicon glyphicon-ok\"></span> Cancel\n");
      out.write("\t\t\t\t\t\t</button>\n");
      out.write("                                            <form action=\"updatedetails.jsp\" method=\"post\" onsubmit=\"return copydata();\">\n");
      out.write("                                                <input type=\"hidden\" id=\"new_name\" name=\"name\">\n");
      out.write("                                                <input type=\"hidden\" id=\"new_email\" name=\"email\">\n");
      out.write("                                                <input type=\"hidden\" id=\"new_ph\" name=\"phn\">\n");
      out.write("                                                <input type=\"hidden\" id=\"new_add\" name=\"address\"> \n");
      out.write("                                                 <button type=\"submit\" class=\"btn btn-danger btn-default pull-right\"><span class=\"glyphicon glyphicon-ok\"></span>Update Details\n");
      out.write("                                                \n");
      out.write("\t\t\t\t\t            </button>\n");
      out.write("                                                <!--<button type=\"submit\" class=\"btn btn-danger btn-default pull-left\" data-dismiss=\"modal\">\n");
      out.write("\t\t\t\t\t\t\t<span class=\"glyphicon glyphicon-ok\"></span> Update Details\n");
      out.write("\t\t\t\t\t\t</button>-->\n");
      out.write("                                            </form>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<div class=\"modal fade\" id=\"myModal2\" role=\"dialog\">\n");
      out.write("\t\t\t<div class=\"modal-dialog\">\n");
      out.write("\t\t\t<!-- Modal content-->\n");
      out.write("\t\t\t\t<div class=\"modal-content\">\n");
      out.write("\t\t\t\t\t<div class=\"modal-header\">\n");
      out.write("\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("\t\t\t\t\t\t<h4><span class=\"glyphicon glyphicon-hand-down\"></span> Change Password</h4>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"modal-body\">\n");
      out.write("                                            <form role=\"form\" action=\"jsp/updatepsw.jsp\" method=\"post\" name=\"form_reg\" onsubmit=\"return validateForm();\">\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\"   name=\"passOld\" placeholder=\"Old Password\" maxlength=\"50\">\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\"  name=\"passNew\" placeholder=\"New Password\" maxlength=\"35\">\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-block\">Change Your Password\n");
      out.write("\t\t\t\t\t\t\t\t<span class=\"glyphicon glyphicon-ok\"></span>\n");
      out.write("\t\t\t\t\t\t\t</button>\n");
      out.write("\t\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"modal-footer\">\n");
      out.write("\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-danger pull-left\" data-dismiss=\"modal\">\n");
      out.write("\t\t\t\t\t\t\t<span class=\"glyphicon glyphicon-remove\"></span> Cancel\n");
      out.write("\t\t\t\t\t\t</button>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<!-- Carrol part-->\n");
      out.write("\t\t\n");
      out.write("\t\t<!-- 1st part--->\n");
      out.write("\t<section id=\"blog\">\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<div class=\"row text-center clearfix\">\n");
      out.write("\t\t\t\t<div class=\"col-sm-8 col-sm-offset-2\">\n");
      out.write("\t\t\t\t\t<h2 class=\"title-one\">|| OUR COURSES ||</h2>\n");
      out.write("\t\t\t\t\t<p class=\"blog-heading\">Free Online Tutorials & Courses</p>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row text-center\">\n");
      out.write("                            ");

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
                                                   
                            
      out.write("\n");
      out.write("                            \n");
      out.write("\t\t\t\t<div class=\"col-sm-4\">\n");
      out.write("\t\t\t\t\t<div class=\"single-blog\">\n");
      out.write("\t\t\t\t\t\t<img src=\"picture/");
      out.print(rs.getString(2));
      out.write(".jpg\" alt=\"\" />\n");
      out.write("                                                <h2 style=\"text-transform: uppercase;\">");
      out.print(rs.getString(2));
      out.write("</h2>\n");
      out.write("\t\t\t\t\t\t<div class=\"blog-content\">\n");
      out.write("\t\t\t\t\t\t\t<p>");
      out.print(rs.getString(3));
      out.write("</p>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("                                                ");
session.setAttribute(rs.getString(1), rs.getString(2));
      out.write("\n");
      out.write("                                                <form action=\"SessionAttributeAdmin\" method=\"post\" >\n");
      out.write("                                                    <input type=\"hidden\" value=\"");
      out.print(rs.getString(2));
      out.write("\" name=\"course\"></input>\n");
      out.write("                                                    <button class=\"btn btn-primary\">Goto Course</button>\n");
      out.write("                                                    \n");
      out.write("                                                </form>\n");
      out.write("                                                \n");
      out.write("\t\t\t\t\t\t \n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("                                                ");

                                                            counter++;
                                                                }
                                                            
                                                            rs.close();
                                                            pstat.close();
                                                            con.close();
            
                                                        }catch(Exception e1)
                                                        {
                                                            out.println(e1);
                                                        }
                                                   
      out.write("\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t<div>\n");
      out.write("                <div class=\"jumbotron text-center\">\n");
      out.write("                        <h1>OR</h1> \n");
      out.write("                        <p>ADD NEW COURSE</p> \n");
      out.write("                        <form role=\"form\" action=\"admin_addcourse.html\" method=\"post\"> \n");
      out.write("                            <button type=\"submit\" class=\"btn btn-block\" style=\"margin-left: 400px\">ADD COURSE        \n");
      out.write("                            </button>\n");
      out.write("                        </form>\n");
      out.write("                </div>\n");
      out.write("\t\t</section>\n");
      out.write("                <section id=\"newcourse\">\n");
      out.write("                   \n");
      out.write("                                                       \n");
      out.write("                </section>                                  \n");
      out.write("                    \n");
      out.write("\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t<!-- footer part-->\n");
      out.write("\t\t<section id=\"footer\">\n");
      out.write("\t\t\t<div class=\"text-center\">\n");
      out.write("\t\t\t\t<a class=\"up-arrow\" href=\"#myCarousel\" data-toggle=\"tooltip\" title=\"TO TOP\">\n");
      out.write("\t\t\t\t\t<span class=\"glyphicon glyphicon-chevron-up\"></span>\n");
      out.write("\t\t\t\t</a><br><br>\n");
      out.write("                                        <p>Copyright &copy; 2016 - <a href=\"http://www.jiscollege.ac.in/old_version/dept/cse/\">VRS<sup>3</sup></a> | All Rights Reserved</p> \n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</section>\n");
      out.write("\t</body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
