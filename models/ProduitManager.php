<?php
include 'requests.php';

class ProduitManager extends Model {
    public function getProduits() {
        //$this->insertElementDB("INSERT INTO bundlecomprend(titreBundle, titreProduit) VALUES (\"Bundle Borderlands\", \"Bundle Borderlands\");");
        return $this->reqSelectDB(getAllProduits(), 'Produit');
    }

    public function doesProduitExist($titre) {
        $var = $this->reqSelectDB(getProduit($titre), 'Produit');
        return !empty($var);
    }
}