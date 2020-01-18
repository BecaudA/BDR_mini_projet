<?php
function getAllProduits($id){
    return "S"."ELECT * FROM stome.vueProduit";
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
