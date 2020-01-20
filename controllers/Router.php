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
			spl_autoload_register(function($class) {
				require_once('models/'.$class.'.php');
			});
			
			$url = '';
			
			// si le paramètre url est donné -> essaye d'executer le controlleur correspondant
			if (isset($_GET['url'])) {
				// filtre l'url
				$url = explode('/', filter_var($_GET['url'], FILTER_SANITIZE_URL));

				echo "url[0]=".$url[0].", "; // DEBUG
				// trouve le controlleur correspondant à l'url
                // crée un string "controllers/Controller<url[0]>.php
                // url[0] peut valoir:
                // - Boutique
                // - titre d'un jeu
                // - valeur inconnue (exemple: acfgjvkuil)
				$controller = ucfirst(strtolower($url[0]));
				$controllerClass = "Controller".$controller;
				$controllerFile = "controllers/".$controllerClass.".php";

				echo "controllerFile=".$controllerFile.", "; // DEBUG

				// vérifie si le fichier du controlleur existe
				if (file_exists($controllerFile)) {
				    echo "exist"; //DEBUG
				    // construction du controlleur
					require_once($controllerFile);
					$this->_ctrl = new $controllerClass($url);
				} else {
				    $id = str_replace('_', ' ', $url[0]);
				    // trouve le controlleur correspondant à l'url entrée
                    // valeur prise en charge pour l'url:
                    // - titre d'un contenu (jeu, dlc) ou d'un bundle
				    $controller = $this->findController($id);
                    $controllerClass = "Controller".$controller;
                    $controllerFile = "controllers/".$controllerClass.".php";

                    echo "new controllerFile=".$controllerFile.", "; //DEBUG
                    echo "title=".$id.", ";

                    // vérifie à nouveau si le fichier du controlleur existe
                    if (file_exists($controllerFile)) {
                        echo "exist, "; // DEBUG
                        // construction du controlleur

                        require_once($controllerFile);
                        $this->_ctrl = new $controllerClass($id);
                    } else throw new Exception('Page introuvable');
				}
			} else {
                // execute le controlleur par défaut
                require_once('controllers/ControllerBoutique.php');
                $this->_ctrl = new ControllerBoutique($url);
            }
		}
		catch (Exception $e) {
			$errorMsg = $e->getMessage();
			$this->_view = new View('Error');
			$this->_view->generate(array('errorMsg' => $errorMsg));
		}
	}

	private function findController($controller_id) {
	    $produitManager = new ProduitManager();
        $bundleManager = new BundleManager();
        $compteManager = new CompteManager();

        echo "given id=".$controller_id.", ";

        // vérifie si un produit du même titre que l'id existe
        if ($produitManager->doesProduitExist($controller_id)) {
            if ($bundleManager->doesBundleExist($controller_id)) {
                return "Bundle";
            } else {
                return "Contenu";
            }
        }

        // vérifie si un compte du même id existe
        if ($compteManager->doesCompteExist($controller_id)) {
            return "Compte";
        }

        return "";
	}
}