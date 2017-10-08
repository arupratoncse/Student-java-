<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Student Information System</title>
    </head>
    <body>
        <div class="wrapper">
            <h2>Welcome To Student Information System</h2>
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
                            <li><a href="editinfo.jsp">Edit Information</a></li>
                             <li style="float:right"><a href="logout.jsp">Logout</a></li>
                    <%}%>
                </ul>
            </div>
        <div class="main">
            <h2 style="text-align: center; background: none">
            <%
                if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ %>
                    You are not logged in.<br>
                    <a href="index.jsp">Please Login</a>
            <%    }else{%>
            Welcome <%= session.getAttribute("uname") %><br>

            <% }
            %>
            </h2>
        </div>
            <footer>&copy; Copyright By Md. Raton Ali</footer>
        </div>
    </body>
</html>
