
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        
        <%@include file="allcss.jsp" %>
        
    </head>
    <body style="background-color: #f7faf8;">
        <%@include file="navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row p-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Registration Page</h4>
                            
                            <% String sucss=(String)session.getAttribute("sucss");
                            String error=(String)session.getAttribute("error");
                            if(sucss != null){
                            %>
                            <p class="text-success text-center"><%=sucss%></p>
                            <%
                                session.removeAttribute("sucss");
                                }
                            if(error != null){
                            %>
                            <p class="text-danger text-center"><%=error%></p>
                            <%
                                session.removeAttribute("error");
                                }
                            %>
                            
                            <form action="register" method="post">

                                <div class="form-group">
                                    <label for="examplename">Enter Name</label>
                                    <input name="name" type="text" class="form-control" id="examplename" aria-describedby="emailHelp" placeholder="Enter name">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="text-center mt-3">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                                
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
