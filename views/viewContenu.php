<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nbParamPost = count($_POST);
        if ($nbParamPost == 3) {
            $titre = str_replace('_', ' ', $_POST['titre']);
            $idAcheteur = $_POST['idAcheteur'];
            $idReceveur = $_POST['idReceveur'];
            $this->_AchatManager = new AchatManager();
            echo "OK ".$nbParamPost;

            if ($idAcheteur == $idReceveur) {
                $this->_comptes = $this->_AchatManager->setAchatPerso($idAcheteur, $titre);
            } else {
                $this->_comptes = $this->_AchatManager->setAchatAmi($idAcheteur,$titre, $idReceveur);
            }
            header("Location: Boutique");
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
    $note        = $contenus[0]->note();
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
                    <form action="<?= str_replace(' ', '_', $titre) ?>" class="was-validated" method="post">
                        <input type="hidden" name="titre" value="<?= str_replace(' ', '_', $titre); ?>">
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
                    <h6>Note :
                        <?php if ($note == null): ?>
                        aucune
                        <?php else: ?>
                        <?= $note ?> / 5.0
                        <?php endif; ?>
                    </h6>
                    <h6>Age légal : <?= $age; ?> ans</h6>
                    <h6>Langue(s) :
                        <?php
                        $sizeTradArray = sizeof($traductions);
                        if ($sizeTradArray == 0) {
                            echo "aucune";
                        } else {
                            for ($i = 0; $i < $sizeTradArray; ++$i) {
                                echo $traductions[$i];
                                if ($i < $sizeTradArray - 1) {
                                    echo ", ";
                                }
                            }
                        }
                        ?>

                        <h6>Genre(s) :
                            <?php
                            $sizeGenreArray = sizeof($genres);
                            if ($sizeGenreArray == 0) {
                                echo "aucun";
                            } else {
                                for ($i = 0; $i < $sizeGenreArray; ++$i) {
                                    echo $genres[$i];
                                    if ($i < $sizeGenreArray - 1) {
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