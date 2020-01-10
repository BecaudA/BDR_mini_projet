<?php
// le <class>Manager fait la requête vers la base de données
class CompteManager extends Model {
	public function getComptes() {
        $request = parse_ini_file('requests.ini')['getAllAccounts'];
		return $this->reqSelectDB($request, 'Compte');
	}
}