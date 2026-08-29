<?php
include "../../connect.php";
$name     =     filterRequest('username');
$email    =     filterRequest('email');
$password =      sha1($_POST['password']);
$phone    =     filterRequest('phone');
$users_vrifycode=rand(10000,99999);

$stmt= $con->prepare("SELECT * FROM delivery WHERE delivery_email=? OR delivery_phone=?");
$stmt->execute(array($email,$phone));
$count=$stmt->rowCount();
if($count >0){
    printFailure();
}else{
   $data=array(
    "delivery_name"=>"$name",
    "delivery_email"=>"$email",
    "delivery_password"=>"$password",
    "delivery_phone"=>"$phone",
    "delivery_vrifycode"=>"$users_vrifycode",
   );
   $table="delivery";
   insertData($table,$data);
   //sendEmail($email,'yor code',$users_vrifycode);
}