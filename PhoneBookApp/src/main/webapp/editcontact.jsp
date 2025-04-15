<%-- 
    Document   : edit
    Created on : 13 Apr 2025, 11:23:25 am
    Author     : saini
--%>

<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.ccon.DBconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Contact</title>
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
                            <h4 class="text-center text-success">Edit Contact</h4>
                            
                            <%
                            String faild=(String)session.getAttribute("faild");
                            
                            if(faild != null){
                            %>
                            <p class="text-danger text-center"><%=faild%></p>
                            <%
                                session.removeAttribute("faild");
                                }
                            %>
                            
                            <form action="editContactServlet" method="post">
                                <%
                                 int cid = Integer.parseInt(request.getParameter("cid"));
                                ContactDAO dao = new ContactDAO(DBconnect.getConn());
                                Contact c = dao.getContactByID(cid);
                                %>
                                
                                <input type="hidden" name="cid" value="<%= cid %>">
                                <div class="form-group">
                                    <label for="exampleInputName">Enter Name</label>
                                    <input name="name" value="<%= c.getName()%>"  type="text" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter name">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" value="<%= c.getEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Phone no</label>
                                    <input name="phone" value="<%= c.getPhone()%>" type="phone" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group">
                                    <label for="about">Enter About</label>
                                     <textarea name="about" class="form-control" rows="3" placeholder="Enter About"><%= c.getAbout() %></textarea>
                                </div>
                                <div class="text-center mt-3">
                                    <button type="submit" class="btn btn-success">Update Contact</button>
                                </div>
                                
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
