
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%! Connection con;
    
           Statement stmt;
          
            
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
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db1", "root","namanverma2002");
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
          ResultSet rs = stmt.executeQuery("Select* From fine");
         
                            %>
  
    <table class="content-table">
        <thead>
          <tr>
            <th>Roll No.</th>
            <th>Name</th>
            <th>Class</th>
            <th>Book Name</th>
            <th>Returned Date</th>
            <th>Dor</th>
            <th>Fine</th>
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
