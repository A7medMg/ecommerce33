<?php

include '../../connect.php';



$title = filterRequest("title");

$body = filterRequest("body");

$table = "setting";

$data = array( 
    "setting_titlehome"       => $title,
    "setting_bodyhome"    => $body,
    
    );
updateData($table, $data, "setting_id  = 1");
