<?php
require_once("../../models/CompteManager.php");

$compteManager = new CompteManager();
$comptes = $compteManager->getCompte($_REQUEST["id"]);

echo "<h2><span class=\"badge badge-secondary\">Porte monnaie : ".$comptes[0]->porteMonnaie()."CHF</span></h2>";
?>