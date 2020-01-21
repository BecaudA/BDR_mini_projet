<?php

class AchatManager extends Model {
    public function getAchatId($idCompte) {

    }

    public function setAchatPerso($idCompte, $titreProduit) {
        $this->insertElementDB(addNewAchatPerso($idCompte, $titreProduit));
    }

    public function setAchatAmi($idCompte, $titreProduit, $idAmi) {
        $this->insertElementDB(addNewAchatAmi($idAmi,$idCompte, $titreProduit));
    }
}