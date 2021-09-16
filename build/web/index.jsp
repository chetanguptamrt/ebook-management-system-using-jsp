<%-- 
    Document   : index
    Created on : 31-May-2021, 9:09:14 PM
    Author     : chetan
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.database.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="com.detail.BookDetail"%>
<%@page import="com.dao.UserBookDAO"%>
<%
    UserBookDAO dao1 = new UserBookDAO(DBConnect.getConnection());
    List<BookDetail> list1;
    List<BookDetail> list2;
    list1 = dao1.newBook();
    list2 = dao1.oldBook();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/header.jsp" %>
        <title>Book Store</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container-fluid cover-img">
            <div class="row">
                <div class="col-12">
                    <h3 class="text-light mt-2 mb-2 cover-img-text">Recent Book</h3>
                </div>
            </div>
        </div>

        <div class="card-show container-fluid mt-3 mb-4">
            
            <div class="row m-1">
                <div class="col-12 text-center">
                    <h3>New Books</h3>
                </div>
            </div>
            <div class="row mr-1 ml-1">
                <%
                    for(BookDetail bd : list1) {
                %>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-6 m-0 p-1">
                            <div class="card card-highlight m-0 p-0">
                                <div class="p-2 text-center">
                                    <img src="./img/books-img/<%= bd.getPhoto() %>" class="img-fluid card-img-show">
                                </div>
                                <div class="card-body m-0 pt-0 pl-1 pr-1 pb-2 ">
                                    <div style="font-weight: 600; font-size: 14px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; " class="ml-2 mr-2" >
                                        <%= bd.getBookName() %>
                                    </div>
                                    <div class="ml-2 mr-2">
                                        MRP - <span><%= bd.getPrice() %></span>/- Rs
                                    </div>
                                    <div style="display: flex;">
                                        <a href="./viewBook.jsp?bookId=<%= bd.getId() %>" target="_blank" class="btn btn-outline-primary form-control ml-2 mr-1 btn-sm">View Item</a>
                                        <button onclick="addCart(<%= bd.getId() %>)" class="btn btn-outline-dark btn-sm mr-2">
                                            <i class="fas fa-cart-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                <%
                    }
                %>
            </div>
            
            <div class="row m-1">
                <div class="col-12 text-center">
                    <h3>Old Books</h3>
                </div>
            </div>
            <div class="row mr-1 ml-1">
                <%
                    for(BookDetail bd : list2) {
                %>
                        <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6 col-6 m-0 p-1">
                            <div class="card card-highlight m-0 p-0">
                                <div class="p-2 text-center">
                                    <img src="./img/books-img/<%= bd.getPhoto() %>" class="img-fluid card-img-show">
                                </div>
                                <div class="card-body m-0 pt-0 pl-1 pr-1 pb-2 ">
                                    <div style="font-weight: 600; font-size: 14px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; " class="ml-2 mr-2" >
                                        <%= bd.getBookName() %>
                                    </div>
                                    <div class="ml-2 mr-2">
                                        MRP - <span><%= bd.getPrice() %></span>/- Rs
                                    </div>
                                    <div style="display: flex;">
                                        <a href="./viewBook.jsp?bookId=<%= bd.getId() %>" target="_blank" class="btn btn-outline-primary form-control ml-2 mr-1 btn-sm">View Item</a>
                                        <button onclick="addCart(<%= bd.getId() %>)" class="btn btn-outline-dark btn-sm mr-2">
                                            <i class="fas fa-cart-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                <%
                    }
                %>
            </div>           
            
        </div>
        <script>
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
        <script src="js/addCart.js" type="text/javascript"></script>
    </body>
</html>
