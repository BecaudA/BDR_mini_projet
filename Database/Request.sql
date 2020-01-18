USE stome;

#Affichage d'un bundle
SELECT *
FROM bundlePrix;

#Promotion à part car sinon poucentage * nombre de tuple
SELECT SUM(promotion.pourcentage) AS promotion
	FROM promotion
WHERE titreProduit = "Bundle Monster Hunter World";

#Liste des jeux dans Bundle
SELECT titreProduit, produit.prix AS prixInitial, contenu.ageLegal, contenu.description
FROM bundlecomprend
INNER JOIN produit
	ON produit.titre = titreProduit
INNER JOIN bundle
	ON bundle.titre = titreBundle
INNER JOIN contenu
    ON contenu.titre = produit.titre
LEFT JOIN jeu
    ON jeu.titre = contenu.titre
LEFT JOIN dlc
    ON dlc.titre = contenu.titre
WHERE titreBundle = "Bundle Monster Hunter World";

#nom produit, prix, prix calculé, promotion, âge
SELECT produit.titre,
				CASE WHEN produit.titre = bundlePrix.titre
	            THEN bundlePrix.prixBundle
	            ELSE produit.prix
                END AS prix,

                CASE WHEN produit.titre = bundlePrix.titre
	            THEN bundlePrix.ageLegal
	            ELSE contenu.ageLegal
                END AS ageLegal,

                calculPrixPromo(produit.titre,
                CASE WHEN produit.titre = bundlePrix.titre
	            THEN bundlePrix.prixBundle
	            ELSE produit.prix
                END) AS prixReel, COALESCE(
                (SELECT SUM(promotion.pourcentage)
				FROM promotion
				WHERE titreProduit = produit.titre AND
                CURRENT_TIMESTAMP() BETWEEN promotion.dateDebut AND promotion.dateFin), 0) AS pourcentagePromo
FROM produit
LEFT JOIN bundlePrix
	ON produit.titre = bundlePrix.titre
LEFT JOIN contenu
    ON contenu.titre = produit.titre
LEFT JOIN promotion
	ON promotion.titreProduit = produit.titre
LEFT JOIN jeu
    ON jeu.titre = contenu.titre
LEFT JOIN dlc
    ON dlc.titre = contenu.titre
GROUP BY produit.titre;

#Age legal max d'un compte
SELECT MAX(contenu.ageLegal) INTO ageProduit
    FROM bundlecomprend
    INNER JOIN produit
    ON bundlecomprend.titreProduit = produit.titre
    INNER JOIN bundle
    ON bundlecomprend.titreBundle = bundle.titre
    INNER JOIN contenu
    ON contenu.titre = produit.titre
    WHERE bundlecomprend.titreBundle = NEW.titreProduit;

#Produit le plus vendus
SELECT titre, COUNT(*),AVG(prix)
FROM produit;

SELECT SUM(promotion.pourcentage)
	FROM promotion
	WHERE titreProduit = "Monster Hunter Iceborn" AND CURRENT_TIMESTAMP() BETWEEN promotion.dateDebut AND promotion.dateFin;