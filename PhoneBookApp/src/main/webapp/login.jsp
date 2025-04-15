<%-- 
    Document   : register
    Created on : 12 Apr 2025, 10:50:28 am
    Author     : saini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        
        <%@include file="allcss.jsp" %>
        
    </head>
    <body style="background-color: #f7faf8;">
        <%@include file="navbar.jsp" %>
        
        <div class="container-fluid">
            <div class="row p-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Login Page</h4>
                            
                            <%
                                String invalid=(String)session.getAttribute("invalid");
                                if (invalid!=null){
                                %>
                                <p class="text-danger text-center"><%=invalid%></p>
                            <%
                                
                                session.removeAttribute("invalid");
                                }
                            %>
                            
                             <%
                                String logMsg=(String)session.getAttribute("logMsg");
                                if (logMsg !=null){
                                %>
                                <p class="text-success text-center"><%= logMsg %></p>
                            <%
                                
                                session.removeAttribute("logMsg");
                                }
                            %>
                            
                            <form action="login" method="post">
                               
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="text-center mt-3">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                                
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </body>
</html>
