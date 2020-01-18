<?php

class BundleManager extends Model {
    public function getBundle($titre) {
        //TODO
    }

    public function doesBundleExist($titre) {
        return !empty($this->reqSelectDB(getBundle($titre), 'Bundle'));
    }
}