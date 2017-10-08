<%@page import="java.sql.*" %>
<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
    response.sendRedirect("index.jsp");
 }else{
String action=request.getParameter("edit");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
String fname="", lname="", email="", pass="",uname="";
if(action.equals("Edit")){
fname=request.getParameter("fname");
lname=request.getParameter("lname");
uname=request.getParameter("uname");
pass=request.getParameter("pass");
email=request.getParameter("email");
String query="update register set fname='"+fname+"',lname='"+lname+"',email='"+email+"',pass='"+pass+"' where uname='"+session.getAttribute("uname")+"'";
int i=stmt.executeUpdate(query);
if(i>0){
response.sendRedirect("editinfo.jsp");
}
}
else{
request.setAttribute("err","You have no permission to delete!" );
request.getRequestDispatcher("editinfo.jsp").forward(request, response);
}
}
%>