<?php
// connection a la base de donnee bd_ivoire . 
try{
    $bdd = new PDO("mysql:host=sql308.epizy.com;dbname=epiz_30247821_XXX","epiz_30247821","pfjd3zPMq6");
    
}
catch(PDOException $e){
    echo $e->getMessage();
}
?>