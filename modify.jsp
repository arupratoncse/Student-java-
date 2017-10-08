<%@page import="java.sql.*" %>
<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
    response.sendRedirect("index.jsp");
 }else{
    String id=request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
    String name = "", roll = "", email = "", dept = "";
    String sql = "select name,roll,dept,email from information where id=" + id;
    ResultSet rs = stmt.executeQuery(sql);
    while (rs.next()) {
        name = rs.getString("name");
        roll = rs.getString("roll");
        email = rs.getString("email");
        dept = rs.getString("dept");   
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Student Information Update System</title>
    </head>
    <body>
        <div class="wrapper">
            <h2>Update Student Information Here</h2>
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
                <span class="success"><% if(request.getAttribute("success")!=null){ %>
                <%= request.getAttribute("success")%>
                <%}%></span>
                <%
                    if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
                    %>You are not Login. Please Login to insert.
                    <%}else{%>
                    
                <form action="stEdit.jsp?id=<%=request.getParameter("id")%>" method="post">
                    <table>
                        <tr>
                            <td>Student Name: </td>
                            <td> <input type="text" name="name" value="<%=name%>"> </td>
                        </tr>
                        <tr>
                            <td>Roll No.: </td>
                            <td> <input type="text" name="roll" value="<%=roll%>"> </td>
                        </tr>
                        <tr>
                            <td>Department: </td>
                            <td> <input type="text" name="dept" value="<%=dept%>"> </td>
                        </tr>
                        <tr>
                            <td>E-mail: </td>
                            <td> <input type="text" name="email" value="<%=email%>"> </td>
                        </tr>                        
                        <tr>
                            <td></td>
                            <td> <input type="submit" value="Update"> </td>
                        </tr>
                    </table>
                </form>
                <%}%>
                <a href="update.jsp">Back To Previous</a>
            </div>
        </div>
             <footer>&copy; Copyright By Md. Raton Ali</footer>
        </div>
    </body>
</html>
<%}%>