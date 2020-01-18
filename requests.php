<?php

function getAllProduits(){
    return "SELECT * FROM stome.vueProduit";
}

function getContenu($id){
    return "S"."ELECT * FROM stome.contenu WHERE titre = \"".$id."\"";
}

function getLanguesContenu($id){
    return "S"."ELECT * FROM stome.Esttraduit WHERE titreContenu = \"". $id. "\"";
}

function getGenreContenu($id){
    return "S"."ELECT * FROM stome.PossedeGenre WHERE titreContenu = \"". $id. "\"";
}
function getProduit($titre) {
    return "SELECT * FROM stome.Produit WHERE Produit.titre = \"".$titre."\"";
}

function getBundle($titre) {
    return "SELECT * FROM stome.Bundle WHERE Bundle.titre = \"".$titre."\"";
}

