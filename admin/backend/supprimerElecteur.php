<?php
            session_start();
            require_once('CnxPDO.php');

            $idf=isset($_GET['idF'])?$_GET['idF']:0;

            $requete="select * from votant where IDVOTANT=$idf";
            $resultat=$bdd->query($requete);
            $tabCount=$resultat->fetch();
            if(count($nbrStag)==0){
                $requete="delete from votant where IDVOTANT=?";
                $params=array($idf);
                $resultat=$bdd->prepare($requete);
                $resultat->execute($params);
                header('location:../electeur.php');
            }else{
                $msg="Suppression impossible: Vous devez supprimer tous les stagiaires inscris dans cette filière";
                header("location:alerte.php?message=$msg");
            }
    
?>