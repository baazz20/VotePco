<?php



$idVotant = $_SESSION['IDVOTANT'];
$question_date = date('d/m/Y H:i:s', time() - date('Z'));
$codevote = $_SESSION['CodeVote'];

if (isset($_POST['valider'])) {

  $codeSaisir = $_POST['codeVote'];
  $confimVote = $_POST['confirm'];

  // verifie si les champs sont bien remplis
  if (empty($codeSaisir)) {
    header("Location: candidat.php?candidatid=$get_id?error= Le code d'électeur nécessaire");
    exit();
  } else {
    // verifie si le compte existe et a le droid de voter
    if ($codevote == $codeSaisir) {
      // verifie si elle a deja voté
      $select = mysqli_query($conn, "SELECT * FROM est_vote WHERE idVotant = '" . $idVotant . "'");
      if (mysqli_num_rows($select)) {
        $vote = true;
        $errorMsg = ' <div class="alert alert-warning" role="alert">
        <span class="alert-icon"><i class="ni ni-like-2"></i></span>
        <span class="alert-text"><strong>Attension!</strong> Vous Avez deja voté!</span>
    </div>';
      } else {

        // insertion dans la table est_vote pour confimer le vote
        $query = "INSERT INTO est_vote(
                 idVotant,
                 idCandidat,
                 dateVote) VALUES (
                 '$idVotant',
                 '$get_id',
                 '$question_date')";
        $query_run = mysqli_query($conn, $query);

        if ($query_run) {
          $success = '<div class="alert alert-success alert-dismissible fade show" role="alert">
          <span class="alert-icon"><i class="ni ni-like-2"></i></span>
          <span class="alert-text"><strong>Success!</strong> Merci d\'avoir voté!</span>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
          </button>
      </div>';
        } else {
          // header("Location: ../tables.php");
          echo 'requette non executer';
        }
      }
    } else {
      $nonvalide = '<div class="alert alert-danger alert-dismissible fade show" role="alert">
      <span class="alert-icon"><i class="ni ni-like-2"></i></span>
      <span class="alert-text"><strong>Danger!</strong> Ce code n\'est pas valide !</span>
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
      </button>
  </div>';
    }
  }





  // } else {
  //     // $erreur = "vous n'etre autorisé a ouvrir un compte";
  //     // header("Location: ../tables.php");
  //     echo "vous n'etre autorisé a ouvrir un compte";

  // }

}
