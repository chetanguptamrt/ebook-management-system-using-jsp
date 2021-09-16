/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#registerForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "UserRegistrationServlet",
            data: f,
            method: "post",
            success: function(data){
                if(data.trim()==="done"){
                    location.reload();
                } else if(data.trim()==="alreadyUser") {
                    $("#rStatus").show();
                    $("#rStatus").html("User already exist!");
                } else {
                    $("#rStatus").show();
                    $("#rStatus").html("Something went wrong!");
                }
            },
            error: function(){
                $("#rStatus").show();
                $("#rStatus").html("Something went wrong!");
            }
        });
    });
    $("#loginForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "UserLoginServlet",
            data: f,
            method: "post",
            success: function(data){
                if(data.trim()==="done"){
                    location.reload();
                } else if(data.trim()==="invalid") {
                    $("#lStatus").show();
                    $("#lStatus").html("Please provide valid credentials!");
                } else {
                    $("#lStatus").show();
                    $("#lStatus").html("Something went wrong!");
                }
            },
            error: function(){
                $("#lStatus").show();
                $("#lStatus").html("Something went wrong!");
            }
        });
    });
});
