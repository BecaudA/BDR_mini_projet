<?php
// le <class>Manager fait la requête vers la base de données
class CompteManager extends Model {
	public function getComptes() {
		return $this->reqSelectDB('SELECT * FROM stome.Compte', 'Compte');
	}
}