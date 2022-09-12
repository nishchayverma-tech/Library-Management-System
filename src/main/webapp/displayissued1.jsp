<%-- 
    Document   : displayissued1
    Created on : 23-Aug-2022, 11:29:13 PM
    Author     : Prashant Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.swing.*" %>
<%! Connection con;
    
           Statement stmt;
          
            String roll;
            String email;
%>
<%         email = (String)session.getAttribute("e1");
    %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Books</title>
    <link rel="stylesheet" href="style9.css">
</head>
<body>
  <div class="ab">
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
     <%  connectDB(); 
          try
           {
           
            stmt = con.createStatement();
           ResultSet pq = stmt.executeQuery("Select* From login1 where email='"+email+ "'"); 
           if(pq.next())
           {
              roll = pq.getString(1);
           }
           
          ResultSet rs = stmt.executeQuery("Select* From student1 where roll='"+roll+ "'");
         
                            %>
  
    <table class="content-table">
        <thead>
          <tr>
            <th>Roll No.</th>
            <th>Name</th>
            <th>Class</th>
            <th>Book Name</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>Doi</th>
            <th>Dor</th>
          </tr>
        </thead>
        <tbody>
            <% while(rs.next())
              {
                 %>
          <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
          </tr>
           <% }
             }
            catch(Exception e)
             {

               }           %>
        </tbody>
      </table>
  
  </div>
</body>
</html>
