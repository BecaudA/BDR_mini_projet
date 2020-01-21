<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nbParametres = count($_POST);
    $contenuManager = new ContenuManager();
    // vérfie s'il faut ajouter un jeu
    if ($_POST['typeForm'] == "jeu") {
        $titre       = $_POST['titre'];
        $prix        = $_POST['prix'];
        $age         = $_POST['age'];
        $developpeur = $_POST['developpeur'];
        $editeur     = $_POST['editeur'];
        $languesF     = $_POST['langues'];
        $genresF      = $_POST['genres'];
        $description = $_POST['description'];
        $franchise   = $_POST['franchise'];
        if ($prix > -1 && $age > 0 && $contenuManager->doesJeuExist($titre)) {
            if ($languesF == null)
                $languesF = [];
            if ($genresF == null)
                $genresF = [];
            $contenuManager->addJeu($titre, $age, $prix, $description, $genresF, $languesF, $developpeur, $editeur, $franchise);
        } else echo "<script>alert(\"Votre entrée est invalide\")</script>";
    }

}
?>

<div class="container mt-3">
    <h2>Ajout d'un jeu</h2>
    <hr>
    <form action="CreerContenu" method="post">
        <input hidden name="typeForm" value="jeu">
        <div class="form-row">
            <div class="col-4 mb-3">
                <label for="validationDefault01">Titre</label>
                <input name="titre" type="text" class="form-control" id="validationDefault01" placeholder="titre du jeu" required>
            </div>
            <div class="col-4 mb-3">
                <label for="validationDefault02">Prix</label>
                <input name="prix" type="number" class="form-control" id="validationDefault02" required>
            </div>
            <div class="col-4 mb-3">
                <label for="validationDefault03">Age légal</label>
                <input name="age" type="number" class="form-control" id="validationDefault03" required>
            </div>
        </div>
        <div class="form-row">
            <div class="col-4 mb-3">
                <label for="validationDefault04">Developpeur</label>
                <select name="developpeur" class="form-control" id="validationDefault04" required>
                    <?php foreach($entreprises as $entreprise): ?>
                       <option><?= $entreprise; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-4 mb-3">
                <label for="validationDefault05">Editeur</label>
                <select name="editeur" class="form-control" id="validationDefault05" required>
                    <?php foreach($entreprises as $entreprise): ?>
                        <option><?= $entreprise; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-4 mb-3">
                <label for="validationDefault05">Franchise</label>
                <select name="franchise" class="form-control" id="validationDefault06" required>
                    <?php foreach($franchises as $franchise): ?>
                        <option><?= $franchise; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
        <div class="form-row">
            <div class="col-6 mb-3">
                <label for="validationDefault06">Langues</label>
                <select multiple name="langues[]" class="form-control" id="validationDefault07">
                    <?php foreach($langues as $langue): ?>
              <option><?= $langue; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="col-6 mb-3">
                <label for="validationDefault07">Genres</label>
                <select multiple name="genres[]" class="form-control" id="validationDefault07">
                    <?php foreach($genres as $genre): ?>
              <option><?= $genre; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
        <div class="form-row">
            <label for="validationDefault08">Description</label>
            <input name="description" type="text" class="form-control mb-3" id="validationDefault08" placeholder="description" required>
        </div>
        <button class="btn btn-primary" type="submit">Ajouter le jeu</button>
    </form>
</div>
