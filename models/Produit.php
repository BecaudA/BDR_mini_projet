<?php


class Produit {
    private $_titre;

    // constructeur
    public function __construct(array $data) {
        $this->hydrate($data);
    }

    // hydratation (initialise les champs de cette objets)
    public function hydrate(array $data) {
        foreach ($data as $key => $value) {
            $method = 'set_'.ucfirst($key);

            if (method_exists($this, $method)) {
                $this->$method($value);
            }
        }
    }

    // setters
    public function set_titre($value) {
        $this->_titre = $value;
    }

    // getters
    public function titre() {
        return $this->_titre;
    }
}