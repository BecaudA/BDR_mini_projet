<?php

// modèle pour les classes d'objets représentant un Jeu, un Achat, etc.
abstract class Model {
	
	private static $_db;
	private static $_host;
	private static $_dbName;
	private static $_user;
	private static $_passwd;

    // constructeur préparant les paramètre de connexion à la BD
    public function __construct() {
        $config = parse_ini_file('dbConfig.ini');

        self::$_host = $config['db_host'];
        self::$_dbName = $config['db_name'];
        self::$_user = $config['db_user'];
        self::$_passwd = $config['db_password'];
    }

	// instancie la connexion à la base de données
	private static function setDB() {
		self::$_db = new PDO('mysql:host=' . self::$_host . ';dbname=' . self::$_dbName . ';charset=utf8', self::$_user, self::$_passwd);
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
    // résultat socké dans un array d'objet $class
	protected function reqSelectDB($select, $class) {
		$var = [];
		self::$_db == $this->getDB();
		$req = self::$_db->prepare($select);
		$req->execute();
		
		while ($data = $req->fetch(PDO::FETCH_ASSOC)) {
			$var[] = new $class($data);
		}
        $req->closeCursor();
        return $var;
	}
 }