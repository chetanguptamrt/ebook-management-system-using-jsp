<%-- 
    Document   : shippingAddress
    Created on : 11-Jun-2021, 12:59:44 PM
    Author     : chetan
--%>


<%@page import="com.detail.ShippingDetail"%>
<%@page import="com.dao.ShippingDAO"%>
<%
    if(session.getAttribute("userL")==null){
        response.sendRedirect("./index.jsp");
    } else {
        UserDetail shipUd = (UserDetail) session.getAttribute("userL");
        ShippingDAO shipDAO = new ShippingDAO(DBConnect.getConnection());
        ShippingDetail sd = shipDAO.getAddress(shipUd.getId());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/header.jsp" %>
        <title>Shipping Address | Book Store</title>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        
        <div class="container-md mt-3 mb-5">
            <div class="row mb-1">
                <div class="col-12 text-center">
                    <h3>Shipping Address</h3>
                    <small style="display: none;" id="status"></small>
                </div>
            </div>
            <form id="shippingAddress">
                <%
                    if(sd==null) {
                %>
                <div class="row">
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="name" class="mt-2 font-weight-bold">Full Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="name" id="name" maxlength="30" required="required" placeholder="Enter Your Full Name" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="phone" class="mt-2 font-weight-bold">Phone Number <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" name="phone" id="phone" required="required" placeholder="+91 9638527410" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="add1" class="mt-2 font-weight-bold">Address Line 1 <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="add1" id="add1" maxlength="30" required="required" placeholder="Address Line 1" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="add2" class="mt-2 font-weight-bold">Address Line 2</label>
                        <input type="text" class="form-control" name="add2" id="add2" maxlength="30" placeholder="Address Line 2" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="lMark" class="mt-2 font-weight-bold">Landmark <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="lMark" id="lMark" maxlength="30" required="required" placeholder="Landmark" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="city" class="mt-2 font-weight-bold">City <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="city" id="city" maxlength="30" required="required" placeholder="City" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="pin" class="mt-2 font-weight-bold">Pin Code <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" name="pin" id="pin" required="required" placeholder="For eg: 250002" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center mt-3">
                        <button type="submit" class="btn btn-primary" >Save</button>
                    </div>
                </div>
                <%
                    } else {
                %>
                <div class="row">
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="name" class="mt-2 font-weight-bold">Full Name <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" value="<%= sd.getName() %>" name="name" id="name" maxlength="30" required="required" placeholder="Enter Your Full Name" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="phone" class="mt-2 font-weight-bold">Phone Number <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" value="<%= sd.getPhone() %>" name="phone" id="phone" required="required" placeholder="+91 9638527410" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="add1" class="mt-2 font-weight-bold">Address Line 1 <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" value="<%= sd.getAddress1() %>" name="add1" id="add1" maxlength="30" required="required" placeholder="Address Line 1" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="add2" class="mt-2 font-weight-bold">Address Line 2</label>
                        <input type="text" class="form-control" value="<%= sd.getAddress2() %>" name="add2" id="add2" maxlength="30" placeholder="Address Line 2" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="lMark" class="mt-2 font-weight-bold">Landmark <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" value="<%= sd.getLandmark() %>" name="lMark" id="lMark" maxlength="30" required="required" placeholder="Landmark" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="city" class="mt-2 font-weight-bold">City <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" value="<%= sd.getCity() %>" name="city" id="city" maxlength="30" required="required" placeholder="City" />
                    </div>
                    <div class="col-xl-6 offset-xl-3 col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-sm-8 offset-sm-2 col-12">
                        <label for="pin" class="mt-2 font-weight-bold">Pin Code <span class="text-danger">*</span></label>
                        <input type="number" class="form-control" value="<%= sd.getPinCode() %>" name="pin" id="pin" required="required" placeholder="For eg: 250002" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-center mt-3">
                        <button type="submit" class="btn btn-primary" >Update</button>
                    </div>
                </div>
                <%
                    }
                %>
            </form>
        </div>
        
        <script>
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
        <script src="js/shippingAddress.js" type="text/javascript"></script>
    </body>
</html>
<%
    }
%>
