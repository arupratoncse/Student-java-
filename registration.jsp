<%@page import="java.sql.*" %>
<%
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String uname=request.getParameter("uname");
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
    String sql = "INSERT INTO register(fname,lname,email,uname,pass) VALUES('"+fname+"','"+lname+"','"+email+"','"+uname+"','"+pass+"')";
    if(fname!="" && lname!="" && uname!="" && email!="" && pass!=""){
       int count=stmt.executeUpdate(sql);
       if(count>0){
          request.setAttribute("err","Registration Successfull!" );
          request.getRequestDispatcher("register.jsp").forward(request, response);
       } 
    }else{
        request.setAttribute("err","All Field Must Fill Fast Then Submit!" );
        request.getRequestDispatcher("register.jsp").forward(request, response);
     }
%>