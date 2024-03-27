/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function paylater(id) {
    window.location.href = "paylater?id=" + encodeURIComponent(id);
}
function cancelOrder(){
    var choice = confirm("Are you sure? >:)");
}
function modifyOrder(){
    var choice = confirm("Are you sure? You can modify bettween 24 HOURS!\nIf you want to change payment method please CANCEL order!");
}

