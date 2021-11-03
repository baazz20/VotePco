<?php
require('../model/bdconnect.php');
$sql = "SELECT * FROM votant WHERE 	EMAIL='$mail' AND CodeVote='$pass'";
$sql1 = "SELECT * FROM jure WHERE CodeVote='$pass'";

$result = mysqli_query($conn, $sql);
$result1 = mysqli_query($conn, $sql1);
       
