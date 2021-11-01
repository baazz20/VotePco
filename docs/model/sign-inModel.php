<?php
require('../model/bdconnect.php');
$sql = "SELECT * FROM votant WHERE 	EMAIL='$mail' AND CodeVote='$pass'";

$result = mysqli_query($conn, $sql);
       
