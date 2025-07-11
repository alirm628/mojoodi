<?php
include 'config';

$user_name = $_POST['user_name'];
$pass = $_POST['pass'];

$sqlQuery = "SELECT * FROM  user WHERE user_name = '$user_name' AND pass = '$pass'";

$rslt = $connect->query($sqlQuery);

if ($rslt->num_rows > 0) {
    $userRecord = array();
    while ($rowFound = $rslt->fetch_assoc()) {
        $userRecord = $rowFound;
    }

    echo json_encode(
        array(
            "success"=>true,
            "userData"=>$userRecord[0]
            )
    );
}
else {
    echo json_encode(array("success"=>false));
}
?>