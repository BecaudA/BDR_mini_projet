<?php


class Bundle extends Produit {
    private $_listProduit;

    // constructeur
    public function __construct(array $data) {
        parent::__construct($data);
        // get la liste des produits du bundle
        // $this->_listProduit = (new ProduitManager()).get
    }
}