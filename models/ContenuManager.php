<?php

class ContenuManager extends Model {
    public function getDetailsContenu($titre) {
        $request = parse_ini_file('requests.ini')['getDetailsContenu'] . " \"" . $titre . "\"";
        return $this->reqSelectDB($request, 'Contenu');
    }
}