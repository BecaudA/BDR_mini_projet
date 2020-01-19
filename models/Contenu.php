<?php


class Contenu extends Produit
{
    private $_titre;
    private $_prixInital;
    private $_age;
    private $_prixFinal;
    private $_promotion;
    private $_franchise;
    private $_developpeur;
    private $_editeur;
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

    public function set_prixInital($prixInitial) {
        $this->_prixInital = $prixInitial;
    }

    public function set_age($age) {
        $this->_age = $age;
    }

    public function set_prixFinal($prixFinal) {
        $this->_prixFinal = $prixFinal;
    }

    public function set_promotion($promotion) {
        $this->_promotion = $promotion;
    }

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

    // getters
    public function titre() {
        return $this->_titre;
    }

    public function prixInitial() {
        return $this->_prixInital;
    }

    public function age() {
        return $this->_age;
    }

    public function prixFinal() {
        return $this->_prixFinal;
    }

    public function promotion() {
        return $this->_promotion;
    }

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
        return $this->_genre;
    }

    public function langues()
    {
        return $this->_langue;
    }
}