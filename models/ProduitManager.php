<?php

class ProduitManager extends Model {
    public function getProduits() {
        $request = parse_ini_file('requests.ini')['getAllProduits'];
        return $this->reqSelectDB($request, 'Produit');
    }
}