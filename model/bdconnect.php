<?php
function dbConnect()
{
    try
    {
        $db = new PDO('mysql:host=localhost;dbname=votepco;charset=utf8', 'root', '');
        return $db;
    }
    catch(Exception $e)
    {
        die('Cette erreur à été trouvé: '.$e->getMessage());
    }
}
