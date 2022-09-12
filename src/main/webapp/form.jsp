

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
         <% String str = request.getParameter("email");%>
         <% String str2 = request.getParameter("b");%>
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
            
        ResultSet rs= stmt.executeQuery("Select* From login where email = '"+str+"'");
        if(rs.next())
        {
            if(str.equals(rs.getString("email")) && str2.equals(rs.getString("pass")))
            {
                 response.sendRedirect("welcome.jsp");
            }
            
        }
        else
        {
            if(str.equals("admin@lms.edu") && str2.equals(rs.getString("admin")))
            {
                 response.sendRedirect("welcome1.jsp");
            }
            else
            {
                JOptionPane.showMessageDialog(null, "Incorrect login credentials");
            }
        }
        }
        catch(Exception e)
        {
        
        }
        %>
       
        
       
       
    </body>
</html>
