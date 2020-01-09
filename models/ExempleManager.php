<?php
// le <class>Manager fait la requête vers la base de données
class ExempleManager extend Model {
	public function getExemples() {
		return $this->reqSelectDB('SELECT * FROM Exemple', 'Exemple');
	}
}