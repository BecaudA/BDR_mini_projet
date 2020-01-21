<?php
    if(count($_REQUEST) >= 2){
        $this->_AchatManager = new AchatManager();
        //Si seulement 2 paramètres sont passés alors c'est un achat perso
        if(count($_REQUEST) == 2){
            $this->_comptes = $this->_AchatManager->setAchatPerso(2,"Borderlands 2");
        }
        //Si 3 argument sont passés alors c'est un achat pour un ami
        elseif (count($_REQUEST) == 3){

            $this->_comptes = $this->_AchatManager->setAchatAmi(idAcheteur,"Borderlands 2", idReceveur);
        }

    }
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
                    <?= $titre?>
                </h1>
                <div class="blog-post">
                    <h2 class="blog-post-title">Description</h2>
                    <p><?= $description; ?></p>
                </div>
            </div>

            <aside class="col-md-4 blog-sidebar">
                <?php if($promotion): ?>
                    <h2 class=text-center"><span class="badge badge-danger"><small class="text-muted">
                        <s><?php echo $prixInitial; ?> CHF</s></small> <?= $prix; ?> CHF</span>
                        <span class="badge badge-danger">
                            <span class="glyphicon glyphicon-align-left" aria-hidden="true">
                                <?= $promotion; ?>%
                            </span>
                        </span>
                    </h2>
                <?php else: ?>
                    <h2 class=text-center"><span class="badge badge-secondary" id="prix"><?= $prix; ?> CHF </span></h2>
                <?php endif; ?>
                <div id="porteMonnaie"></div>
                <button class="btn btn-primary btn-lg btn-block mb-2" type="submit" data-toggle="collapse" href="#acheter">Acheter</button>
                <div class="collapse" id="acheter">
                    <form action="" class="was-validated">
                        <input type="hidden" name="titre" value="<?= $titre; ?>">
                        <div class="row">
                            <div class="form-group col">
                                <select name="idAcheteur" class="custom-select" required onchange="majAcheteur(this.value)">
                                    <option value="">Acheteur</option>
                                    <?php foreach($comptes as $compte): ?>
                                        <option value="<?= $compte->id(); ?>"><?= $compte->nom()." ".$compte->prenom(); ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <div class="invalid-feedback">Sélectionnez un acheteur</div>
                            </div>
                            <div class="form-group col">
                                <select name="idReceveur" class="custom-select" required>
                                    <option value="">Receveur</option>
                                    <?php foreach($comptes as $compte): ?>
                                        <option value="<?= $compte->id(); ?>"><?= $compte->nom()." ".$compte->prenom(); ?></option>
                                    <?php endforeach; ?>
                                </select>
                                <div class="invalid-feedback">Sélectionnez un receveur</div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block mb-2" id="confirmerAchat">Confirmer l'achat</button>
                    </form>
                </div>
                <div class="p-3 mb-3 bg-light rounded">
                    <h4 class="font-italic">Détails</h4>
                    <h6>Age légal : <?= $age; ?> ans</h6>
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
<!-- TODO: tentative de script pour ajax-->
<script>
    function majAcheteur(id) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("porteMonnaie").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET", "Ajax/MajAcheteur/" + id, true);
        xmlhttp.send();
    }
</script>