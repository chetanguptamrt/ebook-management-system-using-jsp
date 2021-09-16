<%-- 
    Document   : forgotPassword
    Created on : 09-Jun-2021, 2:20:16 PM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Forgot Password | Book Store</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row pt-4 pl-4 pr-4 pb-2">
                <div class="col-6">
                    <h3 class="text-success">
                        <i class="fas fa-book"></i> eBook
                    </h3>
                </div>
                <div class="col-6 text-right">
                    <a href="./index.jsp">Home Page</a>
                </div>
            </div>
            <hr/>
            <div class="row">
                <div class="col-12 text-center">
                    <h3>Forgot Password</h3>
                </div>
            </div>
            <div class="row mt-2 mb-5">
                <div class="col-md-6 offset-md-3">
                    <div class="text-center">
                        <small style="display: none;" id="status"></small>
                    </div>
                    <form id="forgotForm">
                        <label for="email" >Email</label>
                        <input class="form-control" type="text" placeholder="john@example.com" id="email" name="email" required="required" />
                        <div class="text-center mt-2">
                            <button type="submit" class="btn btn-primary">Send OTP</button>
                        </div>
                    </form>
                    <form id="otpConfirm">
                        <input type="password" hidden id="oEmail" name="oEmail" />
                        <label style="margin-top:10px" for="otp">OTP</label>
                        <input class="form-control" type="text" placeholder="OTP" name="otp" maxlength="6" minlength="6" id="otp" required="required"/>
                        <label style="margin-top:10px" for="password">Password</label>
                        <input class="form-control" type="password" placeholder="password" name="password" id="password" required="required" minlength="6" />
                        <div class="text-center mt-3">
                            <input class="btn btn-primary" type="submit" value="Save"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/forgotPassword.js" type="text/javascript"></script>
    </body>
</html>
