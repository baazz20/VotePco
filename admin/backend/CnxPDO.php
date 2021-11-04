<?php
// connection a la base de donnee bd_ivoire . 
try{
    $bdd = new PDO("mysql:host=localhost;dbname=votepco","root","");
}
catch(PDOException $e){
    echo $e->getMessage();
}
?>