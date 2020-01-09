<?php
// modèle pour les classes d'objets représentant un Jeu, un Achat, etc.
abstract class Model {
	
	private static $_db;
	
	// instancie la connexion à la base de données
	private static function setDB() {
		self::$_db = new PDO('mysql:host=localhost;dbname=stome;charset=utf8', 'root', 'root');
		self::$_db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
	}
	
	// recupère la connexion à la base de donnée
	protected function getDB() {
		if (self::$_db == null) {
			self::setDB();
		}
		return self::$_db;
	}
	
	// fait une requête (SELECT) à la base de donnée
	protected function reqSelectDB($select, $class) {
		$var = [];
		//self::setDB();
		$req = self::$_db->prepare($select);
		$req->execute();
		
		while ($data = $req->fetch(PDO::FETCH_ASSOC)) {
			$var[] = new $class($data);
		}
		return $var;
		$req->closeCursor();
	}
 }