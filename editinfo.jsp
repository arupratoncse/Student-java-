<%@page import="java.sql.*" %>
<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
    response.sendRedirect("index.jsp");
 }else{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
String fname="", lname="", email="", pass="";    
String sql="select fname,lname,email,pass from register where uname='"+session.getAttribute("uname")+"'";
ResultSet rs=stmt.executeQuery(sql);
while (rs.next()) {
fname= rs.getString("fname");
lname= rs.getString("lname");
email= rs.getString("email");
pass= rs.getString("pass");    
    }
%>
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
            <h2>User Information Here</h2>
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
                <form action="editUser.jsp" method="post">
                    <table>
                        <tr>
                            <td>First Name: </td>
                            <td> <input type="text" name="fname" value="<%=fname%>"> </td>
                        </tr>
                        <tr>
                            <td>Last Name: </td>
                            <td> <input type="text" name="lname" value="<%=lname%>"> </td>
                        </tr>
                        <tr>
                            <td>E-mail: </td>
                            <td> <input type="text" name="email" value="<%=email%>"> </td>
                        </tr>
                        <tr>
                            <td>Username: </td>
                            <td> <input type="text" name="uname" value="<%=session.getAttribute("uname")%>"> </td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td> <input type="password" name="pass" value="<%=pass%>"> </td>
                        </tr>
                        <tr>
                            <td> <input type="submit" value="Edit" name="edit"> </td>
                            
                            <td> <input type="submit" value="Delete" name="edit"> </td>
                        </tr>
                    </table>
                        <p><a href="success.jsp">Back To previous!</a></p>
                </form>
            </div>
        </div>
             <footer>&copy; Copyright By Md. Raton Ali</footer>
        </div>
    </body>
</html>
<% } %>