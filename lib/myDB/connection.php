<?php

try {

$connection = new PDO('mysql:host=localhost,dbname=rushtea1_mojoodi','rushtea1_mojoodi','A131384@?!');
$connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXECEPTION);
echo "connected";
    
} catch (PDOException $exc) {
    echo $exc ->getMassage();
    die("failed to connect");
    
}

?>