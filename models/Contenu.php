<?php


class Contenu extends Produit
{
    private $_titre;
    private $_ageLegal;
    private $_prix;
    private $_description;
    private $_genre = array();
    private $_langue = array();
    private $_franchise;
    private $_editeur;
    private $_developpeur;

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
                //Si le nom de colonne est changée il faut changer également l'éaglité
                if($key == "nomLangue")
                    array_push($this->_langue,$value);
            }
        }
    }

    public function set_genres(array $data) {
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                //Si le nom de colonne est changée il faut changer également l'éaglité
                if($key == "nomGenre")
                    array_push($this->_genre,$value);
            }
        }
    }

    public function set_franchise($data){
        $this->_franchise = $data;
    }

    public function set_editeur($data){
        $this->_editeur = $data;
    }

    public function set_developpeur($data){
        $this->_developpeur = $data;
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

    public function developpeur(){
        return $this->_developpeur;
    }

    public function editeur(){
        return $this->_editeur;
    }

    public function franchise(){
        return $this->_franchise;
    }
}