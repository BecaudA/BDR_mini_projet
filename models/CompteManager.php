<?php
// le <class>Manager fait la requête vers la base de données
class CompteManager extends Model {
	public function getComptes() {
		return $this->reqSelectDB(getComptes(), 'Compte');
	}

	public function getCompte($id) {
	    $comptes = $this->reqSelectDB(getCompte($id), 'Compte');
	    $comptes[0]->set_achats($this->getAchatsCompte($comptes[0]->id()));

	    return $comptes;
    }

    public function getAchatsCompte($id) {
        return $this->reqSelectDB_Tuples(getAchatsCompte($id));
    }

    public function doesCompteExist($id) {
        return !empty($this->reqSelectDB(getCompte($id), 'Bundle'));
    }
}