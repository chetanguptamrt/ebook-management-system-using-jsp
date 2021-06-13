<%-- 
    Document   : adminPanel
    Created on : 06-Jun-2021, 10:33:07 AM
    Author     : chetan
--%>
<%
    if(session.getAttribute("admin")==null){
        response.sendRedirect("./adminLogin.jsp");
    } else {
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="adminHead.jsp" %>
        <title>Admin Panel | Book Store</title>
    </head>
    <body>
        <%@include file="adminNavbar.jsp" %>
        <div class="container mt-3 mb-5">
            <div class="row">
                <div class="col-12 text-center mb-2">
                    <h2>Welcome to Admin Panel</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 mt-2">
                    <a class="card-link-a" href="./adminAddBook.jsp">
                        <div class="card text-center text-primary p-4 card-custom">
                            <div class="card-body">
                                <i class="fas fa-plus-square fa-3x"></i>
                                <h4>Add Books</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 mt-2">
                    <a class="card-link-a" href="./adminAllBook.jsp">
                        <div class="card text-center text-danger p-4 card-custom">
                            <div class="card-body">
                                <i class="fas fa-book-open fa-3x"></i>
                                <h4>All Books</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
                
                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 col-12 mt-2">
                    <a class="card-link-a" href="./adminOrderBook.jsp">
                        <div class="card text-center text-warning p-4 card-custom">
                            <div class="card-body">
                                <i class="fas fa-box-open fa-3x"></i>
                                <h4>Order Books</h4>
                                ------------------
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        
    </body>
</html>
<%
    }
%>