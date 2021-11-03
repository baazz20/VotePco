<?php require_once 'bdconnect.php';

$ret = mysqli_query($conn, "select * from candidat");
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
                                    <h1 class="text-gradient text-primary"><span id="state1" countto="70"><?php
                                            $ret = mysqli_query($conn, "select * from candidat");
                                            $cnt = 0;
                                            $row = mysqli_num_rows($ret);
                                            if ($row > 0) {
                                                while ($row = mysqli_fetch_array($ret)) {
                                                    $cnt = $cnt + 1;
                                                }
                                            }  ?><?= $cnt;?></span>%</h1>
                                    <h5 class="mt-3">De participation</h5>
                                    <p class="text-sm font-weight-normal">Le taux de participation dans cette celection</p> 
                                </div>
                                <hr class="vertical dark">
                            </div>
                            <div class="col-md-4 position-relative">
                                <div class="p-3 text-center">
                                    <h1 class="text-gradient text-primary"> <span id="state2" countto="15">15</span>%</h1>
                                    <h5 class="mt-3">sans voix</h5>
                                    <p class="text-sm font-weight-normal">Le taux de personne sans voix dans cette election</p>
                                </div>
                                <hr class="vertical dark">
                            </div>
                            <div class="col-md-4">
                                <div class="p-3 text-center">
                                    <h1 class="text-gradient text-primary" id="state3" countto="4">4</h1>
                                    <h5 class="mt-3">Nombre d'élècteur</h5>
                                    <p class="text-sm font-weight-normal">Le nombre total de personne participant à cette élèction</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="container">
            <div class="section text-center">
                <h2 class="title mb-5">Liste des candidats</h2>
                <!-- test  -->

                <!-- fintest -->
            </div>

        </div>
       
<?php if ($row > 0) {
    while ($row = mysqli_fetch_array($ret)) {    ?>
    
           
        </div>
        <section class="my-5 py-5">
            <div class="container">
            <div class="text-center">
                
                <h2 class="title"><?= $row['lastname']; ?> <?= $row['name']; ?></h2>
                <br><hr>
            </div>
                <div class="row align-items-center">
                    <div class="col-lg-4 ms-auto me-auto p-lg-4 mt-lg-0 mt-4">
                        <div class="rotating-card-container">
                            <div class="card card-rotate card-background card-background-mask-primary shadow-primary mt-md-0 mt-5">
                                <div class="front front-background" style="background-image: url(https://images.unsplash.com/photo-1569683795645-b62e50fbf103?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=987&amp;q=80); background-size: cover;">
                                    <div class="card-body py-7 text-center">
                                        <i class="material-icons text-white text-4xl my-3">touch_app</i>
                                        <h3 class="text-white">Feel the <br> Material Kit</h3>
                                        <p class="text-white opacity-8">All the Bootstrap components that you need in a development have been re-design with the new look.</p>
                                    </div>
                                </div>
                                <div class="back back-background" style="background-image: url(https://images.unsplash.com/photo-1498889444388-e67ea62c464b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;ixlib=rb-1.2.1&amp;auto=format&amp;fit=crop&amp;w=1365&amp;q=80); background-size: cover;">
                                    <div class="card-body pt-7 text-center">
                                        <h3 class="text-white">Discover More</h3>
                                        <p class="text-white opacity-8"> You will save a lot of time going from prototyping to full-functional code because all elements are implemented.</p>
                                        <a href=".//sections/page-sections/hero-sections.html" target="_blank" class="btn btn-white btn-sm w-50 mx-auto mt-3">Start with Headers</a>
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
                                    <h5 class="font-weight-bolder mt-3">Full Documentation</h5>
                                    <p class="pe-5">Built by developers for developers. Check the foundation and you will find everything inside our documentation.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="info">
                                    <i class="material-icons text-gradient text-primary text-3xl">flip_to_front</i>
                                    <h5 class="font-weight-bolder mt-3">Bootstrap 5 Ready</h5>
                                    <p class="pe-3">The world’s most popular front-end open source toolkit, featuring Sass variables and mixins.</p>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-start mt-5">
                            <div class="col-md-6 mt-3">
                                <i class="material-icons text-gradient text-primary text-3xl">price_change</i>
                                <h5 class="font-weight-bolder mt-3">Save Time &amp; Money</h5>
                                <p class="pe-5">Creating your design from scratch with dedicated designers can be very expensive. Start with our Design System.</p>
                            </div>
                            <div class="col-md-6 mt-3">
                                <div class="info">
                                    <i class="material-icons text-gradient text-primary text-3xl">devices</i>
                                    <h5 class="font-weight-bolder mt-3">Fully Responsive</h5>
                                    <p class="pe-3">Regardless of the screen size, the website content will naturally fit the given resolution.</p>
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