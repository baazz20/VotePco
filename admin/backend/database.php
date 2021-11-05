<?php
$servername = "sql308.epizy.com";
$username = "epiz_30247821";
$password = "pfjd3zPMq6";
$dbname = "epiz_30247821_XXX";
$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
    die("La connexion a échoué: " . mysqli_connect_error());
}
?>