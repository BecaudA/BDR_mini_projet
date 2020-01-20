<?php
$id              = $comptes[0]->id();
$nom             = $comptes[0]->nom();
$prenom          = $comptes[0]->prenom();
$email           = $comptes[0]->email();
$portMonnaie     = $comptes[0]->porteMonnaie();
$dateNaissance   = $comptes[0]->dateNaissance();
$achats          = $comptes[0]->achats();
$bibliotheque    = $comptes[0]->bibliotheque();
$amis            = $comptes[0]->amis();
$total_depense   = 0;
$total_economise = 0;
$nb_jeu          = 0;
?>

<div class="container mt-2">
    <div class="row">
        <div class="col-md-8 blog-main">
            <h1 class="pb-3 mb-4 font-italic border-bottom">
                <?= $prenom." ".$nom?>
            </h1>
            <div class="blog-post">
                <h2 class="blog-post-title mb-3">Bibliotèque de jeux</h2>
                <?php if(!empty($bibliotheque)): ?>
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th scope="col">Titre</th>
                            <th scope="col">Offert par</th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php
                        foreach ($bibliotheque as $contenu):
                            ?>
                            <tr>
                                <td><?= $contenu->titre() ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                        </tbody>
                    </table>
                <?php else: ?>
                    <hr>
                    Aucun jeu dans votre bibliothèque.
                    <div class="mb-3"></div>
                <?php endif; ?>
            </div>
            <div class="blog-post">
                <h2 class="blog-post-title mb-3">Historique d'achats</h2>
                <?php if(!empty($achats)): ?>
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Titre</th>
                        <th scope="col">Date d'achat</th>
                        <th scope="col">Prix</th>
                        <th scope="col">Promotion</th>
                        <th scope="col">Achat pour ami</th>
                    </tr>
                    </thead>
                    <tbody>

                    <?php
                    foreach ($achats as $achat):
                    $achat_id = $achat['id'];
                    $achat_titre = $achat['titre'];
                    $achat_prixInitial = $achat['prixInitial'];
                    $achat_prixFinal = $achat['prixFinal'];
                    $achat_promotion = $achat['promotion'];
                    $achat_date = $achat['date'];
                    $achat_idAmi = $achat['idAmi'];
                    $achat_nomAmi = "";
                    if ($achat_idAmi != null) {
                        $achat_nomAmi = $listComptes[$achat_idAmi - 1]->prenom()." ".$listComptes[$achat_idAmi - 1]->nom();
                    }
                    $total_depense += $achat_prixFinal;
                    $total_economise += $achat_prixInitial -$achat_prixFinal;
                    $nb_jeu += 1;
                    ?>
                        <tr>
                            <td scope="row"><a class="black" href="<?= $achat_titre ?>"><?= $achat_titre; ?></a></td>
                            <td><?= $achat_date; ?></td>
                            <td>
                            <?php if($achat_promotion): ?>
                                <s><?php echo $achat_prixInitial; ?> CHF</s>
                                <span class="badge badge-danger"><?php echo $achat_prixFinal; ?> CHF
                                    <sup>-<?php echo $achat_promotion; ?>%</sup></span>
                            <?php else: ?>
                                <?php echo $achat_prixFinal; ?> CHF
                            <?php endif; ?>
                            </td>
                            <td>
                            <?php if($achat_promotion): ?>
                                <?= $achat_promotion; ?>%
                            <?php else: ?>
                            aucune
                            <?php endif; ?>
                            </td>
                            <td>
                                <?php if($achat_idAmi != null): ?>
                                    <a href="<?= $achat_idAmi ?>"><?= $achat_nomAmi; ?></a>
                                <?php else: ?>
                                    -
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <?php else: ?>
                <hr>
                    Aucun jeu acheté.
                <div class="mb-3"></div>
                <?php endif; ?>
            </div>
            <div class="blog-post">
                <h2 class="blog-post-title">Statistiques</h2>
                <hr>
                <h4>Total dépensé : <?= $total_depense; ?> CHF</h4>
                <h4>Total économisé : <?= $total_economise; ?> CHF</h4>
                <h4>Nombre de jeu : <?= $nb_jeu; ?></h4>
            </div>
        </div>

        <aside class="col-md-4 blog-sidebar">
            <h2><span class="badge badge-secondary">Porte monnaie : <?= $portMonnaie; ?> CHF</span></h2>
            <div class="p-3 mb-3">
                <h4 class="font-italic">Détails</h4>
                    <h6>
                        Identifiant : <?= $id; ?>
                    </h6>
                    <h6>
                        Email : <?= $email; ?>
                    </h6>
                    <h6>
                        Date de naissance : <?= $dateNaissance; ?>
                    </h6>
            </div>
            <div class="p-3 mb-3">
                <h4 class="font-italic">Amis</h4>
                <?php if(!empty($amis)):
                    foreach ($amis as $ami) {
                        ?>
                    <h6><?= $listComptes[$ami - 1]->prenom()." ".$listComptes[$ami - 1]->nom();; ?></h6>
                <?php    }
                else: ?>
                    Vous n'avez pas encore d'amis.
                <?php endif; ?>
            </div>
        </aside>

    </div>
</div>