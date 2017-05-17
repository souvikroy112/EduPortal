<%@ page import="java.io.*,java.util.*" %>
<html>
    <head>
        <title> Education</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="keywords" content="Creative, Onepage, Parallax, HTML5, Bootstrap, Popular, custom, personal, portfolio" /> 
		<link rel="stylesheet" href="/EduPortal/css/bootstrap.min.css">
		<script src="/EduPortal/javascript/jquery.min.js"></script>
		<script src="/Eduportal/javascript/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/EduPortal/css/mystyle.css">
		<script src="/Eduportal/javascript/formfilter.js"></script>
    </head>
    <body>
        <div id="unsuccessful">
            <div class="unsuccessful text-center">
                <span class="glyphicon glyphicon-remove-circle"></span>
                <%
                  Enumeration e2 = session.getAttributeNames();
                        while (e2.hasMoreElements()) 
                                    {
                                        String name = (String)e2.nextElement();
                                        if(name.equals("message"))
                                        {%>
                                            <h1 style="font-size:50px">
                                                <%=session.getAttribute(name).toString()%>
                                            </h1><%
                                         }
                                    }      
                  %>
            </div>
        </div>
    </body>
</html>