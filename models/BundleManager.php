<?php

class BundleManager extends Model {
    public function getBundle($titre) {
        $bundle = $this->reqSelectDB(getBundleById($titre), "Bundle");
        if (empty($bundle)) {
            echo "Bundle is empty!, ";
            return null;
        }
        //$bundle[0]->set_listeProduits($this->reqSelectDB(getBundleProduits($titre), "Produit"));

        $produitsTitres = $this->reqSelectDB_Tuples(getBundleProduits($titre));
        $produits = array();
        foreach ($produitsTitres as $key => $titreProduit){
            array_push($produits, $this->reqSelectDB_TupleClasse(getProduitFromView($titreProduit['titreProduit']),"Produit"));
        }
        $bundle[0]->set_listeProduits($produits);
        return $bundle;
    }

    public function doesBundleExist($titre) {
        return !empty($this->reqSelectDB(getBundle($titre), 'Bundle'));
    }
}