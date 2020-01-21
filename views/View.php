<?php
class View {
	private $_file;
	private $_t;
	private $_compteManager;
	private $_comptes;
	
	// constructeur
	public function __construct($action) {
		$this->_file = 'views/view'.$action.'.php';
        $this->_compteManager = new CompteManager();
        $this->_comptes = $this->_compteManager->getComptes();
	}
	
	// génère et affiche la vue
	public function generate($data) {
		// partie spécifique de la vue
		$content = $this->generateFile($this->_file, $data);
		
		// template
		$view = $this->generateFile('views/template.php', array('t' => $this->_t, 'content' => $content, 'comptes' => $this->_comptes));
		
		echo $view;
	}
	
	// génère un fichier vue et renvoie le résultat produit
	public function generateFile($file, $data)
    {
        if (file_exists($file)) {
            extract($data);
            // mise en tampon
            ob_start();

            // inclut le fichier vue
            require $file;

            return ob_get_clean();
        } else {
            throw new Exception('Fichier ' . $file . ' introuvable');
        }
    }
}