/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $("#changePassword").on("submit",function(event){
        event.preventDefault();
        if($("#nPassword").val()===$("#cPassword").val()) {
            var f = $(this).serialize();
            $.ajax({
                url: "ChangePasswordServlet",
                data: f,
                method: "post",
                success: function(data){
                    if(data.trim()==="done") {
                        $("#status").show();
                        $("#status").removeClass("text-danger");
                        $("#status").addClass("text-success");
                        $("#status").html("Change Password Successfully");
                    } else if(data.trim()==="notMatched") {
                        $("#status").show();
                        $("#status").removeClass("text-success");
                        $("#status").addClass("text-danger");
                        $("#status").html("Old Password not Matched!");
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
        } else{
            $("#status").show();
            $("#status").removeClass("text-success");
            $("#status").addClass("text-danger");
            $("#status").html("New Password and Confirm Password are not Matched!");
        }
    });
});