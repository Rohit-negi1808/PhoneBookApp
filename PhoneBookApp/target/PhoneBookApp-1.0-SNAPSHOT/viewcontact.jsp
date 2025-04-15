
<%@page import="java.util.List"%>
<%@page import="com.entity.Contact"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.ccon.DBconnect"%>
<%@page import="com.utility.SortingContact"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Contact</title>
        <%@include file="allcss.jsp" %>
        <style type="text/css">
            .crd-ho:hover{
                background-color: #f7f7f7;
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
         <% if(user==null){
            session.setAttribute("invalid", "Please Login...");
            response.sendRedirect("login.jsp");
            }
        %>
        
        <%
            String sucss =(String) session.getAttribute("sucss");
            String faild=(String)session.getAttribute("faild");
            if(sucss!=null){%>
             <div class="alert alert-success" role="alert">
                     <%= sucss %>
                </div>
           <% }

            if(faild != null){%>
                <p class="text-danger text-center"><%=faild%></p>
                 <%
                    session.removeAttribute("faild");
                                }
                    %>
      
        <div class="container">
            <div class="row p-4">
                    
                    <%
                        
                     if (user!=null){
                        
                    ContactDAO dao = new ContactDAO(DBconnect.getConn());
                    List<Contact> contact = dao.getAllContact(user.getId());
                    
                    SortingContact.sortByNameAscending(contact);
                    
                    for(Contact c:contact){%>
                    <div class="col-md-3">
                    
                    <div class="card crd-ho">
                        <div class="card-body">
                            <h5>Name: <%= c.getName()%></h5>
                            <P>Phone No:<%= c.getPhone()%></P>
                            <P>Email: <%= c.getEmail()%></P>
                            <P>About: <%= c.getAbout()%></P>
                            
                            <div class="text-center">
                                <a href="editcontact.jsp?cid=<%= c.getId()%>" class="btn btn-success btn-sm text-white">Edit</a>
                                <a href="delete?cid=<%= c.getId() %>" class="btn btn-danger btn-sm text-white">Delete</a>
                            </div>
                        </div>
                    </div>
                     </div>
                       <% }}
                    %>
                    
                    
               
            </div>
        </div>
    </body>
</html>
