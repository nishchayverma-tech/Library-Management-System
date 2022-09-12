<%-- 
    Document   : form1
    Created on : 23-Aug-2022, 11:17:07 PM
    Author     : Prashant Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.swing.*" %>

<%! Connection con;
    
           Statement stmt;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!String str,str2;%>
         <%str = request.getParameter("email");%>
         <%str2 = request.getParameter("b");%>
         
         <%! void connectDB()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception e){}
        try
        {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root","prashant");
        }
        catch(SQLException e)
        {
            
        }
        System.out.print("connection found  :  "+con);
        
    } 
     %>   
        
        <% 
            connectDB();
            
            boolean flag=false;
            session.setAttribute("e1", str);
        if(str.equals("admin@gmail.com") && str2.equals("admin"))
            {
                flag=true;
                 response.sendRedirect("welcome.jsp");
            } 
            
           try
           {
           
            stmt = con.createStatement();
            
        ResultSet rs= stmt.executeQuery("Select* From login1 where email = '"+str+"'");
        if(rs.next())
        {
            if(str.equals(rs.getString(5)) && str2.equals(rs.getString(6)))
            {
                flag=true;
                 response.sendRedirect("welcome1.jsp");
        }
        }
        }
        catch(Exception e)
        {
        
        }
        if(!flag)
        {
            response.sendRedirect("index.jsp");
            JOptionPane.showMessageDialog(null,"Not found");
        }
        %>
       
        
       
       
    </body>
</html>

