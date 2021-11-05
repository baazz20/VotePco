<?php

    $sname = "sql308.epizy.com";
    $unmae = "epiz_30247821";
    $password = "pfjd3zPMq6";
    
    $db_name = "epiz_30247821_votepco";
    
    $conn = mysqli_connect($sname, $unmae, $password, $db_name);
    mysqli_set_charset($conn,'utf8');
    
    if (!$conn) {
        echo "Echec de connexion!";
    }

