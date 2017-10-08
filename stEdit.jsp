<%@page import="java.sql.*" %>
<%
if(session.getAttribute("uname")==null || session.getAttribute("uname")==""){ 
    response.sendRedirect("index.jsp");
 }else{
    String id=request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
    String name="", roll="", email="", dept="";
        name = request.getParameter("name");
        roll = request.getParameter("roll");
        dept = request.getParameter("dept");
        email = request.getParameter("email");
        String sql = "update information set name='" + name + "',roll='" + roll + "',dept='" + dept + "',email='" + email + "' where id="+id;
        out.println(sql);
        int i=stmt.executeUpdate(sql);
        if (i > 0) {
            request.setAttribute("success", "Information Update Successfully!");
            request.getRequestDispatcher("modify.jsp").forward(request, response);
        }
}
%>