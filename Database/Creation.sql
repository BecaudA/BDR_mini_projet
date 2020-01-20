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
INSERT INTO Produit(titre) VALUES ("Deep Rock Galactic");
# DEBUG
INSERT INTO Produit(titre) VALUES ("Bundle Root Test");
INSERT INTO Produit(titre) VALUES ("Bundle Child Test");

INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands", 16, 60, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands 2", 16, 80, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands 3", 18, 90, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Monster Hunter World", 16, 70, "Will see");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Monster Hunter Iceborne", 16, 50, "DLC of Monster Hunter");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Deep Rock Galactic", 14, 25, "Dwarves mining in outer space ... and beers ! Rock N Stone !");

INSERT INTO Bundle(titre) VALUES ("Bundle Borderlands");
INSERT INTO Bundle(titre) VALUES ("Bundle Monster Hunter World");
# DEBUG
INSERT INTO Bundle(titre) VALUES ("Bundle Root Test");
INSERT INTO Bundle(titre) VALUES ("Bundle Child Test");


INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Borderlands", "Borderlands");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Borderlands", "Borderlands 2");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Borderlands", "Borderlands 3");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Monster Hunter World", "Monster Hunter World");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Monster Hunter World", "Monster Hunter Iceborne");

# DEBUG
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Root Test", "Bundle Child Test");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Root Test", "Borderlands 3");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Child Test", "Borderlands");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Child Test", "Borderlands 2");

INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Teixeira Carvalho", "Stephane", "test@gmail.com", 100, '2010-04-02');
INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Egremy", "Bruno", "test2@gmail.com", 100, '1999-04-02');
INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Becaud", "Arthur", "test3@gmail.com", 100, '1999-04-03');

INSERT INTO Achat(idCompte, titreProduit, date) VALUES (2, "Borderlands", '2010-04-03');
INSERT INTO Achat(idCompte, titreProduit, date) VALUES (2, "Borderlands", '2010-04-04');

# DEBUG
INSERT INTO Achat(idCompte, titreProduit, date) VALUES (2, "Bundle Root Test", '2010-04-04');
INSERT INTO Achat(idCompte, titreProduit, date) VALUES (2, "Bundle Monster Hunter World", '2010-04-04');


INSERT INTO EstNote(titreProduit, idCompte, note) VALUES ("Monster Hunter Iceborne", 1, 6);

INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 50, '2010-05-06', '2010-06-06');
INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 60, '2010-05-06', '2010-06-06');
INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Bundle Monster Hunter World", 60, '2010-05-06', '2010-06-06');

INSERT INTO Entreprise(nom) VALUES ("Capcom");
INSERT INTO Entreprise(nom) VALUES ("2K");
INSERT INTO Entreprise(nom) VALUES ("Gearbox Software");
INSERT INTO Entreprise(nom) VALUES ("Coffee Stain Publishing");
INSERT INTO Entreprise(nom) VALUES ("Ghost Ship Games");

INSERT INTO Franchise(titre, nomEntreprise) VALUES ("Monster Hunter", "Capcom");
INSERT INTO Franchise(titre, nomEntreprise) VALUES ("Borderlands", "2K");
INSERT INTO Franchise(titre, nomEntreprise) VALUES ("Deep Rock Galactic", "Ghost Ship Games");

INSERT INTO Jeu(titre, developpeur, editeur, franchise) VALUES ("Monster Hunter World", "Capcom","Capcom", "Monster Hunter");
INSERT INTO Jeu(titre, developpeur, editeur, franchise) VALUES ("Borderlands", "Gearbox Software", "2K", "Borderlands");
INSERT INTO Jeu(titre, developpeur, editeur, franchise) VALUES ("Borderlands 2", "Gearbox Software", "2K", "Borderlands");
INSERT INTO Jeu(titre, developpeur, editeur, franchise) VALUES ("Deep Rock Galactic", "Ghost Ship Games", "Coffee Stain Publishing", "Deep Rock Galactic");

INSERT INTO DLC(titre, titreJeu) VALUES ("Monster Hunter Iceborne", "Monster Hunter World");

INSERT INTO Langue(nom) VALUES ("Français");
INSERT INTO Langue(nom) VALUES ("Anglais");
INSERT INTO Langue(nom) VALUES ("Allemand");
INSERT INTO Langue(nom) VALUES ("Italien");

INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands", "Anglais");

INSERT INTO Genre(nom) VALUES ("Action");
INSERT INTO Genre(nom) VALUES ("RPG");
INSERT INTO Genre(nom) VALUES ("FPS");
INSERT INTO Genre(nom) VALUES ("Horreur");

INSERT INTO Possedegenre(titreContenu, nomGenre) VALUES ("Borderlands", "Action");
INSERT INTO Possedegenre(titreContenu, nomGenre) VALUES ("Borderlands", "RPG");

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
CREATE VIEW vueBundle(titre, prixInitial, prixReel, age) AS
SELECT titreBundle, SUM(Contenu.prix) AS prixInitial, SUM(calculPrixPromo(Contenu.titre,Contenu.prix)) AS prixReel, MAX(Contenu.ageLegal) AS age
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
       CASE WHEN Produit.titre = vueBundle.titre
                THEN vueBundle.prixInitial
            ELSE Contenu.prix
           END AS prixInitial,

       CASE WHEN Produit.titre = vueBundle.titre
                THEN vueBundle.age
            ELSE Contenu.ageLegal
           END AS age,

       CASE WHEN Produit.titre = vueBundle.titre
                THEN vueBundle.prixReel
            ELSE calculPrixPromo(Produit.titre, Contenu.prix) END AS prixReel,
       COALESCE((SELECT SUM(Promotion.pourcentage)
                 FROM Promotion
                 WHERE Promotion.titreProduit = Produit.titre AND
                     CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin), 0) AS pourcentagePromo
FROM Produit
         LEFT JOIN vueBundle
                   ON Produit.titre = vueBundle.titre
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

DELIMITER $$
CREATE VIEW vueDLC(titre, developpeur, editeur, franchise) AS
SELECT DLC.titre, Jeu.Editeur, Jeu.Developpeur, Jeu.Franchise
FROM DLC
         INNER JOIN Jeu ON Jeu.titre = DLC.titreJeu;
$$

DELIMITER $$
CREATE VIEW vueContenu(titre, prixInitial, age, prixFinal, promotion, franchise, developpeur, editeur, description) AS
SELECT vueProduit.titre, vueProduit.prixInitial, vueProduit.age, vueProduit.prixFinal, vueProduit.promotion,
       CASE WHEN Contenu.titre = Jeu.titre THEN Jeu.franchise ELSE vueDLC.franchise END AS franchise,
       CASE WHEN Contenu.titre = Jeu.titre THEN Jeu.developpeur ELSE vueDLC.developpeur END AS developpeur,
       CASE WHEN Contenu.titre = Jeu.titre THEN Jeu.editeur ELSE vueDLC.editeur END AS editeur,
       Contenu.Description
FROM vueProduit
         LEFT JOIN Contenu
                   ON Contenu.titre = vueProduit.titre
         LEFT JOIN Promotion
                   ON Promotion.titreProduit = vueProduit.titre
         LEFT JOIN Jeu
                   ON Jeu.titre = Contenu.titre
         LEFT JOIN vueDLC
                   ON vueDLC.titre = Contenu.titre
WHERE vueProduit.titre = Contenu.titre
GROUP BY vueProduit.titre;
$$

/*Trigger pour l'héritage Produit->Bundle,Contenu*/
DELIMITER $$
/*  Trigger sur bundle pour contrôler l'insertion  */
CREATE TRIGGER TRG_BundleProduit
    BEFORE INSERT
    ON Bundle
    FOR EACH ROW
BEGIN
    DECLARE erreur TINYINT;

    SET @erreur = 0;

/*  La clef de "Produit" doit exister pour la création de "Bundle"  */
    IF NEW.titre NOT IN (SELECT *
                         FROM  Produit P1
                         WHERE P1.titre = NEW.titre)
    THEN
        SET @erreur = 1;
    END IF;

    /* l'identifiant de bundle ne doit pas être utilisé par les autres tables filles */
    IF NEW.titre IN (SELECT Contenu.titre
                     FROM Contenu
                     WHERE NEW.titre = Contenu.titre)
    THEN
        SET @erreur = 1;
    END IF;

    IF @erreur = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insertion de Bundle Impossible';
    END IF;

END
$$

DELIMITER $$
/*  Trigger sur Contenu pour contrôler l'insertion  */
CREATE TRIGGER TRG_ContenuProduit
    BEFORE INSERT
    ON Contenu
    FOR EACH ROW
BEGIN
    DECLARE erreur TINYINT;

    SET @erreur = 0;

/*  La clef de "Produit" doit exister pour la création d'un "Contenu"  */
    IF NEW.titre NOT IN (SELECT *
                         FROM  Produit P1
                         WHERE P1.titre = NEW.titre)
    THEN
        SET @erreur = 1;
    END IF;

    /* l'identifiant du contenu ne doit pas être utilisé par les autres tables filles */
    IF NEW.titre IN (SELECT Bundle.titre
                     FROM Bundle
                     WHERE NEW.titre = Bundle.titre)
    THEN
        SET @erreur = 1;
    END IF;

    IF @erreur = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insertion de Contenu Impossible';
    END IF;

END
$$

/*Triger d'héritage Contenu -> Jeu,DLC*/
DELIMITER $$
/*  Trigger sur jeu pour contrôler l'insertion  */
CREATE TRIGGER TRG_JeuContenu
    BEFORE INSERT
    ON Jeu
    FOR EACH ROW
BEGIN
    DECLARE erreur TINYINT;

    SET @erreur = 0;

/*  La clef de "Contenu" doit exister pour la création de "jeu"  */
    IF NEW.titre NOT IN (SELECT C1.titre
                         FROM  Contenu C1
                         WHERE C1.titre = NEW.titre)
    THEN
        SET @erreur = 1;
    END IF;

    /* l'identifiant de jeu ne doit pas être utilisé par les autres tables filles */
    IF NEW.titre IN (SELECT DLC.titre
                     FROM DLC
                     WHERE DLC.titre = NEW.titre)
    THEN
        SET @erreur = 1;
    END IF;

    IF @erreur = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insertion de Jeu Impossible';
    END IF;

END
$$

DELIMITER $$
/*  Trigger sur DLC pour contrôler l'insertion  */
CREATE TRIGGER TRG_DLCContenu
    BEFORE INSERT
    ON DLC
    FOR EACH ROW
BEGIN
    DECLARE erreur TINYINT;

    SET @erreur = 0;

/*  La clef de "Contenu" doit exister pour la création de "DLC"  */
    IF NEW.titre NOT IN (SELECT C1.titre
                         FROM  Contenu C1
                         WHERE C1.titre = NEW.titre)
    THEN
        SET @erreur = 1;
    END IF;

    /* l'identifiant de DLC ne doit pas être utilisé par les autres tables filles */
    IF NEW.titre IN (SELECT Jeu.titre
                     FROM Jeu
                     WHERE Jeu.titre = NEW.titre)
    THEN
        SET @erreur = 1;
    END IF;

    IF @erreur = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insertion de DLC Impossible';
    END IF;

END
$$
/*Trigger pour l'héritage achat->achatPersonnel,AchatAmi*/
DELIMITER $$
/*  Trigger sur Achatpersonnel pour contrôler l'insertion  */
CREATE TRIGGER TRG_AchatPerso
    BEFORE INSERT
    ON AchatPersonnel
    FOR EACH ROW
BEGIN
    DECLARE erreur TINYINT;

    SET @erreur = 0;

/*  La clef de Achat doit exister pour la création de AchatPersonnel  */
    IF NEW.id NOT IN (SELECT A1.id
                      FROM  Achat A1
                      WHERE A1.id = NEW.id)
    THEN
        SET @erreur = 1;
    END IF;

    /* l'identifiant de AchatPersonnel ne doit pas être utilisé par les autres tables filles */
    IF NEW.id IN (SELECT AchatAmi.id
                  FROM AchatAmi
                  WHERE AchatAmi.id = NEW.id)
    THEN
        SET @erreur = 1;
    END IF;

    IF @erreur = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insertion de l\'achat personnel impossible';
    END IF;

END
$$

DELIMITER $$
/*  Trigger sur AchatAmi pour contrôler l'insertion  */
CREATE TRIGGER TRG_AchatAmi
    BEFORE INSERT
    ON AchatAmi
    FOR EACH ROW
BEGIN
    DECLARE erreur TINYINT;

    SET @erreur = 0;

/*  La clef de Achat doit exister pour la création de AchatAmi  */
    IF NEW.id NOT IN (SELECT A1.id
                      FROM  Achat A1
                      WHERE A1.id = NEW.id)
    THEN
        SET @erreur = 1;
    END IF;

    /* l'identifiant de AchatAmi ne doit pas être utilisé par les autres tables filles */
    IF NEW.id IN (SELECT AchatPersonnel.id
                  FROM AchatPersonnel
                  WHERE AchatPersonnel.id = NEW.id)
    THEN
        SET @erreur = 1;
    END IF;

    IF @erreur = 1 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insertion de l\'achat ami impossible';
    END IF;

END
$$

DELIMITER $$
CREATE VIEW vueAchats(id, titre, prixInitial, prixFinal, promotion, date, idAmi) AS
SELECT Achat.idCompte, vueProduit.titre, vueProduit.prixInitial, vueProduit.prixFinal, vueProduit.promotion, Achat.date, AchatAmi.idAmi
FROM Achat
         LEFT JOIN AchatAmi
                   ON Achat.id = idAmi
         INNER JOIN vueProduit
                    ON vueProduit.titre = Achat.titreProduit;
$$

DELIMITER $$
CREATE VIEW vueProduitsComptes(titreProduit, idProprietaire) AS
    SELECT Achat.titreProduit,
    CASE
        WHEN Achat.id = AA.id THEN AA.idAmi
        ELSE Achat.idCompte
    END
    FROM stome.Achat
    LEFT JOIN AchatAmi AA on Achat.id = AA.id
$$

#CREATE VIEW promotionActu AS
#DROP VIEW IF EXISTS vueProduitsComptes;
#DROP FUNCTION IF EXISTS calculPrixPromo;
#DROP TRIGGER IF EXISTS bundle_luiMeme;
#DROP TRIGGER IF EXISTS achat_age;
#DROP TRIGGER IF EXISTS note_Produit;
#DROP TRIGGER IF EXISTS promotion_Pourcentage;
#DROP TRIGGER IF EXISTS double_Achat_Produit;