/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("#forgotForm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./ForgotOTPServlet",
            data: f,
            method: "post",
            success: function(data){
                if(data.trim()==="noUser") {
                    $("#status").show();
                    $("#status").removeClass("text-success");
                    $("#status").addClass("text-danger");
                    $("#status").html("No user found!");
                } else if(data.trim()==="done") {
                    $("#status").show();
                    $("#status").removeClass("text-danger");
                    $("#status").addClass("text-success");
                    $("#status").html("OTP send on email");
                    $("#oEmail").val($("#email").val().trim());
                    $("#email").prop('disabled', true);
                } else {
                    $("#status").show();
                    $("#status").removeClass("text-success");
                    $("#status").addClass("text-danger");
                    $("#status").html("Something went wrong!");
                }
            },
            error: function(){
                $("#status").show();
                $("#status").removeClass("text-success");
                $("#status").addClass("text-danger");
                $("#status").html("Something went wrong!");
            }
        });
    });
    $("#otpConfirm").on("submit",function(event){
        event.preventDefault();
        var f = $(this).serialize();
        $.ajax({
            url: "./ForgotPasswordServlet",
            data: f,
            method: "post",
            success: function(data){
                if(data.trim()==="invalid") {
                    $("#status").show();
                    $("#status").removeClass("text-success");
                    $("#status").addClass("text-danger");
                    $("#status").html("OTP not matched!");
                } else if(data.trim()==="done") {
                    location.href = "./index.jsp";
                } else {
                    $("#status").show();
                    $("#status").removeClass("text-success");
                    $("#status").addClass("text-danger");
                    $("#status").html("Something went wrong!");
                }
            },
            error: function(){
                $("#status").show();
                $("#status").removeClass("text-success");
                $("#status").addClass("text-danger");
                $("#status").html("Something went wrong!");
            }
        });
    });
});