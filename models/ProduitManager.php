<?php

class ProduitManager extends Model {
    public function getProduits() {
        return $this->reqSelectDB('SELECT * FROM stome.Produit', 'Produit');
    }
}