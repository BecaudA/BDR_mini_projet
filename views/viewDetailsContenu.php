<div class="container">

    <?php
            $titre = $contenu[0]->titre();
    ?>
    <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0"><?php echo $titre; ?></h1>
    <hr class="mt-2 mb-5">
    <div class="row text-center text-lg-left">

        <?php
            if($titre != null) {
                // Affiche une image de forme "titre.jpg" le nom de l'image doit correspondre au Titre du produit mais sans espace et en minuscule
                echo "  <div class=\"col-lg-3 col-md-4 col-6\">
                        <a href=\"" . $titre . "\" class=\"d-block mb-4 h-100\">
                            <img class=\"img-fluid img-thumbnail\" src=\"../img/thumbnails/" . strtolower(str_replace(' ', '', $titre)) . ".jpg\" alt=\"\"></a>
                    </div>";
            }
        ?>
    </div>
</div>



<?php
