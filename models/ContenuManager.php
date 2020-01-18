<?php

include 'requests.php';

class ContenuManager extends Model {

    public function getDetailsContenu($titre) {
        $contenu = $this->reqSelectDB(getContenu("Monster Hunter World"), "Contenu");

        $data = $this->reqSelectDB_Tuples(getLanguesContenu($contenu[0]->titre()));
        $contenu[0]->set_langues($data);

        $contenu[0]->set_contenus($this->reqSelectDB_Tuples(getGenreContenu($contenu[0]->titre())));

        return $contenu;
    }
}