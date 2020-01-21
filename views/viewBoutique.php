
        <div class="container center">
            <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Boutique</h1>
            <hr class="mt-2 mb-5">
        </div>
        <div class="album py-1 bg-light">
            <div class="container">
                <div class="row">
                    <?php
                    foreach ($produits as $produit):
                        $titre = $produit->titre();
                        $prixInitial = $produit->prixInitial();
                        $prixFinal = $produit->prixFinal();
                        $promotion = $produit->promotion();
                        $img       = "img/thumbnails/" . strtolower(str_replace(' ', '', $titre)) . ".jpg";
                        $link      = str_replace(' ', '_', $titre);
                        if (!file_exists($img)) {
                            $img = "img/thumbnails/unknown.jpg";
                        }
                    ?>
                    <div class="col-md-4">
                        <div class="card mb-4 box-shadow">
                            <a href="<?php echo $link; ?>" class="d-block mb-2 h-100">
                                <img class="card-img-top" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" src="<?php echo $img; ?>" data-holder-rendered="true">
                            </a>
                            <div class="card-body">
                                <h1 class="card-text"><?php echo $titre; ?></h1>
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