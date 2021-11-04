<?php
include 'database.php';


if (isset($_POST['valider'])) {

    $imgname = $_FILES['photoElecteur']['name'];
    $extension = pathinfo($imgname, PATHINFO_EXTENSION);
    $randomno = rand(0, 100000);
    $rename = $_POST['email'] . "_" . date('Ymd') . $randomno;
    $photo = $rename . '.' . $extension;
    $filename = $_FILES['photoElecteur']['tmp_name'];

    if (move_uploaded_file($filename, '../assets/uploads/picture/' . $photo)) {
    } else {
        $errorMsg = "Fichier non telechargé";
    }    
   
    $nom = $_POST['name'];
    $prenom = $_POST['lastname'];
    $genre = $_POST['gender'];
    $email = $_POST['email'];
    $ramdomid = rand(0, 9999);
    $cdvtbrut = "$ramdomid$nom$prenom";
    $codevote = substr( $cdvtbrut , 0, 7 );



    // verifie si le compte existe deja
    $select = mysqli_query($conn, "SELECT * FROM votant WHERE Email = '" .  $email . "'");
    if (mysqli_num_rows($select)) {
        $errorMsg = "Ce compte existe dejà !";
    } else {
        // insertion dans la table client
        $query = "INSERT INTO votant(
                NOM,
                PRENOM,
                EMAIL,
                SEXE,
                CodeVote,
                photo) VALUES (
                '$nom',
                '$prenom',
                '$email',
                '$genre',
                '$codevote',
                '$photo')";
        $query_run = mysqli_query($conn, $query);
        // move_uploaded_file($_FILES['photo']['tmp_name'], "uploads/$photo");

        if ($query_run) {
            header("Location: ../electeur.php");
        } else {
            // header("Location: ../tables.php");
            echo 'requette non executer';
        }
    }
    var_dump($conn);
}