package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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

      out.write("\n");
      out.write("\n");
      out.write("\n");

    if (!session.isNew())
       {
            response.sendRedirect("admin_profile.jsp");
       }
    else
    {
        session.invalidate();
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n");
      out.write("3 \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
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
      out.write("\t\t<script>\n");
      out.write("\t\t\t$(document).ready(function(){\n");
      out.write(" \t\t\t // Add smooth scrolling to all links in navbar + footer link\n");
      out.write(" \t\t\t $(\".navbar a, #footer a[href='#myCarousel']\").on('click', function(event) {\n");
      out.write("\n");
      out.write(" \t\t\t // Prevent default anchor click behavior\n");
      out.write("\t\t\t  event.preventDefault();\n");
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
      out.write("            </head>\n");
      out.write("\t<body>\n");
      out.write("\t\t<nav class=\"navbar navbar-default navbar-fixed-top\">\n");
      out.write("\t\t\t<div class=\"container-fluid\">\n");
      out.write("\t\t\t\t<div class=\"navbar-header\">\n");
      out.write("                                    <a class=\"navbar-brand\" href=\"#\">Learning Is Fun!</a>\t\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</nav>\n");
      out.write("\t\t\n");
      out.write("            <section id=\"admin\">\n");
      out.write("                <div class=\"admin\">\n");
      out.write("                    <div class=\"modal-header\">\n");
      out.write("\t\t\t<h4><span class=\"glyphicon glyphicon-log-in\"></span> Admin</h4>\n");
      out.write("                    </div>\n");
      out.write("\t\t\t<div class=\"modal-body\">\n");
      out.write("                            <form role=\"form\" action=\"jsp/admin_authentication.jsp\" method=\"post\" name=\"form_login\" onsubmit=\"return validateClient();\">\n");
      out.write("\t\t\t\t<div class=\"form-group\">\n");
      out.write("                                    <input type=\"text\" class=\"form-control\" id=\"username_login\" autocomplete=\"off\" name=\"adminuser\" placeholder=\"Username\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"form-group\">\n");
      out.write("                                    <input type=\"password\" class=\"form-control\" id=\"password_login\" name=\"adminpassword\" placeholder=\"Password\" >\n");
      out.write("                                    <input type=\"hidden\" name=\"designation\" value=\"A\"><br>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<button type=\"submit\" class=\"btn btn-block\">Log In \n");
      out.write("                                    <span class=\"glyphicon glyphicon-ok\"></span>\n");
      out.write("\t\t\t\t</button>\n");
      out.write("                            </form>\n");
      out.write("\t\t\t</div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("\t\t<!-- footer part-->\n");
      out.write("\t\t<section id=\"footeradmin\">\n");
      out.write("\t\t\t<div class=\"text-center\">\n");
      out.write("\t\t\t\t<br><br>\n");
      out.write("\t\t\t\t<p>Copyright &copy; 2016 - <a href=\"http://www.jiscollege.ac.in/old_version/dept/cse/\">VRS<sup>3</sup></a> | All Rights Reserved</p> \n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</section>\n");
      out.write("\t</body>\n");
      out.write("</html>\n");
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
