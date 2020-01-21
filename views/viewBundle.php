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

    $titre         = $bundles[0]->titre();
    $prixInitial   = $bundles[0]->prixInitial();
    $age           = $bundles[0]->age();
    $prix          = $bundles[0]->prixFinal();
    $promotion     = $bundles[0]->promotion();
    $listeProduits = $bundles[0]->listeProduits();
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
                <h2 class="font-italic">Produits inclus</h2>
                <hr>
                <div class="album py-3">
                    <div class="container">
                        <div class="row">
                            <?php
                            foreach ($listeProduits as $produit):
                                $titreP       = $produit->titre();
                                $prixInitialP = $produit->prixInitial();
                                $prixFinalP   = $produit->prixFinal();
                                $promotionP   = $produit->promotion();
                                $img          = "img/thumbnails/" . strtolower(str_replace(' ', '', $titreP)) . ".jpg";
                                $link         = str_replace(' ', '_', $titreP);
                                ?>
                                <div class="col-md-4">
                                    <div class="card mb-4 box-shadow">
                                        <a href="<?php echo $link; ?>" class="d-block mb-2 h-50">
                                            <img class="card-img-top" alt="Thumbnail [100%x225]" style="height: 140px; width: 100%; display: block;" src="<?php echo $img; ?>" data-holder-rendered="true">
                                        </a>
                                        <div class="card-body">
                                            <h4 class="card-text"><?php echo $titreP; ?></h4>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <!-- <div class="btn-group">
                                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                                </div> -->
                                                <?php if($promotionP): ?>
                                                    <small class="text-muted"><s><?php echo $prixInitialP; ?> CHF</s></small>
                                                    <span class="badge badge-danger"><?php echo $prixFinalP; ?> CHF</small> <sup>-<?php echo $promotionP; ?>%</sup></span>
                                                <?php else: ?>
                                                    <small class="text-muted"><?php echo $prixFinalP; ?> CHF</small>
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
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
                    <h2 class=text-center"><span class="badge badge-secondary"><?= $prix; ?> CHF </span></h2>
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