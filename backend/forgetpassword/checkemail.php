<?php
include "../connect.php";

$email    =     filterRequest('email');
$users_vrifycode=rand(10000,99999);



$stmt= $con->prepare("SELECT * FROM users WHERE users_email=? ");
$stmt->execute(array($email));
$count=$stmt->rowCount();
result($count);
if($count>0){
    $data=array("users_vrifycode"=>$users_vrifycode);
    updateData('users',$data,"users_email='$email'",false);
}