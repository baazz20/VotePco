<?php require_once 'bdconnect.php';
  $get_id = (int) trim(htmlentities($_GET['candidatid']));
 $requete =  mysqli_query($conn, "SELECT * FROM candidat WHERE id = $get_id");
 $row = mysqli_fetch_array($requete);
 $tmp = 1;
