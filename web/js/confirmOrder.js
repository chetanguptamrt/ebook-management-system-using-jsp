/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function paymentMethod() {
    $("#tableInfo").hide();
    $("#paymentMethod").show();
}
function confirmOrder() {
    $.ajax({
        url: "UserConfirmOrderServlet?pMethod="+$("#pMethod").val(),
        method: "post",
        success: function(data) {
            if(data.trim()==="done"){
                $("#tableInfo").hide();
                $("#paymentMethod").hide();
                $("#thanksForOrder").show();
                $.ajax({
                    url: "UserTotalCartServlet",
                    method: "get",
                    success: function(data) {
                        $("#navbarTotalCart").html(data.trim());
                    },
                    error: function() {
                        alert("Something went wrong!");
                    }
                });
            } else if(data.trim()==="verify"){
                alert("Please verify your email...");
            } else {
                alert("Something went wrong!");
            }
        },
        error: function(){
            alert("Something went wrong!");                        
        }
    });
}
