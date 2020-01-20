<?php

class AchatManager extends Model {
    public function getAchatId($idCompte) {

    }

    public function setAchatPerso($idCompte, $titreProduit) {
        echo addNewAchat($idCompte, $titreProduit);
        $this->insertElementDB(addNewAchat($idCompte, $titreProduit));
        $data = $this->reqSelectDB_Tuple(getAchatLastId());
        $this->insertElementDB(addNewAchatPerso($data));
    }

    public function setAchatAmi($idCompte, $titreProduit, $idAmi) {
        echo addNewAchat($idCompte, $titreProduit);
        $this->insertElementDB(addNewAchat($idCompte, $titreProduit));
        $data = $this->reqSelectDB_Tuple(getAchatLastId());
        $this->insertElementDB(addNewAchatAmi($data,$idAmi));
    }
}