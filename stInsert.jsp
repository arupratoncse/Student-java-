<%@page import="java.sql.*" %>
<%
    String name=request.getParameter("name");
    String roll=request.getParameter("roll");
    String dept=request.getParameter("dept");
    String email=request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
    String sql = "INSERT INTO information(name,roll,dept,email) VALUES('"+name+"','"+roll+"','"+dept+"','"+email+"')";
    if(name!="" && roll!="" && dept!="" && email!=""){
       int count=stmt.executeUpdate(sql);
       if(count>0){
          request.setAttribute("err","Insertion Successfull!" );
          request.getRequestDispatcher("insertInfo.jsp").forward(request, response);
       } 
    }else{
        request.setAttribute("err","All Field Must Fill Fast Then Submit!" );
        request.getRequestDispatcher("insertInfo.jsp").forward(request, response);
     }
%>