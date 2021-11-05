<?php

    $sname = "localhost";
    $unmae = "root";
    $password = "";
    
    $db_name = "votepco";
    
    $conn = mysqli_connect($sname, $unmae, $password, $db_name);
    mysqli_set_charset($conn,'utf8');
    
    if (!$conn) {
        echo "Echec de connexion!";
    }

