<?php
class ContenuManager extends Model {

    public function getDetailsContenu($titre) {
        $contenu = $this->reqSelectDB(getContenu($titre[0]), "Contenu");

        $data = $this->reqSelectDB_Tuples(getLanguesContenu($contenu[0]->titre()));
        $contenu[0]->set_langues($data);
        $contenu[0]->set_genres($this->reqSelectDB_Tuples(getGenreContenu($contenu[0]->titre())));
        return $contenu;
    }
}