<?php
require_once('views/View.php');

class ControllerBundle {
    private $_bundleManager;
    private $_view;

    public function __construct($url) {
        if (isset($url) && count($url) > 1) {
            throw new Exception('Page introuvable');
        } else {
            $this->showDetailsContenu($url);
        }
    }

    private function showDetailsContenu($titre) {
        $this->_bundleManager = new BundleManager();
        $bundles = $this->_bundleManager->getBundleM($titre);

        //
        $this->_view = new View('Bundle');
        $this->_view->generate(array('bundles' => $bundles));
    }
}