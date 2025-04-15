

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Contact</title>
        
        <%@include file="allcss.jsp" %>
        
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <% if(user==null){
            session.setAttribute("invalid", "Please Login...");
            response.sendRedirect("login.jsp");
            }
        %>
        
        <div class="container-fluid">
            <div class="row p-3">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center text-success">Add Contact</h4>
                            
                            <% String sucss=(String)session.getAttribute("sucss");
                            String faild=(String)session.getAttribute("faild");
                            if(sucss != null){
                            %>
                            <p class="text-success text-center"><%=sucss%></p>
                            <%
                                session.removeAttribute("sucss");
                                }
                            if(faild != null){
                            %>
                            <p class="text-danger text-center"><%=faild%></p>
                            <%
                                session.removeAttribute("faild");
                                }
                            %>
                            
                            <form action="addContactServlet" method="post">
                                <%
                                if(user!=null){%>
                                    <input type="hidden" value="<%= user.getId() %>" name="userId">
                                    <%}
                                %>
                                <div class="form-group">
                                    <label for="exampleInputName">Enter Name</label>
                                    <input name="name" type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter name">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Phone no</label>
                                    <input name="phone" type="phone" class="form-control" id="exampleInputPassword1" placeholder="Enter phone no">
                                </div>
                                <div class="form-group">
                                    <label for="about">Enter About</label>
                                    <textarea name="about" class="form-control" name="about" rows="3" placeholder="Enter About"></textarea>
                                </div>
                                <div class="text-center mt-3">
                                    <button type="submit" class="btn btn-success">Save Contact</button>
                                </div>
                                
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
