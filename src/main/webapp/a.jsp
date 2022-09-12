<%-- 
    Document   : a
    Created on : 03-Aug-2022, 5:40:06 PM
    Author     : Prashant Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! 
            int fib(int x){
            
           
           if(x==0 || x==1)
           {
              return(x);
           }
           else
              {
                return(fib(x-1)+fib(x-2));  
              }
        }
            %>
           
           
           
           
           
           
           
       
           
            <% int i;
                for(i = 0 ; i<10 ; i++)
            {
            %><font color="red" size="50"> <%out.println(fib(i));%><br></font>
            <% }
                %>
    </body>
</html>
