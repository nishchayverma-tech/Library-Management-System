
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%! 
            Connection con;
            Statement stmt;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Return</title>
    <link rel="stylesheet" href="style8.css">
</head>
<body>
    
    <%! void connectDB()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch(Exception e)
        {
            
        }
        
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
            ResultSet rs = stmt.executeQuery("select distinct s_roll from student1");
            
            %>
            
    <div class="back">
    </div>
    <div class="page">
        <h2>Return Book</h2>
            
            <label>Roll No.</label>
            <form method="post" action="return1.jsp">
        <select name="roll">
            <% while(rs.next()){ %>
            <option><%= rs.getString(1)%></option>
            <% } %>
        </select>
        <button type="submit">Submit roll</button>
        </form>
            
        
        
           
                 <% }

            catch(Exception e)
              {
                  
              }
        %>
        
        
    </div>
   

</body>
</html>