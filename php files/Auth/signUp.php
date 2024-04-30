<?php
include "../connect.php";
$name     =     filterRequest('username');
$email    =     filterRequest('email');
$password =      sha1($_POST['password']);
$phone    =     filterRequest('phone');
$users_vrifycode=rand(10000,99999);

$stmt= $con->prepare("SELECT * FROM users WHERE users_email=? OR users_phone=?");
$stmt->execute(array($email,$phone));
$count=$stmt->rowCount();
if($count >0){
    printFailure();
}else{
   $data=array(
    "users_name"=>"$name",
    "users_email"=>"$email",
    "users_password"=>"$password",
    "users_phone"=>"$phone",
    "users_vrifycode"=>"$users_vrifycode",
   );
   $table="users";
   insertData($table,$data);
   sendEmail($email,'yor code',$users_vrifycode);
}