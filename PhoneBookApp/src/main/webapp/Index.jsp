<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        
        <%@include file="allcss.jsp" %>
        <style type="text/css">
            .back-img{
                background: url("image/phone.jpg");
                width: 100%;
                height: 92vh;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        
    </head>
    <body>
        
        <%@include file="navbar.jsp" %>
            
        <div class="container-fluid back-img text-center text-Danger">
            <h1> Welcome to PhoneBook Web App</h1>
        </div>
       
    </body>
</html>
