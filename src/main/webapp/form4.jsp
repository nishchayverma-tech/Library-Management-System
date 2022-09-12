

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.swing.*" %>
<%! Connection con;
    
           Statement stmt;
           int r;
           String book;
           
            
%>
<%
    r=Integer.parseInt(request.getParameter("rl"));
    book = request.getParameter("bks");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        
    } 
       
     %>
     
     <%
        
            connectDB();
            
            int count=0 ;
        int x=0;
        
        try
        {
            stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from student1 where roll="+r+"");
           
            while(rs.next())
            {
               count++; 
               if(rs.getString(4).equals(book))
               {
                   
                   x =1;
               }
            }
            if(count>3 || x==1 )
            {
            response.sendRedirect("issue.jsp");   
            JOptionPane.showMessageDialog(null,"Cannot Issue Book....."); 
            }
            else
            {
            response.sendRedirect("issue.jsp");
            stmt.executeUpdate("insert into student1 values('"+request.getParameter("rl")+"','"+request.getParameter("nm")+"' ,'"+request.getParameter("cl")+"','"+request.getParameter("bks")+"','"+request.getParameter("an")+"','"+request.getParameter("pn")+"','"+request.getParameter("da")+"','"+java.time.LocalDate.now().plusDays(15)+"')");
            JOptionPane.showMessageDialog(null,"Record Saved.....");
            
            stmt=con.createStatement();
            ResultSet pq = stmt.executeQuery("Select* From book where book_name = '"+book+ "'");
            if(pq.next())
            {
                int av = Integer.parseInt(pq.getString(4))-1;
                stmt.executeUpdate("Update book set av_copy= '"+av+"' where book_name = '"+book+"' ");
            }
            }
           
        }
        catch(Exception e)
        {
            
        }
                
                

                           
        
            %>
                
    </body>
</html>
