<?php

class Produit {
    private $_titre;
    private $_prixInitial;
    private $_prixFinal;
    private $_promotion;
    private $_age;

    // constructeur
    public function __construct(array $data) {
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

    // setters
    public function set_titre($titre) {
        $this->_titre = $titre;
    }

    public function set_prixInitial($prixInitial) {
        $this->_prixInitial = $prixInitial;
    }

    public function set_prixFinal($prixFinal) {
        $this->_prixFinal = $prixFinal;
    }

    public function set_promotion($promotion)
    {
        $this->_promotion = $promotion;
    }

    public function set_age($age)
    {
        $this->_age = $age;
    }

    // getters
    public function titre() {
        return $this->_titre;
    }

    public function prixInitial() {
        return $this->_prixInitial;
    }

    public function prixFinal() {
        return $this->_prixFinal;
    }

    public function promotion()
    {
        return $this->_promotion;
    }

    public function age()
    {
        return $this->_age;
    }
}