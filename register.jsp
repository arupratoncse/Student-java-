<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Admin Registration System</title>
    </head>
    <body>
        <div class="wrapper">
            <h2>Enter Registered Information Here</h2>
            <div class="manu">
                <ul>
                    <li><a href="success.jsp">Home</a></li>
                    <li><a href="showInfo.jsp">Show Data</a></li>
                    <%
                        if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
                    %>
                            <li style="float:right"><a href="index.jsp">Login</a></li>
                    <%}else{%>
                             <li><a href="insertInfo.jsp">Insert Data</a></li>
                             <li><a href="update.jsp">Update</a></li>
                             <li style="float:right"><a href="logout.jsp">Logout</a></li>
                    <%}%>
                </ul>
            </div>
        <div class="main">
            <div class="login">
                <span class="err"><% if(request.getAttribute("err")!=null){ %>
                <%= request.getAttribute("err")%>
                <%}%></span>
                <form action="registration.jsp" method="post">
                    <table>
                        <tr>
                            <td>First Name: </td>
                            <td> <input type="text" name="fname" placeholder="First Name.."> </td>
                        </tr>
                        <tr>
                            <td>Last Name: </td>
                            <td> <input type="text" name="lname" placeholder="Last Name.."> </td>
                        </tr>
                        <tr>
                            <td>E-mail: </td>
                            <td> <input type="text" name="email" placeholder="E-mail.."> </td>
                        </tr>
                        <tr>
                            <td>Username: </td>
                            <td> <input type="text" name="uname" placeholder="Username.."> </td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td> <input type="password" name="pass" placeholder="Password.."> </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td> <input type="submit" value="Register"> </td>
                        </tr>
                    </table>
                    <p>Already Registered!! <a href="index.jsp">Login Here</a></p>
                </form>
            </div>
        </div>
             <footer>&copy; Copyright By Md. Raton Ali</footer>
        </div>
    </body>
</html>
