<?php
// affiche le html avec les champs de notre objet Exemple
foreach ($exemples as $exemple): ?>
<h2><?= $exemple->champ1() ?></h2>
<p><?= $exemple->champ2() ?></p>
<a><?= $exemple->champ3() ?></a>
<?php endforeach; ?>