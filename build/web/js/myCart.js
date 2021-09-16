/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deleteCartBook(bookId) {
    $.ajax({
        url: "UserDeleteCartServlet?bookId="+bookId,
        method: "get",
        success: function(data){
            if(data.trim()==="") {
                location.reload();
            } else {
                alert("Something went wrong!");
            }
        },
        error: function() {
            alert("Something went wrong!");
        }
    });
}