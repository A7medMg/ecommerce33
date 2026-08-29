
<?php 

include "../connect.php" ; 

$userid = filterRequest("usersid") ; 

getAllData('ordersview' , "orders_usersid = '$userid' AND orders_status !=  4") ; 

?>