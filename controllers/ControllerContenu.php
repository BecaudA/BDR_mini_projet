<?php
require_once('views/View.php');

class ControllerContenu {
    private $_contenuManager;
    private $_compteManager;
    private $_view;

    public function __construct($url) {
        //A enlever count
        if (isset($url) && (count($url) > 1)) {
            throw new Exception('Page introuvable');
        } else {
            $this->showContenu($url);
        }
    }

    private function showContenu($titre) {
        $this->_contenuManager = new ContenuManager();
        $contenus = $this->_contenuManager->getContenu($titre);

        $this->_compteManager = new CompteManager();
        $comptes = $this->_compteManager->getComptes();
        //
        $this->_view = new View('Contenu');
        $this->_view->generate(array('contenus' => $contenus, 'comptes' => $comptes));
    }
}