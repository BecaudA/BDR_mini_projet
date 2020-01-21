<?php
require_once('views/View.php');

class ControllerBundle {
    private $_bundleManager;
    private $_compteManager;
    private $_view;

    public function __construct($url) {
        if (isset($url) && count($url) > 1) {
            throw new Exception('Page introuvable');
        } else {
            $this->showDetailsBundle($url);
        }
    }

    private function showDetailsBundle($titre) {
        $this->_bundleManager = new BundleManager();
        $bundles = $this->_bundleManager->getBundle($titre);

        $this->_compteManager = new CompteManager();
        $comptes = $this->_compteManager->getComptes();

        $this->_view = new View('Bundle');
        $this->_view->generate(array('bundles' => $bundles, 'comptes' => $comptes));
    }
}