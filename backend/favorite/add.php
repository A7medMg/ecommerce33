<?php
include "../connect.php";
$itemsId=filterRequest("itemsId");
$usersId=filterRequest("usersId");
$data=array(
    "favorite_usersid"=>$usersId,
    "favorite_itemsid"=>$itemsId
);
insertData("favorite",$data);