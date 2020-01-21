<?php
require_once('views/View.php');
require_once('requests.php');

// controlleur de la page Accueil, initialise les manageurs pour la vue Accueil
class ControllerAjax {
    private $_compteManager;
    private $_view;
    private $_file;

    public function __construct($url) {
        // vérifie si l'url donnée est correcte .../ajax/<methode>/<paramètre>
        if (isset($url) && count($url) == 3 && method_exists($this, 'ajax'.$url[1])) {
            // prépare le fichier à charger ainsi que la méthode à appeler
            $this->_file = "views/ajax".$url[1].".php";
            $method = 'ajax'.$url[1];
            $this->$method($url);
        } else {
            throw new Exception('Page introuvable');
        }
    }

    private function ajaxMajAcheteur($url) {
        $parameters = explode('+', $url[2], null);
        // obient le compte recherché et ses produits possédés
        $this->_compteManager = new CompteManager();
        $comptes = $this->_compteManager->getCompte($parameters[0]);

        // charge la vue et echo le contenu de celle-ci
        $this->_view = new View('');
        echo $this->_view->generateFile($this->_file, array('comptes' => $comptes));
    }
}