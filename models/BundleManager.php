<?php

class BundleManager extends Model {
    public function getBundle($titre) {
        $bundle = $this->reqSelectDB(getBundleById($titre), "Bundle");
        if (empty($bundle)) {
            echo "Bundle is empty!, ";
            return null;
        }
        $bundle[0]->set_listeProduits($this->reqSelectDB(getBundleProduits($titre), "Produit"));
        echo var_dump($bundle[0]->listeProduits());
        return $bundle;
    }

    public function doesBundleExist($titre) {
        return !empty($this->reqSelectDB(getBundle($titre), 'Bundle'));
    }
}