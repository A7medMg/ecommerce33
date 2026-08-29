<?php

include "./connect.php";

$id = filterRequest("id");

$rating = filterRequest("rating");

$comment = filterRequest("comment");


$data = array(
    "orders_noteratting" =>  $comment,
    "orders_ratting" =>  $rating
);

updateData("orders", $data, "orders_id = $id ");