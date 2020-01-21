<?php

class BundleManager extends Model {
    public function getBundle($titre) {
        $bundle = $this->reqSelectDB(getBundleById($titre), "Bundle");
        if (empty($bundle)) {
            return null;
        }
        $bundle[0]->set_listeProduits($this->reqSelectDB(getBundleProduits($titre), "Produit"));
        return $bundle;
    }

    public function doesBundleExist($titre) {
        return !empty($this->reqSelectDB(getBundle($titre), 'Bundle'));
    }
}