<?php 

include "../../connect.php" ; 

$ordersid = filterRequest("id")  ;

getAllData("ordersview" , "cart_orders = $ordersid "); 

?>