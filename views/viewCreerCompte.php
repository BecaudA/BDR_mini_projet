<?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nbParamPost = count($_POST);
        if ($nbParamPost == 4) {
            $nom    = $_POST['nom'];
            $prenom = $_POST['prenom'];
            $email  = $_POST['email'];
            $date   = $_POST['date'];
            $compteManager = new CompteManager();
            $compteManager->creerCompte($nom, $prenom, $email, $date);
            header("Location: Boutique");
        }
    }

?>

<div class="container mt-3">
    <h2>Créer un compte</h2>
    <hr>
    <form action="CreerCompte" method="post">
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationDefault01">Titre</label>
                <input name="nom" type="text" class="form-control" id="validationDefault01" placeholder="votre nom" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="validationDefault02">Prénom</label>
                <input name="prenom" type="text" class="form-control" id="validationDefault02" placeholder="votre prénom" required>
            </div>
        </div>
        <div class="form-row">
            <div class="col-8 mb-3">
                <label for="validationDefault03">Email</label>
                <input name="email" type="email" class="form-control" id="validationDefault03" placeholder="votre adresse email" required>
            </div>
            <div class="col-4 mb-3">
                <label for="validationDefault04">Date de naissance</label>
                <input name="date" type="date" class="form-control" id="validationDefault04" required>
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Créer compte</button>
    </form>
</div>

