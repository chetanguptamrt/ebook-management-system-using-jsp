<%-- 
    Document   : contact
    Created on : 10-Jun-2021, 12:53:45 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./component/header.jsp" %>
        <title>Contact Us | Book Store</title>
        <style>
            .contact-del{
                font-size: 24px;
                color: #303f9f;
                padding: 3px 8px 3px 8px;
                border: 1px solid #303f9f;
                border-radius: 50%;
            }
            .contact-del-link {
                color: #303f9f;
                text-decoration: none;
            }
            .contact-del-link:hover {
                color: #303f9f;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <%@include file="./component/navbar.jsp" %>
        <div class="container-fluid cover-img">
            <div class="row">
                <div class="col-12">
                    <h3 class="text-light mt-2 mb-2 cover-img-text">Contact us</h3>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <dic class="row mt-3 mb-5">
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 text-center mt-3">
                    <label class="contact-del"><i class="fas fa-phone-alt"></i></label> <br/>
                    <a class="contact-del-link" href="tel:+91 9876543215">+91 9876543215</a> <br/>
                    <label>Support 24x7</label>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 text-center mt-3">
                    <label class="contact-del"><i class="fas fa-envelope"></i></label> <br/>
                    <a class="contact-del-link" href="mailTo:book@store.com">book@store.com</a> <br/>
                    <label>Support 24x7</label>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12 text-center mt-3">
                    <label class="contact-del"><i class="fas fa-home"></i></label> <br/>
                    <label class="m-0">Book Store</label> <br/>
                    <label class="m-0">Near Amar Ujala</label> <br/>
                    <label class="m-0">Meerut, 250002</label> 
                </div>
            </dic>
        </div>
        <script>
            $("#searchBook").attr("action","./newBook.jsp");
            $("#searchBook2").attr("action","./newBook.jsp");
        </script>
    </body>
</html>
