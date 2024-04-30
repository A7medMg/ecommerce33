<?php 

include "../connect.php" ;

$email  = filterRequest("email") ; 

$verfiy =  sha1($_POST['password']);


$stmt = $con->prepare("SELECT * FROM users WHERE users_email = '$email' AND users_vrifycode = '$verfiy' ") ; 
 
$stmt->execute() ; 

$count = $stmt->rowCount() ; 

result($count);
?>