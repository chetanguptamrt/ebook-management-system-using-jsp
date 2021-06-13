<%-- 
    Document   : viewBook
    Created on : 09-Jun-2021, 5:20:41 PM
    Author     : chetan
--%>
<%@page import="com.detail.BookDetail"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.dao.admin.BookDAO"%>
<%
    int bookId = 0;
    try{
        bookId = Integer.parseInt(request.getParameter("bookId"));
        BookDAO dao1 = new BookDAO(DBConnect.getConnection());
        BookDetail bd = dao1.editBookDetail(bookId);
        if(bd==null){
            response.sendRedirect("./index.jsp");
        }
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
        
        <div class="container-sm">
            <div class="row mt-1 mb-5">
                <div class="col-xl-6 col-ld-6 col-md-6 col-sm-12 col-12 text-center mt-3 align-self-center">
                    <img width="60%" class="img-fluid" src="./img/books-img/<%= bd.getPhoto() %>" alt="book image" />
                </div>
                <div class="col-xl-6 col-ld-6 col-md-6 col-sm-12 col-12 mt-3 align-self-center">
                    <label>
                        <span class="font-weight-bold">Book Name:</span> <%= bd.getBookName() %>
                    </label> <br/>
                    <label>
                        <span class="font-weight-bold">Author/Publisher name:</span> <%= bd.getAuthorName() %>
                    </label><br/>
                    <label>
                        <span class="font-weight-bold">MRP:</span> <%= bd.getPrice() %>/- Rs
                    </label><br/>
                    <label>
                        <span class="font-weight-bold">Stock:</span> <%= bd.getAvailable() %> Books
                    </label><br/>
                    <label>
                        <span class="font-weight-bold">Book Category:</span> <%= bd.getBookCategory()%> Book
                    </label><br/>
                    <label>
                        <span class="font-weight-bold">Delivery Charge:</span> On orders over ₹ 699.00 
                    </label><br/>
                    
                    <div class="text-center mt-3 mb-4">
                        <button class="btn btn-outline-primary mr-3" onclick="addCart(<%= bd.getId() %>)">
                            <i class="fas fa-cart-plus"></i> Add to cart
                        </button>
                        <button class="btn btn-outline-success" onclick="addCart2(<%= bd.getId() %>)">
                            <i class="fa fa-shopping-bag" aria-hidden="true"></i> Buy Now
                        </button>
                    </div>
                    <div class="text-info mt-3" style="display: flex">
                        <div class="text-center mr-3">
                            <i class="fas fa-wallet"></i> <br/>
                            Pay on Delivery
                        </div>
                        <div class="text-center mr-3">
                            <i class="fas fa-undo-alt"></i> <br/>
                            10 Days<br/>
                            Replacement
                        </div>
                        <div class="text-center mr-3">
                            <i class="fas fa-truck"></i> <br/>
                            Fast Delivery
                        </div>
                        <div class="text-center ">
                            <i class="fas fa-mobile-alt"></i> <br/>
                            No-Contact <br/>
                            Delivery
                        </div>
                    </div>                        
                </div>
            </div>
        </div>
        
        <script>
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
        <script src="js/addCart.js" type="text/javascript"></script>
    </body>
</html>
<%
    } catch(Exception e){}
    if(bookId==0){
        response.sendRedirect("./index.jsp");
    }
%>