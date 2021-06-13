<%-- 
    Document   : adminLogin
    Created on : 06-Jun-2021, 9:51:35 AM
    Author     : chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <title>Admin Panel | Book Store</title>
        <style>
            .center{
                position: absolute;
                top: 50%;
                left: 50%;
                width: 370px;
                height: 260px;
                margin-top: -130px;
                margin-left: -185px;
                border:1px solid black;
                background-color: rgba(0,0,0,0.7);
            }
        </style>
    </head>
    <body style="background: url('../img/bookCover.jpg') no-repeat center center fixed; background-size: cover;">
        <div class="center">
            <h3 class="text-light text-center m-2">Admin Login</h3>
            <div class="text-center">
                <small id="status" class="text-danger" style="display:none;">Invalid username or password</small>
            </div>
            <form id="adminLogin">
                <table cellpadding="3" class="text-light table">
                    <tbody>
                        <tr>
                            <td style="border: none;" id="name">
                                Username
                            </td>
                            <td style="border: none;">
                                <input placeholder="Username" class="form-control" type="text" name="name" required="required" id="name"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none;" id="password">
                                Password
                            </td>
                            <td style="border: none;" >
                                <input placeholder="Password" class="form-control" type="password" name="password" required="required" id="password"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="border: none;" class="text-center" colspan="2">
                                <input class="btn btn-outline-success" value="Login" type="submit"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function(){
                $("#adminLogin").on("submit",function(event){
                    event.preventDefault();
                    var f = $(this).serialize();
                    $.ajax({
                        url:"../AdminLoginServlet",
                        data: f,
                        methos: "post",
                        success: function(data){
                            if(data.trim()==="done"){
                                location.href = "./adminPanel.jsp";
                            }
                            else{
                                $("#status").show();
                            }
                        },
                        error: function(){
                            $("status").show();
                        }
                    });
                });
            });
        </script>
    </body>
</html>