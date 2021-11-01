<?php
include 'database.php';


if (isset($_POST['valider'])) {

    $imgname = $_FILES['photoCandidat']['name'];
    $extension = pathinfo($imgname, PATHINFO_EXTENSION);
    $randomno = rand(0, 100000);
    $rename = $_POST['email'] . "_" . date('Ymd') . $randomno;
    $photo = $rename . '.' . $extension;
    $filename = $_FILES['photoCandidat']['tmp_name'];

    if (move_uploaded_file($filename, '../assets/uploads/picture/' . $photo)) {
    } else {
        $errorMsg = "Fichier non telechargé";
    }    
   
    $nom = $_POST['name'];
    $prenom = $_POST['lastname'];
    $genre = $_POST['gender'];
    $email = $_POST['email'];
    $tel = $_POST['phone'];
    $description = $_POST['description'];


    // verifie si le compte existe deja
    $select = mysqli_query($conn, "SELECT * FROM candidat WHERE photo = '" .  $photo . "'");
    if (mysqli_num_rows($select)) {
        $errorMsg = "Ce compte existe dejà !";
    } else {
        // insertion dans la table client
        $query = "INSERT INTO candidat(
                name,
                lastname,
                gender,
                email,
                phone,
                description,
                photo) VALUES (
                '$nom',
                '$prenom',
                '$genre',
                '$email',
                '$tel',
                '$description',
                '$photo')";
        $query_run = mysqli_query($conn, $query);
        // move_uploaded_file($_FILES['photo']['tmp_name'], "uploads/$photo");

        if ($query_run) {
            header("Location: ../candidat.php");
        } else {
            // header("Location: ../tables.php");
            echo 'requette non executer';
        }
    }
    var_dump($conn);

    // } else {
    //     // $erreur = "vous n'etre autorisé a ouvrir un compte";
    //     // header("Location: ../tables.php");
    //     echo "vous n'etre autorisé a ouvrir un compte";

    // }

}

// if(count($_POST)>0){
// 	if($_POST['type']==2){
// 		$id=$_POST['id'];
// 		$name=$_POST['name'];
//         $lastname=$_POST['lastname'];
// 		$email=$_POST['email'];
// 		$phone=$_POST['phone'];
// 		$description=$_POST['description'];
// 		$sql = "UPDATE `crud` SET `name`='$name',`email`='$email',`phone`='$phone',`description`='$description' WHERE id=$id";
// 		if (mysqli_query($conn, $sql)) {
// 			echo json_encode(array("statusCode"=>200));
// 		} 
// 		else {
// 			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
// 		}
// 		mysqli_close($conn);
// 	}
// }
// if(count($_POST)>0){
// 	if($_POST['type']==3){
// 		$id=$_POST['id'];
// 		$sql = "DELETE FROM `crud` WHERE id=$id ";
// 		if (mysqli_query($conn, $sql)) {
// 			echo $id;
// 		} 
// 		else {
// 			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
// 		}
// 		mysqli_close($conn);
// 	}
// }
// if(count($_POST)>0){
// 	if($_POST['type']==4){
// 		$id=$_POST['id'];
// 		$sql = "DELETE FROM crud WHERE id in ($id)";
// 		if (mysqli_query($conn, $sql)) {
// 			echo $id;
// 		} 
// 		else {
// 			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
// 		}
// 		mysqli_close($conn);
// 	}
// }

