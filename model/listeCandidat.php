<?php require_once 'bdconnect.php';

$ret = mysqli_query($conn, "SELECT * FROM candidat");
$cnt = 1;
$row = mysqli_num_rows($ret);
?>
<section class="pt-3 pb-4" id="count-stats">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 mx-auto py-3">
                <div class="row">
                    <div class="col-md-4 position-relative">
                        <div class="p-3 text-center">
                            <h1 class="text-gradient text-primary"><span id="state1" countto="70">
                                    <?php
                                    $ret1 = mysqli_query($conn, "select * from votant");
                                    $cnt1 = 0;
                                    $row1 = mysqli_num_rows($ret1);
                                    if ($row1 > 0) {
                                        while ($row1 = mysqli_fetch_array($ret1)) {
                                            $cnt1 = $cnt1 + 1;
                                        }
                                    }  ?>
                                    <?php
                                    $ret2 = mysqli_query($conn, "select * from est_vote");
                                    $cnt2 = 0;
                                    $row2 = mysqli_num_rows($ret1);
                                    if ($row2 > 0) {
                                        while ($row2 = mysqli_fetch_array($ret2)) {
                                            $cnt2 = $cnt2 + 1;
                                        }
                                    }  ?>
                                    <?= ($cnt1 * $cnt2) / 100; ?></span>%</h1>
                            <h5 class="mt-3">De participation</h5>
                            <p class="text-sm font-weight-normal">Le taux de participation dans cette celection</p>
                        </div>
                        <hr class="vertical dark">
                    </div>
                    <div class="col-md-4 position-relative">
                        <div class="p-3 text-center">
                            <h1 class="text-gradient text-primary"> <span id="state2" countto="15">
                                    <?= 100 - (($cnt1 * $cnt2) / 100); ?></span>%</h1>
                            <h5 class="mt-3">sans voix</h5>
                            <p class="text-sm font-weight-normal">Le taux de personne sans voix dans cette election</p>
                        </div>
                        <hr class="vertical dark">
                    </div>
                    <div class="col-md-4">
                        <div class="p-3 text-center">
                            <h1 class="text-gradient text-primary" id="state3" countto="4"><?= $cnt1; ?></h1>
                            <h5 class="mt-3">Nombre d'élècteur</h5>
                            <p class="text-sm font-weight-normal">Le nombre total de personne participant à cette
                                élèction</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<div class="section text-center">
    <h2 class="title mb-5">Liste des candidats</h2>
</div>

<?php if ($row > 0) {
    while ($row = mysqli_fetch_array($ret)) { ?>
<?php
        $ret4 = mysqli_query($conn, "SELECT * FROM iinfocandidat WHERE idCandidat = '" .  $row['id'] . "'");
        $cnt4 = 0;
        $row4 = mysqli_num_rows($ret4);
        if ($row4 > 0) {
            while ($row4 = mysqli_fetch_array($ret4)) {
                $cnt4 = $cnt4 + 1;
            }
        }  ?>
<section class="my-5 py-5">
    <div class="container">
        <div class="text-center">

            <h2 class="title"><?= $row['lastname']; ?> <?= $row['name']; ?></h2>
            <br>
            <hr>
        </div>
        <div class="row align-items-center">
            <div class="col-lg-4 ms-auto me-auto p-lg-4 mt-lg-0 mt-4">
                <div class="rotating-card-container">
                    <div
                        class="card card-rotate card-background card-background-mask-primary shadow-primary mt-md-0 mt-5">
                        <div class="front front-background"
                            style="background-image: url(https://images.unsplash.com/photo-1569683795645-b62e50fbf103?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=987&amp;q=80); background-size: cover;">
                            <div class="card-body py-7 text-center">
                                <i class="material-icons text-white text-4xl my-3">touch_app</i>
                                <h3 class="text-white"><?= $row['lastname']; ?><br> <?= $row['name']; ?></h3>
                                <p class="text-white opacity-8">Etudiant en Licence 3 de MIAGE-GI, candidat au poste de
                                    President du commité d'organisation de la Journée d'intégration</p>
                            </div>
                        </div>
                        <div class="back back-background"
                            style="background-image: url(https://images.unsplash.com/photo-1498889444388-e67ea62c464b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;ixlib=rb-1.2.1&amp;auto=format&amp;fit=crop&amp;w=1365&amp;q=80); background-size: cover;">
                            <div class="card-body pt-7 text-center">
                                <h3 class="text-white">Votes Moi</h3>
                                <p class="text-white opacity-8"> <?php if (isset($row4['theme'])) {
                                                                                echo $row4['theme'];
                                                                            } else {
                                                                                echo 'Aucun thème reçu de la part du candidat ' . $row['name'];
                                                                            }; ?></p>
                                <a <?php if (!isset($_SESSION['auth'])) { ?> data-bs-toggle="modal"
                                    data-bs-target="#modal-notification" <?php  } else { ?>
                                    href="view/candidat.php?candidatid=<?php echo htmlentities($row['id']); ?>"
                                    <?php  }; ?> class="btn btn-white btn-sm w-50 mx-auto mt-3">Je Vote <?= $row['name']; ?></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 ms-auto">
                <div class="row justify-content-start">
                    <div class="col-md-6">
                        <div class="info">
                            <i class="material-icons text-gradient text-primary text-3xl">content_copy</i>
                            <h5 class="font-weight-bolder mt-3">Moi en tant que PCO</h5>
                            <p class="pe-5"><?php if (isset($row4['idee1'])) {
                                                        echo $row4['idee1'];
                                                    } else {
                                                        echo 'Aucune information reçu de la part du candidat ' . $row['name'];
                                                    }; ?></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="info">
                            <i class="material-icons text-gradient text-primary text-3xl">flip_to_front</i>
                            <h5 class="font-weight-bolder mt-3">Comment j'intégrererai les nouveaux</h5>
                            <p class="pe-3"><?php if (isset($row4['idee2'])) {
                                                        echo $row4['idee2'];
                                                    } else {
                                                        echo 'Aucune information reçu de la part du candidat ' . $row['name'] . ' quant à sa façon de faire intégrer les nouveaux';
                                                    }; ?></p>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-start mt-5">
                    <div class="col-md-6 mt-3">
                        <i class="material-icons text-gradient text-primary text-3xl">price_change</i>
                        <h5 class="font-weight-bolder mt-3">Temps &amp; L'argent</h5>
                        <p class="pe-5"><?php if (isset($row4['idee3'])) {
                                                    echo $row4['idee3'];
                                                } else {
                                                    echo 'Le Candidat ' . $row['name'] . ' n\'a pour le moment pas donné des information quant à la façon qu\'il compte gerer ce budjet en si peut de temps';
                                                }; ?></p>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="info">
                            <i class="material-icons text-gradient text-primary text-3xl">devices</i>
                            <h5 class="font-weight-bolder mt-3">La MIAGE-GI et la technologie</h5>
                            <p class="pe-3"><?php if (isset($row4['idee2'])) {
                                                        echo $row4['idee2'];
                                                    } else {
                                                        echo 'Aucune information reçu de la part du candidat ' . $row['name'] . ' consernant la tech';
                                                    }; ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<?php $cnt = $cnt + 1;
    }
} ?>