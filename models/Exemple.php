<?php
// classe d'exemple, le but ici est de représenter un objet 
// comme un Jeu ou un Achat avec les champs correspondants à ceux de la base de données.
class Exemple {
	private $_champ1;
	private $_champ2;
	private $_champ3;
	
	// constructeur
	public function __construct(array $data) {
		$this->hydrate($data);
	}
	
	// hydratation (initialise les champs de cette objets)
	public function hydrate(array $data) {
		foreach ($data as $key => value) {
			$method = 'set'ucfirst($key);
			
			if (method-exists($this, $method)) {
				$this->method($value);
			}
		}
	}
	
	// setters
	public function setChamp1($champ1) {
		$this->_champ1 = $champ1;
	}

	public function setChamp2($champ2) {
		$this->_champ2 = $champ2;
	}
	
	public function setChamp3($champ3) {
		$this->_champ3 = $champ3;
	}
	
	// getters
	public function champ1() {
		return $this->_champ1;
	}

	public function champ2() {
		return $this->_champ2;
	}
	
	public function champ3() {
		return $this->_champ3;
	}
}