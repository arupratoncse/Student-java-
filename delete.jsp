<%@page import="java.sql.*" %>
<%
    String id=request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
    String sql="delete from information where id="+id;
    int i=stmt.executeUpdate(sql);
    if(i>0){
        request.setAttribute("success","Data Deleted successfully!" );
        request.getRequestDispatcher("update.jsp").forward(request, response);
    }
    
%>