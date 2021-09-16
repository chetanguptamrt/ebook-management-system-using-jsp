/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function deleteAccount() {
    if(confirm("Do you want to delete your account?")){
        $.ajax({
           url: "DeleteAccountServlet",
           method: "post",
           success: function(data){
               if(data.trim()==="done"){
                   location.href = "./index.jsp";
               } else{
                   alert("Something went wrong!");
               }
           },
           error: function(){
                alert("Something went wrong!");
           }
        });
    }
}
