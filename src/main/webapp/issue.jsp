
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.time.LocalDateTime" %>
<%@page import="java.time.format.DateTimeFormatter" %>
<%! Connection con;
    
           Statement stmt;
          
            
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue</title>
    <link rel="stylesheet" href="issue.css">
</head>
<body>
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
            ResultSet rs = stmt.executeQuery("select* from book");
      
             %>
    <div class="back">
       
    </div>
    <div class="page">
        <h2>Select Book</h2><br><br>
       
        <label for="Book">Select Book :</label>
        <form action="issue1.jsp">
            
        <select name="bk">
            <% while(rs.next())
            { %>
               <option><%= rs.getString(1)%></option>  
                
           <% } %>
           </select>
        
           <button class="btn" type="submit"><a>Select</a></button>
        </form>
           <% 
                
              
                 }
                 catch(Exception e)
                   {

                   }%>
             

    </div>
   

</body>
</html>
