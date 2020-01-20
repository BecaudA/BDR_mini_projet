USE stome;

#Affichage d'un Bundle
SELECT *
FROM BundlePrix;

#Promotion à part car sinon poucentage * nombre de tuple
SELECT SUM(Promotion.pourcentage) AS Promotion
	FROM Promotion
WHERE titreProduit = "Bundle Monster Hunter World";

#Liste des Jeux dans Bundle
SELECT titreProduit, Contenu.prix AS prixInitial, Contenu.ageLegal, Contenu.description
FROM BundleComprend
INNER JOIN Produit
	ON Produit.titre = titreProduit
INNER JOIN Bundle
	ON Bundle.titre = titreBundle
INNER JOIN Contenu
    ON Contenu.titre = Produit.titre
LEFT JOIN Jeu
    ON Jeu.titre = Contenu.titre
LEFT JOIN DLC
    ON DLC.titre = Contenu.titre
WHERE titreBundle = "Bundle Monster Hunter World";

#nom Produit, prix, prix calculé, Promotion, âge
SELECT Produit.titre,
				CASE WHEN Produit.titre = bundlePrix.titre
	            THEN bundlePrix.prixBundle
	            ELSE Contenu.prix
                END AS prix,

                CASE WHEN Produit.titre = bundlePrix.titre
	            THEN bundlePrix.ageLegal
	            ELSE Contenu.ageLegal
                END AS ageLegal,

                calculPrixPromo(Produit.titre,
                CASE WHEN Produit.titre = bundlePrix.titre
	            THEN bundlePrix.prixBundle
	            ELSE Contenu.prix
                END) AS prixReel, COALESCE(
                (SELECT SUM(Promotion.pourcentage)
				FROM Promotion
				WHERE titreProduit = Produit.titre AND
                CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin), 0) AS pourcentagePromo
FROM Produit
LEFT JOIN bundlePrix
	ON Produit.titre = bundlePrix.titre
LEFT JOIN Contenu
    ON Contenu.titre = Produit.titre
LEFT JOIN Promotion
	ON Promotion.titreProduit = Produit.titre
LEFT JOIN Jeu
    ON Jeu.titre = Contenu.titre
LEFT JOIN DLC
    ON DLC.titre = Contenu.titre
GROUP BY Produit.titre;

#Produit le plus vendus
SELECT titre, COUNT(*),AVG(prix)
FROM Contenu;

SELECT SUM(Promotion.pourcentage)
	FROM Promotion
	WHERE titreProduit = "Monster Hunter Iceborn" AND CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin;



WITH RECURSIVE cte_COB(titre) AS (
    SELECT DISTINCT vPC.titreProduit FROM stome.vueProduitsComptes AS vPC
        WHERE vPC.idProprietaire = 2
    UNION ALL
    SELECT BC.titreProduit
        FROM cte_COB JOIN stome.BundleComprend as BC
                ON cte_COB.titre = BC.titreBundle
) SELECT cte_COB.titre FROM cte_COB
    INNER JOIN stome.Contenu
            ON Contenu.titre = cte_COB.titre
    GROUP BY cte_COB.titre;