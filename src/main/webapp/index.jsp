
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <link rel="stylesheet" href="style.css">

</head>
<body>
   <div class="main">
    <div class="navbar">
        <div class="icon">
            <h2 class="logo">Library</h2>
   </div> 
   <div class="menu">
             <ul>
                  <li><a href="#">HOME</a></li>
                  <li><a href="#">ABOUT</a></li>
                  <li><a href="#">SERVICE</a></li>
                  <li><a href="#">FACILITIES</a></li>
                  <li><a href="#">CONTACT</a></li>
             </ul>
   </div>
   
   
   <div class="search">
         <input class="srch" type="search" name="a" placeholder="Type to Text">
         <a href="#"><button class="btn">Search</button></a>
   </div>
    </div>
   <div class="content">
        <h1>Library <br><span>Management</span><br>System</h1><br>
        <p class="par">Welcome To Library Management System</p>
        <button class="cn"><a href="explore.jsp">EXPLORE LIBRARY</a></button>

        <div class="form">
            <h2>Login Here</h2>
            <form method="post" action="form.jsp">
            <input type="email" name="email" placeholder="Enter Email Here">
            <input type="password" name="b" placeholder="Enter Password Here">
            <button class="btnn"><a href="#">Login</a></button><br>
            </form>
            <% session.setAttribute("e1",""+request.getParameter("email"));%>
            
            <p class="link">Don't have an account<br>
            <a href="signup.jsp">Sign up </a> here</p>
     
            

           </div>
       </div>
   </div>
</body>
</html>

