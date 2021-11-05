<?php
session_start();
if (isset($_POST['email']) && isset($_POST['code'])) {
    function validate($data)
    {
        $data = trim($data); //Supprimer les espaces (ou d'autres caractères) au début et à la fin d'une chaîne
        $data = stripslashes($data); //Supprimer les guillemets d'une chaîne entre guillemets
        $data = htmlspecialchars($data); //Convertir des caractères spéciaux en entités HTML
        return $data;
    }

    $mail = validate($_POST['email']);
    $pass = validate($_POST['code']);

    if (empty($mail)) {
        header("Location: ../view/sign-in.php?error= L'email' est nécessaire");
        exit();
    } elseif (empty($pass)) {
        header("Location: ../view/sign-in.php?error= Le code d'électeur nécessaire");
        exit();
    } else {
        require('../model/sign-inModel.php');
        if (mysqli_num_rows($result) === 1) {
            $row = mysqli_fetch_assoc($result);
            if ($row['EMAIL'] === $mail && $row['CodeVote'] === $pass){
                $_SESSION['EMAIL'] = $row['EMAIL'];
                $_SESSION['NOM'] = $row['NOM'];
                $_SESSION['IDVOTANT'] = $row['IDVOTANT'];
                $_SESSION['PRENOM'] = $row['PRENOM'];
                $_SESSION['SEXE'] = $row['SEXE'];
                $_SESSION['CodeVote'] = $row['CodeVote'];
                $_SESSION['auth'] = true;  // declare la session simple votant
                // verifie si il est juré
                if (mysqli_num_rows($result1) === 1) {
                    $row1 = mysqli_fetch_assoc($result1);
                    if ($row1['CodeVote'] === $row['CodeVote']) {
                        $_SESSION['admin'] = true; // declare la session jure
                    } else {
                        header("Location: ../index.php"); // redirection vers page d'acceuil avec la session votant simple demmaré
                    }
                    // verifie si il est candidat
                    if (mysqli_num_rows($result2) === 1) {
                        $row2 = mysqli_fetch_assoc($result2);
                        if ($row2['CodeVote'] === $row['CodeVote']) {
                            $_SESSION['candidat'] = true; // declare la session candidat
                        } else {
                            header("Location: ../index.php"); // redirection vers page d'acceuil avec la session votant simple demmaré
                        }
                 header("Location: ../index.php"); // redirection vers page d'acceuil avec la session votant simple demmaré
                    } else {
                        header("Location: ../index.php");
                    }
                } else {
                    header("Location: ../index.php");
                }
                exit();
            } else {
                header("Location: ../view/sign-in.php?error=Pseudo ou mot de passe incorrect");
                exit();
            }
        } else {
            header("Location: ../view/sign-in.php?error=Pseudo ou mot de passe incorrect");
            exit();
        }
    }
} else {
    header("Location: ../index.php");
    exit();
}