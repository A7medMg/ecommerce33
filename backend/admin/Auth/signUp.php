<?php
include "../../connect.php";
$name     =     filterRequest('username');
$email    =     filterRequest('email');
$password =      sha1($_POST['password']);
$phone    =     filterRequest('phone');
$users_vrifycode=rand(10000,99999);

$stmt= $con->prepare("SELECT * FROM admin WHERE admin_email=? OR admin_phone=?");
$stmt->execute(array($email,$phone));
$count=$stmt->rowCount();
if($count >0){
    printFailure();
}else{
   $data=array(
    "admin_name"=>"$name",
    "admin_email"=>"$email",
    "admin_password"=>"$password",
    "admin_phone"=>"$phone",
    "admin_verfiycode"=>"$users_vrifycode",
   );
   $table="admin";
   insertData($table,$data);
   //sendEmail($email,'yor code',$users_vrifycode);
}