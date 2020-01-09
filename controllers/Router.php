<?php
require_once('views/View.php');
// class qui redirige l'url vers les controlleurs
// attention aux conventions de nommage: 
// -> les noms de fichiers, de classes et de certaines fonctions doivent correspondre à certains formats
class Router {
	
	private $_ctrl;
	private $_view;
	
	public function routeReq() {
		try {
			// chargement automatique des classes
			spl_autoload_register(function($class)) {
				require_once('models/'.$class',php';
			});
			
			$url = '';
			
			// si le paramètre url est donné -> essaye d'executer le controlleur correspondant
			if (isset($_GET['url'])) {
				// filtre l'url
				$url = explode('/', filter_var($_GET['url'], FILTER_SANITIZE_URL));
				
				// trouve le controlleur correspondant à l'url
				$controller = ucfirst(strtolower($url[0]));
				$controllerClass = "Controller".$controller;
				$controllerFile = "controllers/".$controllerClass.".php";
				
				// vérifie si le fichier du controlleur existe
				if (file_exists($controllerFile)) {
					require_once($controllerFile);
					$this->_ctrl = new controllerClass($url);
				} else {
					throw new Exception('Page introuvable');
				}
			} else {
				// execute le controlleur par défaut
				require_once('controllers/ControllerAccueil.php');
				$this->_ctrl = new ControllerAccueil($url);
		}
		catch (Exception $e) {
			$errorMsg = $e->getMessage();
			$this->_view = new View('Error');
			$this->_view->generate(array('errorMsg' => $errorMsg));
		}
	}
}