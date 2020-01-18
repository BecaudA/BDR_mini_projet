<?php
require_once('views/View.php');

class ControllerContenu {
    private $_contenuManager;
    private $_view;

    public function __construct($url) {
        if (isset($url) && count($url) > 1) {
            throw new Exception('Page introuvable');
        } else {
            $this->showDetailsContenu($url);
        }
    }

    private function showDetailsContenu($titre) {
        $this->_contenuManager = new ContenuManager();
        $contenu = $this->_contenuManager->getDetailsContenu($titre);

        //
        $this->_view = new View('DetailsContenu');
        $this->_view->generate($contenu);
    }
}