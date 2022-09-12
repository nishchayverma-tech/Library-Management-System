<%-- 
    Document   : name
    Created on : 03-Aug-2022, 6:27:06 PM
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
        <% String s =(String)session.getAttribute("n1");
            out.println(s);
            
               %>
    </body>
</html>
