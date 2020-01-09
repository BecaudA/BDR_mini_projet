<?php
define('URL', str_replace("index.php", "", (isset($_SERVER['HTTPS']) ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[PHP_SELF]"));
// la page index.php utilise la classe Router pour rediriger vers les controlleurs 
// et ainsi afficher le vues requises
require_once('controllers/Router.php');
$router = new Router();
$router->routeReq();