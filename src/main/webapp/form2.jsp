
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%! Connection con;
    Statement stmt;%>
    
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% String str = request.getParameter("roll");%>
         <% String str1 = request.getParameter("fname");%>
         <% String str2 = request.getParameter("lname");%>
         <% String str3 = request.getParameter("class");%>
         <% String str4 = request.getParameter("email");%>
         <% String str5 = request.getParameter("pass");%>
         
        <%! void connectDB()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception e){}
        try
        {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root","namanverma2002");
        }
        catch(SQLException e)
        {
            
        }
        System.out.print("connection found  :  "+con);
        
    } 
     %>   
        
        <% 
            connectDB();
           
           try
           {
            stmt = con.createStatement();
            stmt.executeUpdate("insert into login values('"+str+"','"+str1+"' ,'"+str2+"','"+str3+"','"+str4+"','"+str5+"')");
       
        }
        catch(Exception e)
        {
        
        }
        %>
    </body>
</html>
