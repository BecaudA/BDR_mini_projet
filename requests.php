<?php

function getAllProduits(){
    return "SELECT * FROM stome.vueProduit";
}

function getBundleById($id){
    return "SELECT * FROM stome.vueProduit WHERE titre = \"".$id."\"";
}

function getBundleProduits($id) {
    return "SELECT VP.* FROM stome.BundleComprend AS BC 
                INNER JOIN vueProduit AS VP 
                    ON BC.titreProduit = VP.titre WHERE titreBundle = \"".$id."\"";
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

function getJeuxCompte($idCompte) {
    return "WITH RECURSIVE cte_COB(titre) AS (
                SELECT DISTINCT vPC.titreProduit FROM stome.vueProduitsComptes AS vPC
                    WHERE vPC.idProprietaire = ". $idCompte . "
                UNION ALL
                SELECT BC.titreProduit
                    FROM cte_COB JOIN stome.BundleComprend as BC
                            ON cte_COB.titre = BC.titreBundle
            ) SELECT cte_COB.titre FROM cte_COB
                INNER JOIN stome.Contenu
                        ON Contenu.titre = cte_COB.titre
                GROUP BY cte_COB.titre;";
}

function getAmisCompte($id) {
    return "SELECT C.id, C.nom, C.prenom, C.email, c.porteMonnaie, c.dateNaissance FROM Compte AS C
                INNER JOIN EstAmi ON C.id = EstAmi.idAmi
                WHERE EstAmi.idCompte = ".$id;
}

function addNewAchatAmi($idAmi, $idCompte, $titreProduit){
    return "START TRANSACTION;
            INSERT INTO Achat(idCompte, titreProduit, date) VALUES (\"". $idCompte ."\", \"". $titreProduit . "\", NOW());
            INSERT INTO AchatAmi(id, idAmi) VALUES ((". getAchatLastId() . "), ".$idAmi.")".";COMMIT;";
}

function addNewAchatPerso($idCompte, $titreProduit){
    return "START TRANSACTION;
            INSERT INTO Achat(idCompte, titreProduit, date) VALUES (\"". $idCompte ."\", \"". $titreProduit . "\", NOW());
            INSERT INTO AchatAmi(id, idAmi) VALUES ((".getAchatLastId()."))".";COMMIT;";
}

function getAchatLastId(){
    return "SELECT id FROM Achat ORDER BY id DESC LIMIT 1";
}
