<?php
require_once('views/View.php');
require_once('requests.php');

class ControllerCreerContenu {
    private $_contenuManager;
    private $_view;

    public function __construct($url) {
        if (isset($url) && count($url) > 1) {
            throw new Exception('Page introuvable');
        } else {
            $this->showContenuCreation();
        }
    }

    private function showContenuCreation() {
        $this->_contenuManager = new ContenuManager();
        $jeux        = $this->_contenuManager->getJeux();
        $genres      = $this->_contenuManager->getGenres();
        $langues     = $this->_contenuManager->getLangues();
        $entreprises = $this->_contenuManager->getEntreprises();
        $franchises  = $this->_contenuManager->getFranchises();
        $this->_view = new View('CreerContenu');
        $this->_view->generate(array('jeux' => $jeux,
                                     'genres' =>$genres,
                                     'langues' => $langues,
                                     'entreprises' => $entreprises,
                                     'franchises' => $franchises));
    }
}