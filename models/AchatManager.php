<?php

class AchatManager extends Model {
    public function getAchatId($idCompte) {

    }

    public function setAchatPerso($idCompte, $titreProduit) {
        echo addNewAchatPerso($idCompte, $titreProduit);
        $this->insertElementDB(addNewAchatPerso($idCompte, $titreProduit));
    }

    public function setAchatAmi($idCompte, $titreProduit, $idAmi) {
        echo addNewAchatAmi($idAmi,$idCompte, $titreProduit);
        $this->insertElementDB(addNewAchatAmi($idAmi,$idCompte, $titreProduit));
    }
}