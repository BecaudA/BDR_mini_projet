<?php
require_once('views/View.php');
require_once('requests.php');

class ControllerCreerCompte {
    private $_view;

    public function __construct($url) {
        if (isset($url) && count($url) > 1) {
            throw new Exception('Page introuvable');
        } else {
            $this->showAccountCreation();
        }
    }

    private function showAccountCreation() {
        $this->_view = new View('CreerCompte');
        $this->_view->generate(array());
    }
}