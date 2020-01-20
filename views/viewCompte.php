<?php
$id              = $comptes[0]->id();
$nom             = $comptes[0]->nom();
$prenom          = $comptes[0]->prenom();
$email           = $comptes[0]->email();
$portMonnaie     = $comptes[0]->porteMonnaie();
$dateNaissance   = $comptes[0]->dateNaissance();
$achats          = $comptes[0]->achats();
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
                <h2 class="blog-post-title mb-3">Bibliothèque de jeux</h2>
                <?php if(!empty($achats)): ?>
                <table class="table table-hover table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Titre</th>
                        <th scope="col">Date d'achat</th>
                        <th scope="col">Prix</th>
                        <th scope="col">Promotion</th>
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
                    $total_depense += $achat_prixFinal;
                    $total_economise += $achat_prixInitial -$achat_prixFinal;
                    $nb_jeu += 1;
                    ?>
                        <tr>
                            <td scope="row"><?= $achat_titre; ?></td>
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
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
                <?php else: ?>
                <hr>
                    Aucun jeu disponible  dans votre bibliothèque.
                <div class="mb-3"></div>
                <?php endif; ?>
            </div>
            <div class="blog-post">
                <h2 class="blog-post-title">Statistique</h2>
                <hr>
                <h4>Total dépensé : <?= $total_depense; ?> CHF</h4>
                <h4>Total économisé : <?= $total_economise; ?> CHF</h4>
                <h4>Nombre de jeu : <?= $nb_jeu; ?></h4>
            </div>
        </div>

        <aside class="col-md-4 blog-sidebar">
            <h2><span class="badge badge-secondary">Porte monnaie : <?= $portMonnaie; ?> CHF</span></h2>
            <div class="p-3 mb-3 bg-light rounded">
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
        </aside>

    </div>
</div>