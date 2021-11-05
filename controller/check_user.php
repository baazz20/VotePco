<?php if (isset($_POST['type']) && $_POST['type'] == 'logout') {
   if ((time() - $_SESSION['LAST_ACTIVE_TIME']) > 600) {
       echo 'logout';
   }
} else {
   if (isset($_SESSION['LAST_ACTIVE_TIME'])) {
      if ((time()- $_SESSION['LAST_ACTIVE_TIME']) > 600) {
        header("Location:config/security/deconnexion.php");
        die();
      }
   }
   if (!isset($_SESSION['admin'])) {
    header("Location:index.php");
     die();
   }
}

