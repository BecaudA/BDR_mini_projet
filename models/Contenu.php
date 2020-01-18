<?php


class Contenu extends Produit
{
    private $_titre;
    private $_ageLegal;
    private $_prix;
    private $_description;
    private $_genre = array();
    private $_langue = array();

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

    public function set_ageLegal($agelegal) {
        $this->_ageLegal = $agelegal;
    }

    public function set_prix($prix) {
        $this->_prix = $prix;
    }

    public function set_description($description) {
        $this->_description = $description;
    }

    public function set_langues($data) {
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                array_push($this->_langue,$value);
            }
        }
    }

    public function set_contenus(array $data) {
        foreach ($data as $key => $value) {
            array_push($this->_genre,$value);
        }
    }

    // getters
    public function titre() {
        return $this->_titre;
    }

    public function description() {
        return $this->_description;
    }

    public function prix()
    {
        return $this->_prix;
    }

    public function ageLegal()
    {
        return $this->_ageLegal;
    }

    public function genres()
    {
        return $this->_genre;
    }

    public function langues()
    {
        return $this->_langue;
    }
}