<%-- 
    Document   : myCart
    Created on : 11-Jun-2021, 5:08:45 PM
    Author     : chetan
--%>

<%@page import="com.dao.OrderDAO"%>
<%@page import="com.detail.CartDetail"%>
<%@page import="java.util.List"%>
<%
    if(session.getAttribute("userL")==null){
        response.sendRedirect("./index.jsp");
    } else {
        UserDetail udCart = (UserDetail) session.getAttribute("userL");
        CartDAO cartDAO2 = new CartDAO(DBConnect.getConnection());
        List<CartDetail> list = cartDAO2.getCart(udCart.getId());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/header.jsp" %>
        <title>My Cart | Book Store</title>
        <style>
            .card-link-a:hover{
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container-md mt-4 mb-5">
            <div class="row mb-3">
                <div class="col-12 text-center">
                    <h3>My Cart</h3>
                    <small>You can buy only one quantity of book at a time.</small>
                </div>
            </div>
            <%
                if(!list.isEmpty()) {
            %>
                    <div class="row">
                        <div class="col-12 table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <td>
                                            No.
                                        </td>
                                        <td>
                                            Book Name
                                        </td>
                                        <td>
                                            Price (in Rs.)
                                        </td>
                                        <td>
                                            Quantity
                                        </td>
                                        <td>
                                            Total Price
                                        </td>
                                        <td>
                                            Delete
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    int srNo = 0;
                                    int totalBookPrice = 0;
                                    boolean checkBookAvailableOrNot = false;
                                    boolean checkBookAvailable = false;
                                    OrderDAO orderDAO = new OrderDAO(DBConnect.getConnection());
                                    for(CartDetail cd : list) {
                                        int totalPrice = 0;
                                        if(orderDAO.checkBookAvailable(cd.getBookId())){
                                            checkBookAvailableOrNot = false;
                                            totalPrice = cd.getPrice()*cd.getQuantity();
                                            totalBookPrice += totalPrice;
                                        } else {
                                            checkBookAvailableOrNot = true;
                                            checkBookAvailable = true;
                                        }
                                        srNo += 1;
                                %>
                                    <tr>
                                        <td>
                                            <%= srNo %>
                                        </td>
                                        <td>
                                            <img class="img-fluid mr-2" width="60px" src="./img/books-img/<%= cd.getPhoto() %>" />
                                            <span class=" font-weight-bold"><a class="text-dark card-link-a" target="_blank" href="./viewBook.jsp?bookId=<%= cd.getBookId() %>"><%= cd.getBookName() %></a></span>
                                        </td>
                                        <td class="text-center">
                                            <%= cd.getPrice() %>/-
                                        </td>
                                        <td class="text-center">
                                            <% 
                                                if(!checkBookAvailableOrNot){
                                                    out.println(cd.getQuantity());
                                                } else {
                                                    out.println("0");
                                                }
                                            %>
                                        </td>
                                        <td class="text-center">
                                            <%= totalPrice %>
                                        </td>
                                        <td class="text-center">
                                            <button class="btn btn-danger btn-sm" onclick="deleteCartBook(<%= cd.getBookId() %>)" >
                                                <i class="fas fa-trash"></i> Delete
                                            </button>
                                        </td>
                                    </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                            <%
                                if(checkBookAvailable) {
                            %>
                            <div class="text-center text-danger">
                                <small class="font-weight-bold">Some books are not available</small>
                            </div>
                            <%
                                }
                            %>
                        </div>    
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <label style="font-size: 18px"><span class="font-weight-bold">Total Book Price -</span> <%= totalBookPrice %></label> <br/>
                            <label style="font-size: 18px"><span class="font-weight-bold">Delivery Charge -</span> <%= (totalBookPrice>=699)?0:70 %></label>
                        </div>
                    </div>
                    <div class="row mt-2 mb-5">
                        <div class="col-12 text-center">
                            <%
                                if(totalBookPrice!=0) {
                            %>
                                <button class="btn btn-success" onclick="location.href = './confirmOrder.jsp' ">Proceed to Confirm</button>
                            <%
                                } else {
                            %>
                                <button class="btn btn-success" disabled>Proceed to Confirm</button>
                            <%
                                }
                            %>
                        </div>
                    </div>
            <%
                } else {
            %>
            <div class="row">
                <div class="col-12 text-center text-warning">
                    <h1><i class="far fa-frown"></i></h1>
                    <h3>Empty cart.</h3>
                </div>
            </div>
            <%
                }
            %>
        </div>
        
        <script>
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
        <script src="js/myCart.js" type="text/javascript"></script>
    </body>
</html>
<%
    }
%>