<?php
require_once('views/View.php');

// controlleur de la page Accueil, initialise les manageurs pour la vue Accueil
class ControllerBoutique {
	private $_produitManager;
	private $_view;
	
	public function __construct($url) {
		if (isset($url) && count($url) > 1) {
			throw new Exception('Page introuvable');
		} else {
			$this->showGalleryProduits();
		}
	}
	
	private function showGalleryProduits() {
		// création d'une instance de CompteManager qui va récupérer les données de la base de données
		$this->_produitManager = new ProduitManager();
		$produits = $this->_produitManager->getProduits();
		
		// 
		$this->_view = new View('Boutique');
		$this->_view->generate(array('produits' => $produits));
	}
}