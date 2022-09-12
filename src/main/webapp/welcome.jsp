<%-- 
    Document   : welcome
    Created on : 08-Aug-2022, 5:48:04 PM
    Author     : Prashant Choudhary
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="style2.css">
</head>
<style>
        .blink {
            animation: blinker 1.5s linear infinite;
            color: white;
            font-family: sans-serif;
        }
        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }
    </style>

<body>
    
    
    <h1><marquee class="blink"
             behaviour=slide
             direction="right"
             loop="">Welcome To <span class="a">Library Management System</span>
    </marquee></h1>
    
    <div class="bt">
        
        <button type="button"><a href="dashboard.jsp"> Go To Dashboard </a></button>
       
        <button type="button">Back</button>
    </div> 
</body>
</html>
