USE stome;

#Affichage d'un Bundle
SELECT *
FROM BundlePrix;

#Promotion à part car sinon poucentage * nombre de tuple
SELECT SUM(Promotion.pourcentage) AS Promotion
	FROM Promotion
WHERE titreProduit = "Bundle Monster Hunter World";

#Liste des Jeux dans Bundle
SELECT titreProduit, Produit.prix AS prixInitial, Contenu.ageLegal, Contenu.description
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
				CASE WHEN Produit.titre = BundlePrix.titre
	            THEN BundlePrix.prixBundle
	            ELSE Produit.prix
                END AS prix,

                CASE WHEN Produit.titre = BundlePrix.titre
	            THEN BundlePrix.ageLegal
	            ELSE Contenu.ageLegal
                END AS ageLegal,

                calculPrixPromo(Produit.titre,
                CASE WHEN Produit.titre = BundlePrix.titre
	            THEN BundlePrix.prixBundle
	            ELSE Produit.prix
                END) AS prixReel, COALESCE(
                (SELECT SUM(Promotion.pourcentage)
				FROM Promotion
				WHERE titreProduit = Produit.titre AND
                CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin), 0) AS pourcentagePromo
FROM Produit
LEFT JOIN BundlePrix
	ON Produit.titre = BundlePrix.titre
LEFT JOIN Contenu
    ON Contenu.titre = Produit.titre
LEFT JOIN Promotion
	ON Promotion.titreProduit = Produit.titre
LEFT JOIN Jeu
    ON Jeu.titre = Contenu.titre
LEFT JOIN DLC
    ON DLC.titre = Contenu.titre
GROUP BY Produit.titre;

#Age legal max d'un compte
SELECT MAX(Contenu.ageLegal) INTO ageProduit
    FROM BundleComprend
    INNER JOIN Produit
    ON BundleComprend.titreProduit = Produit.titre
    INNER JOIN Bundle
    ON BundleComprend.titreBundle = Bundle.titre
    INNER JOIN Contenu
    ON Contenu.titre = Produit.titre
    WHERE BundleComprend.titreBundle = NEW.titreProduit;

#Produit le plus vendus
SELECT titre, COUNT(*),AVG(prix)
FROM Produit;

SELECT SUM(Promotion.pourcentage)
	FROM Promotion
	WHERE titreProduit = "Monster Hunter Iceborn" AND CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin;