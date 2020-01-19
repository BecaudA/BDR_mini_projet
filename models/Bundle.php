<?php


class Bundle extends Produit {
    private $_listProduit = array();

    // constructeur
    public function __construct(array $data) {
        parent::__construct($data);
        $this->hydrate($data);
    }

    // hydratation (initialise les champs de cet objet)
    public function hydrate(array $data) {
        foreach ($data as $key => $value) {
            $method = 'set_'.ucfirst($key);

            if (method_exists($this, $method)) {
                $this->$method($value);
            }
        }
    }

    public function set_listeProduits(array $data){
        $this->_listProduit = $data;
    }

    public function listeProduits(){
        return $this->_listProduit;
    }
}