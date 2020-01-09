<?php
// classe d'exemple, le but ici est de représenter un objet 
// comme un compte avec les champs correspondants à ceux de la base de données.
class Compte {
	private $_id;
	private $_nom;
	private $_prenom;
	private $_email;
	private $_porteMonnaie;
	private $_dateNaissance;
	
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
    public function set_prenom($value) {
        $this->_prenom = $value;
    }
    public function set_email($value) {
        $this->_email = $value;
    }
    public function set_porteMonnaie($value) {
        $this->_porteMonnaie = $value;
    }
    public function set_dateNaissance($value) {
        $this->_dateNaissance = $value;
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

}