<div class="container">

    <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0">Boutique</h1>
    <hr class="mt-2 mb-5">
    <div class="row text-center text-lg-left">

        <?php
        foreach ($produits as $produit){

            $titre = $produit->titre();

            if($titre != null) {
                // Affiche une image de forme "titre.jpg" le nom de l'image doit correspondre au Titre du produit mais sans espace et en minuscule
                /*
                echo "  <div class=\"col-lg-3 col-md-4 col-6\">
                        <a href=\"" . str_replace(' ', '_', $titre) . "\" class=\"d-block mb-4 h-100\">
                            <img class=\"img-fluid img-thumbnail\" src=\"../img/thumbnails/" . strtolower(str_replace(' ', '', $titre)) . ".jpg\" alt=\"\"></a>
                    </div>";
                */?>

                        <div class="col-lg-3 col-md-4 col-6 ">
                            <div class="container-fluid">
                            <a href="<?php echo str_replace(' ', '_', $titre); ?>" class="d-block mb-4 h-100">
                                <img alt="Bootstrap Image Preview" src="../img/thumbnails/<?php echo strtolower(str_replace(' ', '', $titre));?>.jpg" class="img-thumbnail"/></a>
                            <h2>
                                <?php echo $titre; ?>
                            </h2>
                            <p>
                                <?php echo $produit->prixFinal(); ?> CHF
                            </p>
                        </div>
                </div>
        <?php
            }
        }
        ?>
    </div>
</div>



