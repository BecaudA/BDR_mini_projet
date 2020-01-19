<div class="container">

    <?php
    foreach ($contenus as $cont) {
        $titre = $cont->titre();
        $ageLegal  = $cont->ageLegal();
        $prix = $cont->prix();
        $description = $cont->description();
        $traductions = $cont->langues();
        $genres = $cont->genres();
        $developpeur = $cont->developpeur();
        $editeur = $cont->editeur();
    }
    ?>
    <h1 class="font-weight-light text-center text-lg-left mt-4 mb-0"><?php echo $titre; ?> (+<?php echo $ageLegal; ?>)</h1>
    <h1 class="font-weight-light text-center text-lg-right mt-4 mb-0">Prix : <?php echo $prix; ?>.-</h1>
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
        <div class="row text-center text-lg-right">
            <h3 class="font-weight-light text-center text-lg-left mt-0 mb-0" style="width:160px;">Description : </h3>
            <div class="font-weight-light text-center text-lg-right mt-2 mb-0"><?php
                echo $description;
                ?></div>
        </div>
    </div>
    <div class="row text-center text-lg-left">
        <div class="row text-center text-lg-left">
            <h3 class="font-weight-light text-center text-lg-left mt-0 mb-0">Traduction : </h3>
            <div class="font-weight-light text-center text-lg-right mt-2 mb-0"><?php
                $compteur = 0;
                foreach ($traductions as $traduction) {
                    if($compteur != 0){
                        echo ",";
                    }
                    echo $traduction;
                    $compteur += 1;
                }
                ?></div>
        </div>
        <div class="row text-center text-lg-right">
            <h3 class="font-weight-light text-center text-lg-right mt-0 mb-0" style="width:150px;">Genre : </h3>
            <div class="font-weight-light text-center text-lg-right mt-2 mb-0"><?php
                $compteur = 0;
                foreach ($genres as $genre) {
                    if($compteur != 0){
                        echo ",";
                    }
                    echo $genre;
                    $compteur += 1;
                }
                ?></div>
        </div>
    </div>

    <div class="row text-center text-lg-left">
        <div class="row text-center text-lg-left">
            <h3 class="font-weight-light text-center text-lg-left mt-0 mb-0">Editeur : </h3>
            <div class="font-weight-light text-center text-lg-right mt-2 mb-0"><?php
                echo $editeur;
                ?></div>
        </div>
        <div class="row text-center text-lg-right">
            <h3 class="font-weight-light text-center text-lg-right mt-0 mb-0" style="width:250px;">Developpeur : </h3>
            <div class="font-weight-light text-center text-lg-right mt-2 mb-0"><?php
                echo $developpeur;
                ?></div>
        </div>
    </div>

</div>



<?php
