<?php
include '../connect.php';
$users_vrifycode=rand(10000,99999);

$email=filterRequest('email');
$data=array(
    "users_vrifycode"=>$users_vrifycode
);
updateData("users",$data,"users_email='$email'");
sendEmail($email,'yor code',$users_vrifycode);
