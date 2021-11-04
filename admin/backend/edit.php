<?php

require_once('CnxPDO.php');

//Vérifier si l'id de la question est bien passé en paramètre dans l'URL
if(isset($_GET['id']) AND !empty($_GET['id'])){

    $IdElecteur = $_GET['id'];

    //Validation du formulaire
    if(isset($_POST['validate'])){
    
        //Vérifier si les champs sont remplis
        if(!empty($_POST['title']) AND !empty($_POST['description']) AND !empty($_POST['content'])){
    
            //Les données à faire passer dans la requête
            $new_question_title = htmlspecialchars($_POST['title']);
            $new_question_description = nl2br(htmlspecialchars($_POST['description']));
            $new_question_content = nl2br(htmlspecialchars($_POST['content']));
            
            //Modifier les informations de la question qui possède l'id rentré en paramètre dans l'URL
            $editQuestionOnWebsite = $bdd->prepare('UPDATE questions SET titre = ?, description = ?, contenu = ? WHERE id = ?');
            $editQuestionOnWebsite->execute(array($new_question_title, $new_question_description, $new_question_content, $IdElecteur));
    
            //Redirection vers la page d'affichage des questions de l'utilisateur
            header('Location: my-questions.php');
    
        }else{
            $errorMsg = "Veuillez compléter tous les champs...";
        }
    
    }
}