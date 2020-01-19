<?php
class ContenuManager extends Model {

    public function getDetailsContenu($titre) {
        $contenus = $this->reqSelectDB(getContenu($titre), "Contenu");
        if (empty($contenus)) {
            echo "contenus is empty!, ";
            return null;
        }

        $data = $this->reqSelectDB_Tuples(getLanguesContenu($contenus[0]->titre()));
        $contenus[0]->set_langues($data);
        $contenus[0]->set_genres($this->reqSelectDB_Tuples(getGenreContenu($contenus[0]->titre())));
        return $contenus;
    }
}