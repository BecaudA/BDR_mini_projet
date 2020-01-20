<?php

class ControllerCompte
{
    private $_compteManager;
    private $_view;
    private $_listComptes = array();

    public function __construct($url) {
        if (isset($url) && count($url) > 1) {
            throw new Exception('Page introuvable');
        } else {
            $this->_compteManager = new CompteManager();
            $this->_listComptes = $this->_compteManager->getComptes();
            $this->showDetailsCompte($url);
        }
    }

    private function showDetailsCompte($id) {
        $comptes = $this->_compteManager->getCompte($id);

        $this->_view = new View('Compte');
        $this->_view->generate(array('comptes' => $comptes, 'listComptes' => $this->_listComptes));
    }
}