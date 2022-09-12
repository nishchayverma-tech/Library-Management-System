
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.swing.*" %>
<%@page import= "java.text.ParseException" %>
<%@page import= "java.text.SimpleDateFormat" %>
<%@page import= "java.util.Date" %>

<%! 
            Connection con;
            Statement stmt;
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
     %>
     
            <%=session.getAttribute("r1")%>
            <%=session.getAttribute("nam")%>
            <%=session.getAttribute("cla")%>
            <%=session.getAttribute("b1")%>
            <%=session.getAttribute("rd")%>
            <%=session.getAttribute("dor")%>
     
     <%! 
        long difference(String start_date, String end_date){
        
       SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
       long difference_In_Days=0;
       try
       {
           Date d1 = sdf.parse(start_date);
           Date d2 = sdf.parse(end_date);
           
           long difference_In_Time = d2.getTime() - d1.getTime();
           difference_In_Days = (difference_In_Time / (1000 * 60 * 60 * 24))% 365;
           
       }
       catch(Exception e)
       {
           
       }
       return difference_In_Days;
    }
     %>
        
     <%
        
        try
        {
            stmt = con.createStatement();
            stmt.executeUpdate("delete from student1 where s_roll='"+session.getAttribute("r1")+"' and book_name='"+session.getAttribute("b1")+"'");
            JOptionPane.showMessageDialog(null, "Book successfully returned");
            
            ResultSet pq = stmt.executeQuery("select * from book where book_name='"+session.getAttribute("b1")+"'");
            if(pq.next())
            {
                int av = Integer.parseInt(pq.getString(5))+1;
                stmt.executeUpdate("Update book set av_copy = '"+av+"' where book_name='"+session.getAttribute("b1")+"'");
                JOptionPane.showMessageDialog(null,"Record Updated");
                
                String start = (String)session.getAttribute("dor");
                String last = (String)session.getAttribute("rd");
               
                long diff = difference(start,last);
                
                int fine;
                if(diff<0)
                {
                    fine=0;
                }
                else
                {
                   fine =(int)diff*20;
                }
                
                stmt.executeUpdate("insert into fine values('"+session.getAttribute("r1")+"', '"+session.getAttribute("nam")+"', '"+session.getAttribute("cla")+"', '"+session.getAttribute("b1")+"', '"+session.getAttribute("rd")+"', '"+session.getAttribute("dor")+"', '"+fine+"')");
                JOptionPane.showMessageDialog(null,"Fine table updated");
                
            }
            
            
            
        }
        catch(SQLException e)
        {
            
        }
        
     
        %>
            
    </body>
</html>
