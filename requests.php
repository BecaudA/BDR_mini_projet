<?php

function getAllProduits(){
    return "SELECT * FROM stome.vueProduit";
}

function getBundleById($id){
    return "SELECT * FROM stome.vueProduit WHERE titre = \"".$id."\"";
}

function getBundleProduits($id){
    return "SELECT titreProduit FROM stome.BundleComprend WHERE titreBundle = \"".$id."\"";
}

function getContenu($id){
    return "SELECT * FROM stome.vueContenu WHERE titre = \"".$id."\"";
}

function getLanguesContenu($id){
    return "SELECT * FROM stome.EstTraduit WHERE EstTraduit.titreContenu = \"". $id. "\"";
}

function getGenreContenu($id){
    return "SELECT * FROM stome.PossedeGenre WHERE PossedeGenre.titreContenu = \"". $id. "\"";
}

function getProduit($titre) {
    return "SELECT * FROM stome.Produit WHERE Produit.titre = \"".$titre."\"";
}

function getProduitFromView($titre) {
    return "SELECT * FROM stome.vueProduit WHERE vueProduit.titre = \"".$titre."\"";
}

function getBundle($titre) {
    return "SELECT * FROM stome.Bundle WHERE Bundle.titre = \"".$titre."\"";
}

function getComptes() {
    return "SELECT * FROM stome.Compte";
}

function getCompte($id) {
    return "SELECT * FROM stome.Compte WHERE Compte.id = \"" . $id . "\"";
}

function getAchatsCompte($idCompte) {
    return "SELECT * FROM stome.vueAchats WHERE  vueAchats.id = \"" . $idCompte . "\"";
}

