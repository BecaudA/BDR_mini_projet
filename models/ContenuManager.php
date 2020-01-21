<?php
class ContenuManager extends Model {

    public function getContenu($titre) {
        $contenus = $this->reqSelectDB(getContenu($titre), "Contenu");
        if (empty($contenus)) {
            return null;
        }
        $data = $this->reqSelectDB_Tuples(getLanguesContenu($contenus[0]->titre()));
        $contenus[0]->set_langues($data);
        $contenus[0]->set_genres($this->reqSelectDB_Tuples(getGenreContenu($contenus[0]->titre())));
        return $contenus;
    }

    public function getJeux() {
        return $this->reqSelectDB(getJeux(), "Contenu");
    }

    public function addJeu($titre, $age, $prix, $description, array $genres, array $langues, $developpeur, $editeur, $franchise) {
        // insert dans Produit
        $this->insertElementDB(addProduit($titre));
        // insert dans Contenu
        $this->insertElementDB(addContenu($titre, $age, $prix, $description));
        // insert dans Jeu
        $this->insertElementDB(addJeu($titre, $developpeur, $editeur, $franchise));
        // insert dans PossedeGenre
        $this->insertElementDB(addGenresAJeu($titre, $genres));
        // insert dans EstTraduit
        $this->insertElementDB(addLanguesAJeu($titre, $langues));
    }

    public function getGenres() {
        // récupère tous les genres
        $data = $this->reqSelectDB_Tuples(getGenres());
        // création d'un tableau de genres
        $genres = array();
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                if($key == "genre")
                    array_push($genres, $value);
            }
        }
        return $genres;
    }

    public function getLangues() {
        // récupère toutes les langues
        $data = $this->reqSelectDB_Tuples(getGenres());
        // création d'un tableau de langues
        $langues = array();
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                if($key == "langue")
                    array_push($langues, $value);
            }
        }
        return $langues;
    }

    public function getEntreprises() {
        // récupère toutes les enterprises
        $data = $this->reqSelectDB_Tuples(getEntreprises());
        // création d'un tableau d'enterprises
        $entreprises = array();
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                if($key == "nom")
                    array_push($entreprises, $value);
            }
        }
        return $entreprises;
    }

    public function getFranchises() {
        // récupère toutes les franchises
        $data = $this->reqSelectDB_Tuples(getFranchises());
        // création d'un tableau de franchises
        $franchises = array();
        foreach ($data as $row) {
            foreach ($row as $key => $value){
                if($key == "titre")
                    array_push($franchises, $value);
            }
        }
        return $franchises;
    }
}