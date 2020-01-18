<?php
include 'requests.php';

class ProduitManager extends Model {
    public function getProduits() {
        return $this->reqSelectDB(getAllProduits(), 'Produit');
    }

    public function doesProduitExist($titre) {
        $var = $this->reqSelectDB(getProduit($titre), 'Produit');

        echo $var.", ";
        return !empty($var);
    }
}