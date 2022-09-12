
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%! Connection con;
    
           Statement stmt;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% String str = request.getParameter("roll");%>
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
            
            try{
            stmt = con.createStatement();
            int available = 0;
            
            available = available + Integer.parseInt(request.getParameter("e"));
            ResultSet pq = stmt.executeQuery("select * from book where book_name = '"+request.getParameter("b")+"'");
            if(pq.next())
            {
                available = available + Integer.parseInt(pq.getString(5));
                stmt.executeUpdate("Update book set av_copy = '"+available+"' where book_name='"+request.getParameter("b")+"'");
            }
            else
            {
                stmt.executeUpdate("insert into book (book_name, author, publish, no_copy, av_copy) values ('"+request.getParameter("b")+"','"+request.getParameter("c")+"' ,'"+request.getParameter("d")+"','"+request.getParameter("e")+"', '"+available+"')"); 
            }
            
        }
        catch(SQLException e)
        {

        }
            

            %>
    </body>
</html>
