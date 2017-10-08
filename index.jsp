<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Admin Login System</title>
    </head>
    <body>
        <div class="wrapper">
            <h2>Login Here</h2>
            <div class="manu">
                <ul>
                    <li><a href="success.jsp">Home</a></li>
                    <li><a href="showInfo.jsp">Show Data</a></li>
                    <%
                        if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
                    %>
                            <li style="float:right"><a href="index.jsp">Login</a></li>
                    <%}else{%>
                             <li style="float:right"><a href="logout.jsp">Logout</a></li>
                    <%}%>
                </ul>
            </div>
 <%
    if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
 %>
        <div class="main">
            <div class="login">
                <span class="err"><% if(request.getAttribute("err")!=null){ %>
                <%= request.getAttribute("err")%>
                <%}%></span>
                <form action="login.jsp" method="post">
                    <table>
                        <tr>
                            <td>Username:</td>
                            <td><input type="text" name="uname" placeholder="Username.."></td>
                            <span class="err"><% if(request.getAttribute("uempty")!=null){ %>
                               <%= request.getAttribute("uempty")%>
                            <%}%></span>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input type="password" name="pass" placeholder="Password.."></td>
                            <span class="err"><% if(request.getAttribute("pempty")!=null){ %>
                               <%= request.getAttribute("pempty")%>
                            <%}%></span>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Login"></td>
                        </tr>
                    </table>
                    <p>Yet Not Registered!! <a href="register.jsp">Register Here</a></p>
                </form>
            </div>
        </div>
            <footer>&copy; Copyright By Md. Raton Ali</footer>
        </div>
    </body>
</html>
<%}
else{
response.sendRedirect("success.jsp");
}

%>
