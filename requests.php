<?php

function getAllProduits(){
    return "SELECT * FROM stome.vueProduit";
}

function getBundleById($id){
    return "SELECT * FROM stome.vueproduit WHERE titre = \"".$id."\"";
}

function getBundleProduits($id){
    return "SELECT titreProduit FROM stome.bundlecomprend WHERE titreBundle = \"".$id."\"";
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
    return "SELECT * FROM stome.vueproduit WHERE vueproduit.titre = \"".$titre."\"";
}

function getBundle($titre) {
    return "SELECT * FROM stome.Bundle WHERE Bundle.titre = \"".$titre."\"";
}

