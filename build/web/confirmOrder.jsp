<%-- 
    Document   : confirmOrder
    Created on : 11-Jun-2021, 10:16:55 PM
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
        if(list.size()==0) {
            response.sendRedirect("./index.jsp");
        }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/header.jsp" %>
        <title>Confirm Order | Book Store</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container-md mt-4 mb-5">
            <div class="row mb-3">
                <div class="col-12 text-center">
                    <h3>My Cart Details</h3>
                    <small style="display: none;" id="status"></small>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                    <div style="border-radius: 15px; border-color: #555555 !important;" class="cart border p-4">
                        <div id="tableInfo">
                            <table style="width: 100% ">
                                <thead class="font-weight-bold">
                                    <tr>
                                        <td>
                                            Name
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
                                        OrderDAO orderDAO = new OrderDAO(DBConnect.getConnection());
                                        int totalPrice = 0;
                                        for(CartDetail cd : list){
                                            if(!orderDAO.checkBookAvailable(cd.getBookId())) {
                                                continue;
                                            }
                                            totalPrice += cd.getPrice();
                                    %>
                                    <tr style="border-top: 1px solid grey;">
                                        <td style=" padding-top: 3px;">
                                            <small><%= cd.getBookName() %></small>
                                        </td>
                                        <td style=" padding-top: 3px;">
                                            <small><%= cd.getQuantity()%></small>
                                        </td>
                                        <td style=" padding-top: 3px;">
                                            <small><%= cd.getPrice()%></small>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                            <hr/>
                            <small ><span class="font-weight-bold">Total Price -</span> <%= totalPrice %>/-</small> <br/>
                            <small ><span class="font-weight-bold">Delivery Charge -</span> <%= (totalPrice>=699)?0:70 %>/-</small><br/>
                            <small ><span class="font-weight-bold">Total Order Price -</span> <%= ((totalPrice>=699)?0:70)+totalPrice %>/-</small>
                            <div class="text-center mt-2 mb-3">
                                <%
                                    if(totalPrice==0){
                                        response.sendRedirect("./index.jsp");
                                    }
                                    boolean checkShip = orderDAO.checkShippingAddress(udCart.getId());
                                    if(checkShip) {
                                %>
                                    <a target="_blank" href="shippingAddress.jsp" >Edit shipping address</a><br/>
                                    <button onclick="paymentMethod()" class="mt-2 btn btn-sm btn-success">Payment Method</button>
                                <%
                                    } else {
                                %>
                                    <a target="_blank" href="shippingAddress.jsp">Add shipping address</a><br/>
                                    <button class="mt-2 btn btn-sm btn-success" disabled>Payment Method</button>

                                <%        
                                    }
                                %>
                            </div>
                        </div>
                        <div id="paymentMethod" style="display: none">
                            <label>Payment Method</label> <br/>
                            <select class="form-control" id="pMethod">
                                <option value="cod" selected>Cash On Delivery</option>
                            </select>
                            <label class="mt-3" ><span class="font-weight-bold">Total Order Price -</span> <%= ((totalPrice>=699)?0:70)+totalPrice %>/-</label><br/>
                            <div class="text-center">
                                <button onclick="confirmOrder()" class="btn btn-success mt-2">Confirm Order</button>
                            </div>
                        </div>
                        <div id="thanksForOrder" class="text-center text-success mb-3" style="display: none">
                            <span style="font-size: 42px;"><i class="far fa-smile-beam"></i></span>
                            <h3>Thanks for ordering...</h3>
                            
                            <a href="./index.jsp">Continue to shopping...</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
        <script src="./js/confirmOrder.js"></script>
    </body>
</html>
<%
    }
%>