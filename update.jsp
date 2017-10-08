<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <title>Student Information insert System</title>
        <script>
		function confirm_delete() {
			return confirm('are you sure want to delete this data?');
		}
	</script>
    </head>
    <body>
        <div class="wrapper">
            <h2>Student Information Here</h2>
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
                View All Student Information from Database
            </div>
            <span class="success"><% if(request.getAttribute("success")!=null){ %>
                <%= request.getAttribute("success")%>
                <%}%></span>
            <%
                    if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
            %><p style="text-align: center; color: #fff">You are not Login. Please Login to Modify.</p>
                    <%}else{%>
            <table class="tbl2">
                <tr>
                    <th width="10%">Serial No</th>
                    <th width="20%">Name</th>
                    <th width="15%">Roll</th>
                    <th width="20%">Department</th>
                    <th width="20%">Email Address</th>
                    <th width="25%">Action</th>
                </tr>
                <%
                    int i = 0;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
                    Statement stmt = con.createStatement();
                    String sql="select * from information";
                    ResultSet rs=stmt.executeQuery(sql);
                while(rs.next()) 
                {
                i++;
                %>

                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("roll")%></td>
                    <td><%=rs.getString("dept")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td>
			<a href="modify.jsp?id= <%=rs.getString("id")%>">Edit</a>&nbsp;|&nbsp;
			<a onclick="return confirm_delete();" href= "delete.jsp?id= <%=rs.getString("id")%>">Delete</a>
                    </td>
                </tr>

                <%
                }%>

            </table>
                <%}%>
        </div>
             <footer>&copy; Copyright By Md. Raton Ali</footer>
        </div>
    </body>
</html>
