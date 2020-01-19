<?php

function getAllProduits(){
    return "SELECT * FROM stome.vueProduit";
}

function getContenu($id){
    return "SELECT * FROM stome.vueContenu WHERE titre = \"".$id."\"";
}

function getLanguesContenu($id){
    return "SELECT * FROM stome.EstTraduit WHERE titreContenu = \"". $id. "\"";
}

function getGenreContenu($id){
    return "SELECT * FROM stome.PossedeGenre WHERE titreContenu = \"". $id. "\"";
}

function getProduit($titre) {
    return "SELECT * FROM stome.Produit WHERE Produit.titre = \"".$titre."\"";
}

function getBundle($titre) {
    return "SELECT * FROM stome.Bundle WHERE Bundle.titre = \"".$titre."\"";
}

