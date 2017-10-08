<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Student Information insert System</title>
    </head>
    <body>
        <div class="wrapper">
            <h2>Enter Student Information Here</h2>
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
            <div class="login">
                <span class="err"><% if(request.getAttribute("err")!=null){ %>
                <%= request.getAttribute("err")%>
                <%}%></span>
                <%
                    if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
                    %>You are not Login. Please Login to insert.
                    <%}else{%>
                <form action="stInsert.jsp" method="post">
                    <table>
                        <tr>
                            <td>Student Name: </td>
                            <td> <input type="text" name="name" placeholder="Name.."> </td>
                        </tr>
                        <tr>
                            <td>Roll No.: </td>
                            <td> <input type="text" name="roll" placeholder="Roll.."> </td>
                        </tr>
                        <tr>
                            <td>Department: </td>
                            <td> <input type="text" name="dept" placeholder="Department.."> </td>
                        </tr>
                        <tr>
                            <td>E-mail: </td>
                            <td> <input type="text" name="email" placeholder="E-mail.."> </td>
                        </tr>                        
                        <tr>
                            <td></td>
                            <td> <input type="submit" value="Insert"> </td>
                        </tr>
                    </table>
                </form>
                <%}%>
            </div>
        </div>
             <footer>&copy; Copyright By Md. Raton Ali</footer>
        </div>
    </body>
</html>
