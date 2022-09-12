
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
    <title>Issue</title>
    <link rel="stylesheet" href="style7.css">
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
       ResultSet rs = stmt.executeQuery("Select* From book where book_name = '"+request.getParameter("bk")+ "'");   
                       %>
    
    <div class="back">
       
    </div>
    <div class="page">
        <h2>Issue Book</h2>
        <form method="post" action="form4.jsp">
        <input type="number" name="rl" placeholder="Enter Roll No.">
        <input type="text" name="nm" placeholder="Enter Name">
        <input type="number" name="cl" placeholder="Enter Class">
        <input type="text" value="<%=request.getParameter("bk")%>" name="bks" placeholder="Enter Book Name">
        <%  if(rs.next()) {  %>
        <input type="text" value="<%=rs.getString(2)%>" name="an" placeholder="Enter Author Name">
        <input type="text" value="<%=rs.getString(3)%>" name="pn" placeholder="Enter Publisher Name">
        <% }
             }
            catch(Exception e)
             {

             }           %>
         <input type="date" name="da" value="<%=java.time.LocalDate.now()%>" placeholder="Date">
        <button class="btn"><a>Issue</a></button><br>
        </form>
    </div>
   

</body>
</html>
