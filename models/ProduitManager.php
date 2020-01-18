<?php
include 'requests.php';

class ProduitManager extends Model {
    public function getProduits() {
        return $this->reqSelectDB(getAllProduits(), 'Produit');
    }
}