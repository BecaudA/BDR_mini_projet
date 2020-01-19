<?php
    $titre       = $contenus[0]->titre();
    $prixInitial = $contenus[0]->prixInitial();
    $age         = $contenus[0]->age();
    $prix        = $contenus[0]->prixFinal();
    $promotion   = $contenus[0]->promotion();
    $description = $contenus[0]->description();
    $traductions = $contenus[0]->langues();
    $genres      = $contenus[0]->genres();
    $developpeur = $contenus[0]->developpeur();
    $editeur     = $contenus[0]->editeur();
    $franchise   = $contenus[0]->franchise();
?>
    <style type="text/css">
        .jumbotron {
            height: 30vh;
            background-image: url('img/thumbnails/<?= str_replace(' ', '', strtolower($titre)); ?>.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            border-width: 1px !important;
        }
    </style>
    <div class="jumbotron mb-3 rounded-0 border-bottom border-light"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-8 blog-main">
                <h1 class="pb-3 mb-4 font-italic border-bottom">
                    <?= $titre." (-".$age.")"?>
                </h1>
                <div class="blog-post">
                    <h2 class="blog-post-title">Description</h2>
                    <p><?= $description; ?></p>
                </div>
            </div>

            <aside class="col-md-4 blog-sidebar">
                <h2 class=text-center"><span class="badge badge-secondary"><?= $prix; ?> CHF</span></h2>
                <button class="btn btn-primary btn-lg btn-block" type="submit" href="#">Acheter pour moi</button>
                <button class="btn btn-primary btn-lg btn-block mb-2" type="submit" href="#">Acheter pour un ami</button>
                <div class="p-3 mb-3 bg-light rounded">
                    <h4 class="font-italic">Détails</h4>
                    <h6>Langue
                    <?php
                    $sizeTradArray = sizeof($traductions);
                    if ($sizeTradArray > 1) {
                        echo "s";
                    }
                    echo " : ";
                    if ($sizeTradArray == 0) {
                        echo "aucune";
                    } else {
                        for ($i = 0; $i < sizeof($traductions); ++$i) {
                            echo $traductions[$i];
                            if ($i < sizeof($traductions) - 1) {
                                echo ", ";
                            }
                        }
                    }
                    ?>

                    <h6>Genre
                    <?php
                    $sizeGenreArray = sizeof($genres);
                    if ($sizeGenreArray > 1) {
                        echo "s";
                    }
                    echo " : ";
                    if ($sizeGenreArray == 0) {
                        echo "aucun";
                    } else {
                        for ($i = 0; $i < sizeof($genres); ++$i) {
                            echo $genres[$i];
                            if ($i < sizeof($genres) - 1) {
                                echo ", ";
                            }
                        }
                    }
                    ?>
                    </h6>
                    <h6>
                        Franchise : <?= $franchise; ?>
                    </h6>
                    <h6>
                        Editeur : <?= $editeur; ?>
                    </h6>
                    <h6>
                        Developpeur : <?= $developpeur; ?>
                    </h6>
                </div>
            </aside>

        </div>
    </div>



<?php
