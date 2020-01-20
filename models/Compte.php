<?php

class Compte {
	private $_id;
	private $_nom;
	private $_prenom;
	private $_email;
	private $_porteMonnaie;
	private $_dateNaissance;
	private $_achats = array();
	private $_listAmis = array();
	
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
	public function set_id($value) {
		$this->_id = $value;
	}
    public function set_nom($value) {
        $this->_nom = $value;
    }
    public function set_prenom($prenom) {
        $this->_prenom = $prenom;
    }
    public function set_email($email) {
        $this->_email = $email;
    }
    public function set_porteMonnaie($porteMonnaie) {
        $this->_porteMonnaie = $porteMonnaie;
    }
    public function set_dateNaissance($dateNaissance) {
        $this->_dateNaissance = $dateNaissance;
    }
    public function set_achats(array $achats){
        $this->_achats = $achats;
    }
	
	// getters
    public function id() {
        return $this->_id;
	}
    public function nom() {
        return $this->_nom;
    }
    public function prenom() {
        return $this->_prenom;
    }
    public function email() {
        return $this->_email;
    }
    public function porteMonnaie() {
        return $this->_porteMonnaie;
    }
    public function dateNaissance() {
        return $this->_dateNaissance;
    }
    public function achats() {
	    return $this->_achats;
    }
    public function listeAmis() {
	    return $this->_listAmis;
    }
}