<?php

function getAllProduits(){
    return "SELECT * FROM stome.vueProduit";
}

function getContenu($id){
    return "S"."ELECT * FROM stome.Contenu WHERE titre = \"".$id."\"";
}

function getLanguesContenu($id){
    return "S"."ELECT * FROM stome.Esttraduit WHERE titreContenu = \"". $id. "\"";
}

function getGenreContenu($id){
    return "S"."ELECT * FROM stome.PossedeGenre WHERE titreContenu = \"". $id. "\"";
}

function getFranchise($id){
    return "S"."ELECT franchise FROM stome.Jeu WHERE titre = \"". $id. "\"";
}

function getDeveloppeur($id){
    return "S"."ELECT developpeur FROM stome.Jeu WHERE titre = \"". $id. "\"";
}

function getEditeur($id){
    return "S"."ELECT editeur FROM stome.jeu WHERE titre = \"". $id. "\"";
}

function getProduit($titre) {
    return "SELECT * FROM stome.Produit WHERE Produit.titre = \"".$titre."\"";
}

function getBundle($titre) {
    return "SELECT * FROM stome.Bundle WHERE Bundle.titre = \"".$titre."\"";
}

