<?php


class Contenu extends Produit {
    private $_franchise;
    private $_developpeur;
    private $_editeur;
    private $_description;
    private $_genres = array();
    private $_langues = array();

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

    // setters
    public function set_franchise($franchise) {
        $this->_franchise = $franchise;
    }

    public function set_developpeur($developpeur) {
        $this->_developpeur = $developpeur;
    }

    public function set_editeur($editeur) {
        $this->_editeur = $editeur;
    }

    public function set_description($description) {
        $this->_description = $description;
    }

    public function set_langues($data) {
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                //Si le nom de colonne est changée il faut changer également l'éaglité
                if($key == "nomLangue")
                    array_push($this->_langues,$value);
            }
        }
    }

    public function set_genres(array $data) {
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                //Si le nom de colonne est changée il faut changer également l'éaglité
                if($key == "nomGenre")
                    array_push($this->_genres,$value);
            }
        }
    }

    // getters
    public function franchise() {
        return $this->_franchise;
    }

    public function developpeur() {
        return $this->_developpeur;
    }

    public function editeur() {
        return $this->_editeur;
    }

    public function description() {
        return $this->_description;
    }

    public function genres()
    {
        return $this->_genres;
    }

    public function langues()
    {
        return $this->_langues;
    }
}