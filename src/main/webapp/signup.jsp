
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="style3.css">
</head>
<body>
    
    <div class="back">
        <h1>Don't have an account?</h1>
        <p class="para">Register to access Library Management System</p>
    </div>
    <div class="page">
        <h2>Signup Here</h2>
         <form method="post" action="form2.jsp">
        <input type="number" name="roll" placeholder="Enter Roll No. Here">
        <input type="text" name="fname" placeholder="Enter First Name Here">
        <input type="text" name="lname" placeholder="Enter Last Name Here">
        <input type="number" name="class" placeholder="Enter Class Here">
        <input type="email" name="email" placeholder="Enter Email Here">
        <input type="password" name="pass" placeholder="Create New Password">
        
        <button class="btn"><a href="#">Signup</a></button><br>
         </form>
    </div>
   

</body>
</html>
