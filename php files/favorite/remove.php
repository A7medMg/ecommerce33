<?php
include "../connect.php";
$itemsId=filterRequest("itemsId");
$usersId=filterRequest("usersId");
deleteData("favorite","favorite_usersid = $usersId AND favorite_itemsid =$itemsId");