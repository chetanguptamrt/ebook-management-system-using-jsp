/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function addCart(bookId){
    $.ajax({
        url: "UserAddCartServlet?bookId="+bookId,
        method: "get",
        success: function(data){
            if(data.trim()==="login"){
                alert("Please login...");
            } else if(data.trim()==="done"){
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
            }
        },
        error: function() {
            alert("Something went wrong!");
        }
    });
}
function addCart2(bookId){
    $.ajax({
        url: "UserAddCartServlet?bookId="+bookId,
        method: "get",
        success: function(data){
            if(data.trim()==="login"){
                alert("Please login...");
            } else if(data.trim()==="done"){
            }
        },
        error: function() {
            alert("Something went wrong!");
        }
    });
    location.href="./myCart.jsp";
}