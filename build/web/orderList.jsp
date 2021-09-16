<%-- 
    Document   : orderList
    Created on : 12-Jun-2021, 5:53:42 PM
    Author     : chetan
--%>


<%@page import="com.detail.OrderListDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.OrderDAO"%>
<%
    if(session.getAttribute("userL")==null){
        response.sendRedirect("./index.jsp");
    } else {
        UserDetail udCart = (UserDetail) session.getAttribute("userL");
        OrderDAO orderDAO = new OrderDAO(DBConnect.getConnection());
        List<OrderListDetail> list = orderDAO.getOrderList(udCart.getId());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/header.jsp" %>
        <title>My Order | Book Store</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container-md mt-4 mb-5">
            <div class="row mb-3">
                <div class="col-12 text-center">
                    <h3>My Order</h3>
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
                                            Order No
                                        </td>
                                        <td>
                                            Price
                                        </td>
                                        <td>
                                            Time
                                        </td>
                                        <td>
                                            Payment Method
                                        </td>
                                        <td>
                                            Status
                                        </td>
                                        <td>
                                            View
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
                                    int srNo = 0;
                                    for(OrderListDetail cd : list) {
                                        srNo += 1;
                                %>
                                    <tr>
                                        <td>
                                            <%= srNo %>
                                        </td>
                                        <td>
                                            <%= cd.getOrderID() %>
                                        </td>
                                        <td>
                                            <%= cd.getPrice() %>/-
                                        </td>
                                        <td>
                                            <%= cd.getDate() %>
                                        </td>
                                        <td>
                                            <%= cd.getPaymentMethod() %>
                                        </td>
                                        <td>
                                            <%= cd.getStatus() %>
                                        </td>
                                        <td>
                                            <a class="btn btn-primary btn-sm" target="_blank" href="./orderView.jsp?orderId=<%= cd.getOrderID() %>" >
                                               <i class="fas fa-external-link-alt"></i> View
                                            </a>
                                        </td>
                                    </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>    
                    </div>
            <%
                } else {
            %>
            <div class="row">
                <div class="col-12 text-center text-warning">
                    <h1><i class="far fa-frown"></i></h1>
                    <h3>Empty Order List.</h3>
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
    </body>
</html>
<%
    }
%>