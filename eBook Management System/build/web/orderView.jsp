<%-- 
    Document   : orderView
    Created on : 12-Jun-2021, 9:30:53 PM
    Author     : chetan
--%>


<%@page import="com.detail.OrderCartList"%>
<%@page import="com.detail.OrderListDetail"%>
<%@page import="com.dao.OrderDAO"%>
<%
    if(session.getAttribute("userL")==null){
        response.sendRedirect("./index.jsp");
    } else {
        UserDetail ud3 = (UserDetail) session.getAttribute("userL");
        int orderId = 0;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch(Exception e) {
            orderId = 0;
        }
        OrderDAO orderDAO = new OrderDAO(DBConnect.getConnection());
        OrderListDetail old = orderDAO.getOrderView(ud3.getId(), orderId);
        if(old==null){
            response.sendRedirect("./index.jsp");
        }
        try {
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
        
        <div class="container-md mt-3 mb-5">
            <div class="row mb-3">
                <div class="col-12 text-center">
                    <h3>My Order</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <label><span class="font-weight-bold">Order No - </span><%= old.getOrderID() %></label><br/>
                    <label><span class="font-weight-bold">Total Order Price - </span><%= old.getPrice() %></label><br/>
                    <label><span class="font-weight-bold">Order date - </span><%= old.getDate() %></label><br/>
                    <label><span class="font-weight-bold">Payment mode - </span><%= old.getPaymentMethod() %></label><br/>
                    <label><span class="font-weight-bold">Status - </span><%= old.getStatus() %></label><br/>
                    <label><span class="font-weight-bold">Name - </span><%= old.getName() %></label><br/>
                    <label><span class="font-weight-bold">Phone - </span><%= old.getPhone() %></label><br/>
                    <label><span class="font-weight-bold">Address Line 1 - </span><%= old.getAddress1() %></label><br/>
                    <label><span class="font-weight-bold">Address Line 1 - </span><%= old.getAddress2() %></label><br/>
                    <label><span class="font-weight-bold">Landmark - </span><%= old.getLandmark() %></label><br/>
                    <label><span class="font-weight-bold">City - </span><%= old.getCity() %></label><br/>
                    <label><span class="font-weight-bold">Pin code - </span><%= old.getPinCode() %></label><br/>
                    <h5 class="text-center">
                        Book List
                    </h5>
                    <div class="table-responsive">
                        <table class="table table-striped" style="width: 100%">
                            <thead>
                                <tr>
                                    <td>
                                        Book Name
                                    </td>
                                    <td>
                                        Author Name
                                    </td>
                                    <td>
                                        Quantity
                                    </td>
                                    <td>
                                        Price
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for(OrderCartList ocl : old.getOcl()) {
                                %>
                                <tr>
                                    <td>
                                        <%= ocl.getBookName() %>
                                    </td>
                                    <td>
                                        <%= ocl.getAuthorName() %>
                                    </td>
                                    <td>
                                        <%= ocl.getQuantity() %>
                                    </td>
                                    <td>
                                        <%= ocl.getPrice() %>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
        </div>
        
        <script>
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
    </body>
</html>
<%
    }
    catch(Exception e) {}
    }
%>