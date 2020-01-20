<?php


class ControllerCompte
{
    private $_compteManager;
    private $_view;

    public function __construct($url) {
        if (isset($url) && count($url) > 1) {
            throw new Exception('Page introuvable');
        } else {
            $this->showDetailsCompte($url);
        }
    }

    private function showDetailsCompte($id) {
        $this->_compteManager = new CompteManager();
        $comptes = $this->_compteManager->getCompte($id);

        $this->_view = new View('Compte');
        $this->_view->generate(array('comptes' => $comptes));
    }
}