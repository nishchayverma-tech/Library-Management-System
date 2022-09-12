
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
    <div class="back">
    </div>
    <div class="page">
        <h2>Return Book</h2>
        <% String str = request.getParameter("roll");%>
        <%!
            String name;
            String clas;
                    String rd;
                    String dor;
            
        
        %>
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
            
    
           
        <%
            try
        {
            
            stmt = con.createStatement();
            ResultSet pq = stmt.executeQuery("select * from student1 where s_roll = '"+request.getParameter("roll")+"'");
              
              while(pq.next()){
              
              name = pq.getString(2);
              clas = pq.getString(3);
              
        %>
              
              
        <input type="text" name="i" value="<%= name%>" placeholder="Enter Name">
        <input type="number" name="j" value="<%= clas%>" placeholder="Enter Class">
        <br>
        
              <% 
              }
              ResultSet rs = stmt.executeQuery("select distinct s_roll from student1");
              ResultSet ab = stmt.executeQuery("select * from student1 where s_roll ='"+request.getParameter("roll")+"' ");       
              
              %>
            
        <label>Book Name :</label>
        <form method="post" action="#">
           <input type="text" name="roll" value= <%= request.getParameter("roll")%>>
            
        <select name="books">
            <% while(ab.next()){ %>
            <option><%= ab.getString(4)%></option>
           <% }%>
        </select>
        <button type="submit">Submit</button>
        </form>
        <%= request.getParameter("roll")%>
             <%
                  ResultSet jk = stmt.executeQuery("select * from student1 where s_roll ='"+request.getParameter("roll")+"' and book_name='"+request.getParameter("books")+"'");
                  while(jk.next()){     
             %>
                 
                    <input type="text" name="k" value= <%= jk.getString(5)%>  placeholder="Enter Author Name">
                    <input type="text" name="l" value= <%= jk.getString(6)%>  placeholder="Enter Publisher Name">
                    <br>
                 <% }

            ResultSet xy = stmt.executeQuery("select * from student1 where s_roll = '"+request.getParameter("roll")+"'");

            while(xy.next())
            {
                dor = xy.getString(8);

                   %>
                <input type="date" name="m" value="<%= dor%>" placeholder="Enter Date of Return">
            <% }
}

            catch(Exception e)
              {
                  
              }
        %>
              
        <input type="date" name="n" value="<%=java.time.LocalDate.now()%>" placeholder="Returned Date">
        <% rd = ""+java.time.LocalDate.now();%>
        
        <%= request.getParameter("roll")%>
        <%= name%>
        <%= clas%>
        <%= dor%>
        <%= rd%>
        
        <form method="post" action="form5.jsp">
            <%
            session.setAttribute("r1", ""+request.getParameter("roll"));
            session.setAttribute("nam", ""+name);
            session.setAttribute("cla", ""+clas);
            session.setAttribute("b1", ""+request.getParameter("books"));
            session.setAttribute("rd", ""+rd);
            session.setAttribute("dor", ""+dor);
            %>
        <button class="btn"><a href="#">Return</a></button><br>
        </form>
    </div>
   

</body>
</html>