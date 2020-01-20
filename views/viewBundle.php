<?php
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
                <h2 class="pb-3 mb-4 font-italic">Produits inclus</h2>
                <div class="album py-5">
                    <div class="container">
                        <div class="row">
                            <?php
                            foreach ($listeProduits as $produit):
                                $titre       = $produit->titre();
                                $prixInitial = $produit->prixInitial();
                                $prixFinal   = $produit->prixFinal();
                                $promotion   = $produit->promotion();
                                $img         = "img/thumbnails/" . strtolower(str_replace(' ', '', $titre)) . ".jpg";
                                $link        = str_replace(' ', '_', $titre);
                                ?>
                                <div class="col-md-4">
                                    <div class="card mb-4 box-shadow">
                                        <a href="<?php echo $link; ?>" class="d-block mb-2 h-50">
                                            <img class="card-img-top" alt="Thumbnail [100%x225]" style="height: 140px; width: 100%; display: block;" src="<?php echo $img; ?>" data-holder-rendered="true">
                                        </a>
                                        <div class="card-body">
                                            <h4 class="card-text"><?php echo $titre; ?></h4>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <!-- <div class="btn-group">
                                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                                </div> -->
                                                <?php if($promotion): ?>
                                                    <small class="text-muted"><s><?php echo $prixInitial; ?> CHF</s></small>
                                                    <span class="badge badge-danger"><?php echo $prixFinal; ?> CHF</small> <sup>-<?php echo $promotion; ?>%</sup></span>
                                                <?php else: ?>
                                                    <small class="text-muted"><?php echo $prixFinal; ?> CHF</small>
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
                <button class="btn btn-primary btn-lg btn-block" type="submit" href="#">Acheter pour moi</button>
                <button class="btn btn-primary btn-lg btn-block mb-2" type="submit" href="#">Acheter pour un ami</button>
                <div class="p-3 mb-3 bg-light rounded">
                    <h4 class="font-italic">Détails</h4>
                    <h6>Age légal : <?= $age; ?> ans</h6>
                </div>
            </aside>
        </div>
    </div>
