<%@page import="java.sql.*"%>
<%
    String uname=request.getParameter("uname");
    String pass=request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    if(uname==null || uname=="" || pass==null || pass==""){
    if(uname==null ||uname==""){
        request.setAttribute("uempty","Username Must Not Be Empty!" );
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    if(pass==null || pass==""){
        request.setAttribute("pempty","Password Must Not Be Empty!" );
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    }
    else{

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
    Statement stmt = con.createStatement();
    String sql = "select * from register where uname='"+uname+"' and pass='"+pass+"'";
    ResultSet rs=stmt.executeQuery(sql);
    if(rs.next()){
        session.setAttribute("uname", uname);
        response.sendRedirect("success.jsp");
    }else{
        request.setAttribute("err","Invalid username or password" );
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
        
    }
%>
