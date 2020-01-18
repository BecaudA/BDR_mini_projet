-- MySQL Script generated by MySQL Workbench
-- Mon Dec 23 08:48:13 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema stome
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS stome DEFAULT CHARACTER SET utf8 ;
USE stome ;

-- -----------------------------------------------------
-- Table Compte
-- -----------------------------------------------------
CREATE TABLE Compte (
  id INT AUTO_INCREMENT,
  nom VARCHAR(45) NOT NULL,
  prenom VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  porteMonnaie INT UNSIGNED NULL,
  dateNaissance DATE NOT NULL,
  PRIMARY KEY (id))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Produit
-- -----------------------------------------------------
CREATE TABLE Produit (
  titre VARCHAR(80),
    PRIMARY KEY (titre))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Achat
-- -----------------------------------------------------
CREATE TABLE Achat (
  id INT AUTO_INCREMENT,
  idCompte INT NULL,
  titreProduit VARCHAR(80) NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Compte_idCompteAchat
    FOREIGN KEY (idCompte)
    REFERENCES Compte (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT FK_Produit_titreAchat
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AchatAmi
-- -----------------------------------------------------
CREATE TABLE AchatAmi (
  id INT NOT NULL,
  idAmi INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Achat_idAmi
    FOREIGN KEY (id)
    REFERENCES Achat (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Compte_idAmiAchat
    FOREIGN KEY (idAmi)
    REFERENCES Compte (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AchatPersonnel
-- -----------------------------------------------------
CREATE TABLE AchatPersonnel (
  id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Achat_idPersonnel
    FOREIGN KEY (id)
    REFERENCES Achat (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Bundle
-- -----------------------------------------------------
CREATE TABLE Bundle (
  titre VARCHAR(80),
  PRIMARY KEY (titre),
  CONSTRAINT FK_Produit_titreBundle
    FOREIGN KEY (titre)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Contenu
-- -----------------------------------------------------
CREATE TABLE Contenu (
  titre VARCHAR(80),
  ageLegal INT UNSIGNED NOT NULL,
  prix FLOAT UNSIGNED NOT NULL,
  description LONGTEXT NULL,
  PRIMARY KEY (titre),
  CONSTRAINT FK_Produit_titreContenu
    FOREIGN KEY (titre)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Langue
-- -----------------------------------------------------
CREATE TABLE Langue (
  nom VARCHAR(45) NOT NULL,
  PRIMARY KEY (nom))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Genre
-- -----------------------------------------------------
CREATE TABLE Genre (
  nom VARCHAR(45) NOT NULL,
  PRIMARY KEY (nom))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Promotion
-- -----------------------------------------------------
CREATE TABLE Promotion (
  id INT AUTO_INCREMENT,
  titreProduit VARCHAR(80) NOT NULL,
  pourcentage DECIMAL UNSIGNED NOT NULL,
  dateDebut DATE NOT NULL,
  dateFin DATE NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Produit_titrePromotion
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Entreprise
-- -----------------------------------------------------
CREATE TABLE Entreprise (
  nom VARCHAR(80) NOT NULL,
  PRIMARY KEY (nom))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Franchise
-- -----------------------------------------------------
CREATE TABLE Franchise (
  titre VARCHAR(80),
  nomEntreprise VARCHAR(45) NOT NULL,
  PRIMARY KEY (titre),
  CONSTRAINT FK_Entreprise_nom
    FOREIGN KEY (nomEntreprise)
    REFERENCES Entreprise (nom)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Jeu
-- -----------------------------------------------------
CREATE TABLE Jeu (
  titre VARCHAR(80),
  developpeur VARCHAR(80) NOT NULL,
  editeur VARCHAR(80) NOT NULL,
  franchise VARCHAR(80) NULL,
  PRIMARY KEY (titre),
  CONSTRAINT FK_Contenu_titreJeu
    FOREIGN KEY (titre)
    REFERENCES Contenu (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Entreprise_nomDeveloppeur
    FOREIGN KEY (developpeur)
    REFERENCES Entreprise (nom)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT FK_Entreprise_nomEditeur
    FOREIGN KEY (editeur)
    REFERENCES Entreprise (nom)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT FK_Franchise_titre
    FOREIGN KEY (franchise)
    REFERENCES Franchise (titre)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table DLC
-- -----------------------------------------------------
CREATE TABLE DLC (
  titre VARCHAR(80),
  titreJeu VARCHAR(80) NOT NULL,
  PRIMARY KEY (titre),
  CONSTRAINT FK_Contenu_titreDLC
    FOREIGN KEY (titre)
    REFERENCES Contenu (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Jeu_titre
    FOREIGN KEY (titreJeu)
    REFERENCES Jeu (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table BundleComprend
-- -----------------------------------------------------
CREATE TABLE BundleComprend (
  titreBundle VARCHAR(80) NOT NULL,
  titreProduit VARCHAR(80) NOT NULL,
  PRIMARY KEY (titreBundle, titreProduit),
  CONSTRAINT FK_Bundle_titre
    FOREIGN KEY (titreBundle)
    REFERENCES Bundle (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Produit_titreBundleCompris
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table EstTraduit
-- -----------------------------------------------------
CREATE TABLE EstTraduit (
  titreContenu VARCHAR(80) NOT NULL,
  nomLangue VARCHAR(45) NOT NULL,
  PRIMARY KEY (titreContenu, nomLangue),
  CONSTRAINT FK_Contenu_titreTraduit
    FOREIGN KEY (titreContenu)
    REFERENCES Contenu (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Langue_nom
    FOREIGN KEY (nomLangue)
    REFERENCES Langue (nom)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table PossedeGenre
-- -----------------------------------------------------
CREATE TABLE PossedeGenre (
  titreContenu VARCHAR(80) NOT NULL,
  nomGenre VARCHAR(45) NOT NULL,
  PRIMARY KEY (titreContenu, nomGenre),
  CONSTRAINT FK_Contenu_titreGenre
    FOREIGN KEY (titreContenu)
    REFERENCES Contenu (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Genre_nom
    FOREIGN KEY (nomGenre)
    REFERENCES Genre (nom)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table EstNote
-- -----------------------------------------------------
CREATE TABLE EstNote (
  titreProduit VARCHAR(80) NOT NULL,
  idCompte INT NOT NULL,
  note DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (titreProduit, idCompte),
  CONSTRAINT FK_Produit_titreProduitNote
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Compte_idCompteNote
    FOREIGN KEY (idCompte)
    REFERENCES Compte (id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table EstAmi
-- -----------------------------------------------------
CREATE TABLE EstAmi (
  idCompte INT NOT NULL,
  idAmi INT NOT NULL,
  PRIMARY KEY (idCompte, idAmi),
  CONSTRAINT FK_Compte_idCompteAmi
    FOREIGN KEY (idCompte)
    REFERENCES Compte (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Compte_idAmi
    FOREIGN KEY (idAmi)
    REFERENCES Compte (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO Produit(titre) VALUES ("Borderlands");
INSERT INTO Produit(titre) VALUES ("Borderlands 2");
INSERT INTO Produit(titre) VALUES ("Borderlands 3");
INSERT INTO Produit(titre) VALUES ("Monster Hunter World");
INSERT INTO Produit(titre) VALUES ("Monster Hunter Iceborne");
INSERT INTO Produit(titre) VALUES ("Bundle Borderlands");
INSERT INTO Produit(titre) VALUES ("Bundle Monster Hunter World");

INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands", 16, 60, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands 2", 16, 80, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands 3", 18, 90, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Monster Hunter World", 16, 70, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Monster Hunter Iceborne", 16, 50, "DLC of Monster Hunter");

INSERT INTO Bundle(titre) VALUES ("Bundle Borderlands");
INSERT INTO Bundle(titre) VALUES ("Bundle Monster Hunter World");

INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Borderlands", "Borderlands");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Borderlands", "Borderlands 2");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Borderlands", "Borderlands 3");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Monster Hunter World", "Monster Hunter World");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Monster Hunter World", "Monster Hunter Iceborne");

INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Teixeira Carvalho", "Stephane", "test@gmail.com", 100, '2010-04-02');
INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Egremy", "Bruno", "test2@gmail.com", 100, '1999-04-02');
INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Becaud", "Arthur", "test3@gmail.com", 100, '1999-04-03');

INSERT INTO Achat(idCompte, titreProduit, date) VALUES (2, "Borderlands", '2010-04-03');
INSERT INTO Achat(idCompte, titreProduit, date) VALUES (2, "Borderlands", '2010-04-04');

INSERT INTO EstNote(titreProduit, idCompte, note) VALUES ("Monster Hunter Iceborne", 1, 6);

INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 50, '2010-05-06', '2010-06-06');
INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 60, '2010-05-06', '2010-06-06');
INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Bundle Monster Hunter World", 60, '2010-05-06', '2010-06-06');

INSERT INTO Entreprise(nom) VALUES ("Capcom");

INSERT INTO Franchise(titre, nomEntreprise) VALUES ("Monster Hunter", "Capcom");

INSERT INTO Jeu(titre, developpeur, editeur, franchise) VALUES ("Monster Hunter World", "Capcom","Capcom", "Monster Hunter");

INSERT INTO DLC(titre, titreJeu) VALUES ("Monster Hunter Iceborne", "Monster Hunter World");

UPDATE Compte SET porteMonnaie = 100 WHERE id = 2;

DELIMITER $$
CREATE TRIGGER promotion_Pourcentage
BEFORE INSERT
ON Promotion
FOR EACH ROW
BEGIN
	DECLARE pourcentageTotale TINYINT;

	SELECT SUM(pourcentage) INTO pourcentageTotale
	FROM Promotion
	WHERE NEW.titreProduit = titreProduit;

	if(pourcentageTotale IS NULL) THEN
		if(new.pourcentage > 100) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Promotion pas supérieur à 100';
		END IF;
	ELSE
		if(pourcentageTotale + new.pourcentage > 100) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Promotion pas supérieur à 100';
		END IF;
    END IF;
END
$$

DELIMITER $$
CREATE TRIGGER note_Produit
BEFORE INSERT
ON EstNote
FOR EACH ROW
BEGIN
	if(new.note < 0 OR new.note > 5) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Note entre 0 et 5';
	END IF;
END
$$

DELIMITER $$
CREATE TRIGGER bundle_luiMeme
BEFORE INSERT
ON BundleComprend
FOR EACH ROW
BEGIN
	IF (NEW.titreBundle = NEW.titreProduit) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ajout d\'un même bundle';
	END IF;
END
$$

DELIMITER $$
CREATE TRIGGER achat_age
BEFORE INSERT
ON Achat
FOR EACH ROW
BEGIN
	DECLARE ageCompte TINYINT;
    DECLARE ageProduit TINYINT;

    SELECT TIMESTAMPDIFF(YEAR ,Compte.dateNaissance, CURRENT_DATE()) INTO ageCompte
    FROM Compte
    WHERE id= NEW.idCompte;

    #Calcul de l'âge d'achat pour un bundle
    SELECT MAX(Contenu.ageLegal) INTO ageProduit
    FROM BundleComprend
    INNER JOIN Produit
    ON BundleComprend.titreProduit = Produit.titre
    INNER JOIN Bundle
    ON BundleComprend.titreBundle = Bundle.titre
    INNER JOIN Contenu
    ON Contenu.titre = Produit.titre
    WHERE BundleComprend.titreBundle = NEW.titreProduit;

    #Si l'âge du produit veut null cela veut dire que le produit acheter n'est pas un bundle
    if(ageProduit IS NULL) THEN
		#Calcul de l'âge d'achat pour un jeu
		SELECT ageLegal INTO ageProduit
		FROM Contenu
		WHERE titre = NEW.titreProduit;
	END IF;

	IF (ageCompte < ageProduit) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Compte trop jeune';
	ELSE
		UPDATE Compte
		SET Compte.porteMonnaie = Compte.PorteMonnaie - (SELECT prix FROM Produit WHERE NEW.titreProduit = Produit.titre)
		WHERE NEW.idCompte = id;
    END IF;
END
$$

DELIMITER $$
CREATE TRIGGER double_Achat_Produit
BEFORE INSERT
ON Achat
FOR EACH ROW
BEGIN
	DECLARE idAchat TINYINT;
    DECLARE idAchatPerso TINYINT;

	SELECT id INTO idAchat
    FROM Achat
    WHERE new.titreProduit = titreProduit;

    SELECT id INTO idAchatPerso
    FROM Achat
    WHERE idAchat = id;

	IF (idAchat IS NOT NULL AND idAchatPerso IS NOT NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Jeu déjà acheté';
	END IF;
END
$$

DELIMITER $$
CREATE FUNCTION calculPrixPromo(titreP VARCHAR(80), prixT INT)
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE pourcentage2 INT;

	SELECT SUM(Promotion.pourcentage) INTO pourcentage2
	FROM Promotion
	WHERE titreProduit = titreP AND CURRENT_TIMESTAMP()	BETWEEN Promotion.dateDebut AND Promotion.dateFin;
    IF (pourcentage2 IS NULL) THEN
		RETURN prixT;
	END IF;
    RETURN prixT - (prixT * (pourcentage2 / 100));
END
$$
#Promotion actue
DELIMITER $$
CREATE VIEW bundlePrix(titre, prixBundle, ageLegal) AS
SELECT titreBundle, SUM(prix), MAX(Contenu.ageLegal)
FROM BundleComprend
INNER JOIN Produit
	ON Produit.titre = titreProduit
INNER JOIN Bundle
	ON Bundle.titre = titreBundle
INNER JOIN Contenu
    ON Contenu.titre = Produit.titre
LEFT JOIN Promotion
	ON Promotion.titreProduit = BundleComprend.titreBundle
GROUP BY titreBundle;
$$

DELIMITER $$
CREATE VIEW vueProduit(titre, prixInitial, age, prixFinal, promotion) AS

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
                WHERE Promotion.titreProduit = Produit.titre AND
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
        GROUP BY Produit.titre
$$

#CREATE VIEW promotionActu AS

#DROP FUNCTION IF EXISTS calculPrixPromo;
#DROP TRIGGER IF EXISTS bundle_luiMeme;
#DROP TRIGGER IF EXISTS achat_age;
#DROP TRIGGER IF EXISTS note_Produit;
#DROP TRIGGER IF EXISTS promotion_Pourcentage;
#DROP TRIGGER IF EXISTS double_Achat_Produit;