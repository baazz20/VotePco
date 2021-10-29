<?php
session_start();
if (!$_SESSION['auth']) {
    header('Location: view/sign-in.php');
}else{
    require('controller/welcomeController.php');
}
?>