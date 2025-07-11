<?php
require('connection.php');

$makeQuery = "SELECT * FROM kala";

$stamement = $connection->prepare($makeQuery);

$stamement->execute();

$myarray = array();

while ($resultsFrom = $stamement ->fetch()) {
    array_push(
        $myarray,array(
            "id"=>$resultsFrom['id'],
            "name"=>$resultsFrom['name'],
            "code"=>$resultsFrom['code'],
            "amount"=>$resultsFrom['amount'],
        )
    );
}

?>