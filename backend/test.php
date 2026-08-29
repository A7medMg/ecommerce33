<?php 
include "connect.php";
/*
$table="users";
$data=array(
    "users_name"=>"Ahmed",
    "users_email"=>"ahmed@gmail.com",
    "users_phone"=>"2415546415",
    "users_vrifycode"=>"21556",
   

);
$count=insertData($table,$data);*/
//getAllData('users','1=1');


$notAuth = "" ; 


 
sendGCM("hi"  , "صلي ع النبي" , "users19" , "" , "") ; 

echo "Send"  ;

?>
