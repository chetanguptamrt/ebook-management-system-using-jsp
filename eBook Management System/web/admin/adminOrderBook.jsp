<%-- 
    Document   : adminOrderBook
    Created on : 07-Jun-2021, 12:17:34 PM
    Author     : chetan
--%>


<%@page import="com.dao.admin.AdminOrderDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.database.DBConnect"%>
<%@page import="com.detail.OrderListDetail"%>
<%
    if(session.getAttribute("admin")==null){
        response.sendRedirect("./adminLogin.jsp");
    } else {
        AdminOrderDAO orderDAO = new AdminOrderDAO(DBConnect.getConnection());
        List<OrderListDetail> list = orderDAO.getOrderList();
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
        
        <div class="container-fluid mt-2 mb-5">
            <div class="row mb-1">
                <div class="col-12 text-center">
                    <h3>Order List</h3>
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
                                        <td>
                                            Delivered
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
                                            <a class="btn btn-primary btn-sm" target="_blank" href="./adminOrderView.jsp?orderId=<%= cd.getOrderID() %>" >
                                               <i class="fas fa-external-link-alt"></i> View
                                            </a>
                                        </td>
                                        <td>
                                            <button class="btn btn-success btn-sm" onclick="deliveredOrder(<%= cd.getOrderID() %>)">
                                                Delivered
                                            </button>
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
            function deliveredOrder(orderId) {
                $.ajax({
                    url: "../DeliveredOrderServlet?orderId="+orderId,
                    method: "get",
                    success: function(data){
                        if(data.trim()==="done"){
                            location.reload();
                        } else{
                            alert("Something went wrong!");
                        }
                    },
                    error: function() {
                        alert("Something went wrong!");
                    }
                });
            }
        </script>
    </body>
</html>
<%
    }
%>
