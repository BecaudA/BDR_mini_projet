<?php
require_once('views/View.php');

// controlleur de la page Accueil, initialise les manageurs pour la vue Accueil
class ControllerAccueil {
	private $_exempleManager;
	private $_view;
	
	public function __construct($url) {
		if (isset($url) && count($url) > 1) {
			throw new Exception('Page introuvable');
		} else {
			$this->exemples();
		}
	}
	
	private function exemples() {
		// création d'une instance de ExempleManager qui va récupérer les données de la base de données
		$this->_exempleManager = new ExempleManager;
		$exemples = $this->_exempleManager->getExemples();
		
		// 
		$this->_view = new View('Accueil');
		$this->_view->generate(array('exemples' => $exemples));
	}
}