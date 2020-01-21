-- MySQL Script generated by MySQL Workbench
-- Tue Jan 21 11:10:47 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

DROP SCHEMA IF EXISTS stome;
-- -----------------------------------------------------
-- Schema stome
-- -----------------------------------------------------
CREATE SCHEMA stome DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema Labo2
-- -----------------------------------------------------
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
  idCompte INT,
  titreProduit VARCHAR(80) NOT NULL,
  date DATE NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Compte_idCompte
    FOREIGN KEY (idCompte)
    REFERENCES Compte (id)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT FK_Produit_titre
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table AchatAmi
-- -----------------------------------------------------
CREATE TABLE AchatAmi (
  id INT,
  idAmi INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_Achat_idAchat_Ami
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
  id INT,
  PRIMARY KEY (id),
  CONSTRAINT FK_Achat_idAchat_Personnel
    FOREIGN KEY (id)
    REFERENCES Achat (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Bundle
-- -----------------------------------------------------
CREATE TABLE Bundle (
  titre VARCHAR(80) NOT NULL,
  PRIMARY KEY (titre),
  CONSTRAINT FK_Produit_titre_Bundle
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
  CONSTRAINT FK_Produit_titre_Contenu
    FOREIGN KEY (titre)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Langue
-- -----------------------------------------------------
CREATE TABLE Langue (
  nom VARCHAR(45),
  PRIMARY KEY (nom))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Genre
-- -----------------------------------------------------
CREATE TABLE Genre (
  nom VARCHAR(45),
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
  CONSTRAINT FK_Produit_titre_Promotion
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Entreprise
-- -----------------------------------------------------
CREATE TABLE Entreprise (
  nom VARCHAR(80),
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
  CONSTRAINT FK_Contenu_titre_Jeu
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
  CONSTRAINT FK_Contenu_titre_DLC
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
  titreBundle VARCHAR(80),
  titreProduit VARCHAR(80) NOT NULL,
  PRIMARY KEY (titreBundle, titreProduit),
  CONSTRAINT FK_Bundle_titre_BundleComprend
    FOREIGN KEY (titreBundle)
    REFERENCES Bundle (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Produit_titre_BundleComprend
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table EstTraduit
-- -----------------------------------------------------
CREATE TABLE EstTraduit (
  titreContenu VARCHAR(80),
  nomLangue VARCHAR(45) NOT NULL,
  PRIMARY KEY (titreContenu, nomLangue),
  CONSTRAINT FK_Contenu_titre
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
  titreContenu VARCHAR(80),
  nomGenre VARCHAR(45) NOT NULL,
  PRIMARY KEY (titreContenu, nomGenre),
  CONSTRAINT FK_Contenu_titre_Genre
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
  titreProduit VARCHAR(80),
  idCompte INT NOT NULL,
  note DOUBLE UNSIGNED NOT NULL,
  PRIMARY KEY (titreProduit, idCompte),
  CONSTRAINT FK_Produit_titre_EstNote
    FOREIGN KEY (titreProduit)
    REFERENCES Produit (titre)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT FK_Compte_idCompte_EstNote
    FOREIGN KEY (idCompte)
    REFERENCES Compte (id)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table EstAmi
-- -----------------------------------------------------
CREATE TABLE EstAmi (
  idCompte INT,
  idAmi INT NOT NULL,
  PRIMARY KEY (idCompte, idAmi),
  CONSTRAINT FK_Compte_idCompte_EstAmi
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

DELIMITER $$
CREATE TRIGGER promotion_Pourcentage
    BEFORE INSERT
    ON Promotion
    FOR EACH ROW
BEGIN
    DECLARE pourcentageTotale TINYINT;

    SELECT SUM(Promotion.pourcentage) INTO pourcentageTotale
              FROM Promotion
    WHERE CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin;

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
CREATE TRIGGER double_Achat_Produit
    BEFORE INSERT
    ON Achat
    FOR EACH ROW
BEGIN
    DECLARE idAchat TINYINT;
    DECLARE idAchatPerso TINYINT;

    SELECT id INTO idAchat
    FROM Achat
    WHERE new.titreProduit = titreProduit AND new.idCompte = idCompte;

    SELECT id INTO idAchatPerso
    FROM Achat
    WHERE idAchat = id;

    IF (idAchat IS NOT NULL AND idAchatPerso IS NOT NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Jeu déjà acheté';
    END IF;
END
$$

DELIMITER $$
CREATE TRIGGER offre_LuiMeme
    BEFORE INSERT
    ON AchatAmi
    FOR EACH ROW
BEGIN
    IF (NEW.idAmi IN (SELECT idCompte FROM Achat WHERE NEW.id = id)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Impossible de s\'offrir un jeu à soi-même';
    END IF;
END
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

DELIMITER $$
CREATE FUNCTION calculPrixInitialBundlesBundle(titreB VARCHAR(80))
    RETURNS INT
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE prixInitialTotalBundle INT;

    SELECT SUM(CASE WHEN BundleComprend.titreProduit IN (SELECT Bundle.titre FROM Bundle) THEN
                        calculPrixPromo(BundleComprend.titreProduit, calculPrixInitialContenusBundle(BundleComprend.titreProduit)) ELSE 0 END) INTO prixInitialTotalBundle
    FROM BundleComprend
             INNER JOIN Produit
                        ON Produit.titre = titreProduit
    GROUP BY BundleComprend.titreBundle
    HAVING titreBundle = titreB;
    RETURN prixInitialTotalBundle;
END
$$

DELIMITER $$
CREATE FUNCTION calculPrixInitialBundle(titreB VARCHAR(80))
    RETURNS INT
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE prixInitialTotalContenu INT;

    WITH RECURSIVE cte_COB(titre) AS (
        SELECT DISTINCT vPC.titreProduit FROM stome.BundleComprend AS vPC
        WHERE vPC.titreBundle = titreB
        UNION ALL
        SELECT BC.titreProduit
        FROM cte_COB JOIN stome.BundleComprend as BC
                          ON cte_COB.titre = BC.titreBundle
    ) SELECT SUM(vueContenu.prixInitial) INTO prixInitialTotalContenu FROM cte_COB
                                                                               INNER JOIN stome.vueContenu
                                                                                          ON vueContenu.titre = cte_COB.titre;

    RETURN prixInitialTotalContenu;
END
$$

DELIMITER $$
CREATE FUNCTION calculPrixReelBundle(titreB VARCHAR(80))
    RETURNS INT
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE prixFinalTotalBundle INT;

    WITH RECURSIVE cte_COB(titre) AS (
        SELECT DISTINCT vPC.titreProduit FROM stome.BundleComprend AS vPC
        WHERE vPC.titreBundle = titreB
        UNION ALL
        SELECT BC.titreProduit
        FROM cte_COB JOIN stome.BundleComprend as BC
                          ON cte_COB.titre = BC.titreBundle
    ) SELECT SUM(vueContenu.prixFinal) INTO  prixFinalTotalBundle FROM cte_COB
                                                                           INNER JOIN stome.vueContenu
                                                                                      ON vueContenu.titre = cte_COB.titre;
    RETURN prixFinalTotalBundle;
END
$$

DELIMITER $$
CREATE VIEW vueBundle(titre, prixInitial, prixReel, age) AS
SELECT titreBundle, calculPrixInitialBundle(titreBundle) AS prixInitial,
       calculPrixReelBundle(titreBundle) AS prixReel,
       MAX(Contenu.ageLegal) AS age
FROM BundleComprend
         INNER JOIN Produit
                    ON Produit.titre = titreProduit
         INNER JOIN Contenu
                    ON Contenu.titre = Produit.titre
GROUP BY BundleComprend.titreBundle;
$$

DELIMITER $$
CREATE VIEW vueDLC(titre, developpeur, editeur, franchise) AS
SELECT DLC.titre, Jeu.Editeur, Jeu.Developpeur, Jeu.Franchise
FROM DLC
         INNER JOIN Jeu ON Jeu.titre = DLC.titreJeu;
$$

DELIMITER $$
CREATE VIEW vueContenu(titre, prixInitial, age, prixFinal, promotion, franchise, developpeur, editeur, description) AS
SELECT Contenu.titre, Contenu.prix AS prixInital, Contenu.ageLegal AS age, calculPrixPromo(Contenu.titre, Contenu.prix) AS prixFinal, COALESCE((SELECT SUM(Promotion.pourcentage)
                                                                                                                                                            FROM Promotion
                                                                                                                                                            WHERE Promotion.titreProduit = Contenu.titre AND
                                                                                                                                                            CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin), 0) AS promotion,
       Jeu.franchise AS franchise,
       Jeu.developpeur AS developpeur,
       Jeu.editeur AS editeur,
       Contenu.Description
FROM Contenu
         LEFT JOIN Promotion
                   ON Promotion.titreProduit = Contenu.titre
         INNER JOIN Jeu
                    ON Jeu.titre = Contenu.titre
GROUP BY Contenu.titre
UNION
SELECT Contenu.titre, Contenu.prix AS prixInital, Contenu.ageLegal AS age, calculPrixPromo(Contenu.titre, Contenu.prix) AS prixFinal, COALESCE((SELECT SUM(Promotion.pourcentage)
                                                                                                                                                            FROM Promotion
                                                                                                                                                            WHERE Promotion.titreProduit = Contenu.titre AND
                                                                                                                                                            CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin), 0) AS promotion,
       vueDLC.franchise AS franchise,
       vueDLC.developpeur AS developpeur,
       vueDLC.editeur AS editeur,
       Contenu.Description
FROM Contenu
         LEFT JOIN Promotion
                   ON Promotion.titreProduit = Contenu.titre
         INNER JOIN vueDLC
                    ON vueDLC.titre = Contenu.titre
GROUP BY Contenu.titre;
$$

DELIMITER $$
CREATE VIEW vueProduit(titre, prixInitial, age, prixFinal, promotion) AS

SELECT DISTINCT Produit.titre, vueBundle.prixInitial AS prixInitial, vueBundle.age AS age, calculPrixPromo(Produit.titre, vueBundle.prixReel) AS prixFinal,
                COALESCE((SELECT SUM(Promotion.pourcentage)
                          FROM Promotion
                          WHERE Promotion.titreProduit = Produit.titre AND
                              CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin), 0) AS pourcentagePromo
FROM Produit
         INNER JOIN vueBundle
                    ON Produit.titre = vueBundle.titre
         LEFT JOIN Promotion
                   ON Promotion.titreProduit = Produit.titre
UNION
SELECT DISTINCT Produit.titre, vueContenu.prixInitial AS prixInitial, vueContenu.age AS age, vueContenu.prixFinal AS prixFinal,
                COALESCE((SELECT SUM(Promotion.pourcentage)
                          FROM Promotion
                          WHERE Promotion.titreProduit = Produit.titre AND
                              CURRENT_TIMESTAMP() BETWEEN Promotion.dateDebut AND Promotion.dateFin), 0) AS pourcentagePromo
FROM Produit
         INNER JOIN vueContenu
                    ON Produit.titre = vueContenu.titre
         LEFT JOIN Promotion
                   ON Promotion.titreProduit = Produit.titre;
$$

DELIMITER $$
CREATE VIEW vueAchats(id, titre, prixInitial, prixFinal, promotion, date, idAmi) AS
SELECT Achat.idCompte, vueProduit.titre, vueProduit.prixInitial, vueProduit.prixFinal, vueProduit.promotion, Achat.date, AchatAmi.idAmi
FROM Achat
         INNER JOIN AchatAmi
                    ON Achat.id = AchatAmi.id
         INNER JOIN vueProduit
                    ON vueProduit.titre = Achat.titreProduit
UNION
SELECT Achat.idCompte, vueProduit.titre, vueProduit.prixInitial, vueProduit.prixFinal, vueProduit.promotion, Achat.date, null
FROM Achat
         INNER JOIN AchatPersonnel
                    ON Achat.id = AchatPersonnel.id
         INNER JOIN vueProduit
                    ON vueProduit.titre = Achat.titreProduit;
$$

DELIMITER $$
CREATE VIEW vueProduitsComptes(titreProduit, idProprietaire, dateAcquisition) AS
SELECT Achat.titreProduit,
       CASE
           WHEN Achat.id = AA.id THEN AA.idAmi
           ELSE Achat.idCompte
           END,
       Achat.date
FROM stome.Achat
         LEFT JOIN AchatAmi AA on Achat.id = AA.id
$$

DELIMITER $$
CREATE TRIGGER verifAchat
    BEFORE INSERT
    ON Achat
    FOR EACH ROW
BEGIN
    DECLARE ageCompte TINYINT;
    DECLARE ageProduit TINYINT;
    DECLARE porteMonnaieUser INT;

    SELECT porteMonnaie INTO porteMonnaieUser
    FROM Compte
    WHERE id = NEW.idCompte;

    IF (porteMonnaieUser - (SELECT prixFinal FROM vueProduit WHERE NEW.titreProduit = vueProduit.titre) < 0) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Porte Monnaie < 0';
    ELSE
        UPDATE Compte
        SET Compte.porteMonnaie = Compte.PorteMonnaie - (SELECT prixFinal FROM vueProduit WHERE NEW.titreProduit = vueProduit.titre)
        WHERE NEW.idCompte = id;
    END IF;
END
$$

DELIMITER $$
CREATE TRIGGER verifAchatAmi
    BEFORE INSERT
    ON AchatAmi
    FOR EACH ROW
BEGIN
    DECLARE ageCompte TINYINT;
    DECLARE ageProduit TINYINT;

    /*Permet de trouver l'âge du compte de l'ami entré*/
    SELECT DISTINCT TIMESTAMPDIFF(YEAR ,Compte.dateNaissance, CURRENT_DATE()) INTO ageCompte
    FROM Compte
             INNER JOIN EstAmi
                        ON EstAmi.idAmi = NEW.idAmi
    WHERE Compte.id = NEW.idAmi;

    /*Si l'âge est nul cela veut dire qu'aucun ami n'a été trouvé donc le compte entré ne fait pas parti des amis*/
    IF(ageCompte IS NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pas ami';
    END IF;

    /*Trouve l'âge du produit grâce à la vue sur les Produits*/
    SELECT vueProduit.age INTO ageProduit
    FROM vueProduit
             INNER JOIN Achat
                        ON vueProduit.titre = Achat.titreProduit
    WHERE Achat.id = NEW.id;

    /*Vérification que l'âge du compte Ami est inférieur à l'age du produit acheté*/
    IF (ageCompte < ageProduit) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Compte trop jeune';
    END IF;
END
$$

DELIMITER $$
CREATE TRIGGER doubleAchatProduitAmi
    BEFORE INSERT
    ON AchatAmi
    FOR EACH ROW
BEGIN
    DECLARE idAchat TINYINT;
    DECLARE idAchatPerso TINYINT;
    DECLARE titreProduitAchat VARCHAR(80);

    SELECT titreProduit INTO titreProduitAchat
    FROM Achat
    WHERE Achat.id = NEW.id;

    SELECT id INTO idAchat
    FROM Achat
    WHERE titreProduitAchat = titreProduit AND new.idAmi = idCompte;

    IF (idAchat IS NOT NULL AND idAchatPerso IS NOT NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Déjà acheté';
    END IF;
END
$$


DELIMITER $$
CREATE TRIGGER verifAchatPerso
    BEFORE INSERT
    ON AchatPersonnel
    FOR EACH ROW
BEGIN
    DECLARE ageCompte TINYINT;
    DECLARE ageProduit TINYINT;

    #Permet de calculer trouver l'âge du compte qui achète le jeu
    SELECT TIMESTAMPDIFF(YEAR ,Compte.dateNaissance, CURRENT_DATE()) INTO ageCompte
    FROM Compte
             INNER JOIN Achat
                        ON Achat.idCompte = Compte.id
    WHERE Achat.id = NEW.id;

    SELECT vueProduit.age INTO ageProduit
    FROM vueProduit
             INNER JOIN Achat
                        ON vueProduit.titre = Achat.titreProduit
    WHERE Achat.id = NEW.id;

    IF (ageCompte < ageProduit) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Compte trop jeune';
    END IF;
END
$$

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

INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands", 16, 60, "Borderlands est un jeu de tir à la première personne mâtiné de jeu de rôle (expérience, spécialisations) qui vous entraîne sur une planète mystérieuse, aux allures de Far West futuriste. Il offre au joueur la possibilité de piloter des véhicules et de manipuler une grande variété d''armes afin de remplir de très nombreuses quêtes. Jouable en solo, Borderlands permet également à quatre participants de compléter l''aventure ensemble, en coopération.");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands 2", 16, 80,"Borderlands 2 est un mélange de jeu de tir à la première personne et de jeu de rôle. Le joueur doit s''aventurer dans les mondes inexplorés de Pandora et percer les secrets de l''univers de Borderlands.");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Borderlands 3", 18, 90, "Borderlands 3 est un RPG en vue FPS. Contrairement aux épisodes précédents, les joueurs vont pouvoir visiter Prométhée. Cette planète est la zone où Atlas a découvert la première Arche, une des éléments importants de la série.");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Monster Hunter World", 16, 70, "La dernière entrée de la série Monster Hunter. Plus complet que jamais, le jeu transporte le joueur au travers de batailles contre de terribles monstres et de magnifiques paysages. Récupérerez des objets sur vos ennemis, créez de nouveaux équipements et armures, explorez tous les territoires disponibles. Saurez vous devenir le chasseur ultime ?");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Monster Hunter Iceborne", 16, 50,"Monster Hunter World : Iceborne est la première extension pour le RPG de Capcom Monster Hunter World. Annoncée pour l''automne 2019, elle s’annonce massive avec une toute nouvelle histoire se déroulant après les événements du jeu, des nouveaux rangs de chasse et des nouveaux monstres comme le Nargacuga.");
INSERT INTO Contenu(titre, agelegal, prix, description) VALUES ("Deep Rock Galactic", 14, 25,"Deep Rock Galactic est un jeu d''action en coopération situé dans un univers de science-fiction. Vous incarnez une troupe de nains de l''espace qui n''a pas du tout envie de se laisser faire. Terrassez-vos ennemis dans des niveaux générés procéduralement et ce, de la meilleure des manières : en détruisant tout sur votre passage.");

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
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Child Test", "Borderlands");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Child Test", "Borderlands 2");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Root Test", "Bundle Child Test");
INSERT INTO BundleComprend(titreBundle, titreProduit) VALUES ("Bundle Root Test", "Borderlands 3");

INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Teixeira Carvalho", "Stephane", "test@gmail.com", 100, '2010-04-02');
INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Egremy", "Bruno", "test2@gmail.com", 100, '1999-04-02');
INSERT INTO Compte(nom, prenom, email, porteMonnaie, dateNaissance) VALUES ("Becaud", "Arthur", "test3@gmail.com", 400, '1999-04-03');

INSERT INTO EstNote(titreProduit, idCompte, note) VALUES ("Monster Hunter World", 2, 4.5);
INSERT INTO EstNote(titreProduit, idCompte, note) VALUES ("Monster Hunter Iceborne", 2, 4.7);
INSERT INTO EstNote(titreProduit, idCompte, note) VALUES ("Bundle Borderlands", 3, 4.6);

INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 50, '2010-05-06', '2010-06-06');
INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 10, '2010-05-06', '2010-06-06');
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
INSERT INTO Jeu(titre, developpeur, editeur, franchise) VALUES ("Borderlands 3", "Gearbox Software", "2K", "Borderlands");
INSERT INTO Jeu(titre, developpeur, editeur, franchise) VALUES ("Deep Rock Galactic", "Ghost Ship Games", "Coffee Stain Publishing", "Deep Rock Galactic");

INSERT INTO DLC(titre, titreJeu) VALUES ("Monster Hunter Iceborne", "Monster Hunter World");

INSERT INTO Langue(nom) VALUES ("Français");
INSERT INTO Langue(nom) VALUES ("Anglais");
INSERT INTO Langue(nom) VALUES ("Allemand");
INSERT INTO Langue(nom) VALUES ("Italien");

INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands", "Anglais");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands", "Français");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands", "Allemand");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands 2", "Anglais");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands 2", "Français");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands 2", "Allemand");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands 3", "Anglais");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands 3", "Français");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands 3", "Allemand");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Borderlands 3", "Italien");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Monster Hunter World", "Anglais");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Monster Hunter World", "Français");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Monster Hunter World", "Italien");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Monster Hunter Iceborne", "Anglais");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Monster Hunter Iceborne", "Français");
INSERT INTO EstTraduit(titreContenu, nomLangue) VALUES ("Monster Hunter Iceborne", "Italien");

INSERT INTO Genre(nom) VALUES ("Action");
INSERT INTO Genre(nom) VALUES ("RPG");
INSERT INTO Genre(nom) VALUES ("FPS");
INSERT INTO Genre(nom) VALUES ("Horreur");
INSERT INTO Genre(nom) VALUES ("Coopération");
INSERT INTO Genre(nom) VALUES ("Multijoueur");

INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Borderlands", "Action");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Borderlands", "RPG");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Borderlands 2", "Action");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Borderlands 2", "RPG");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Borderlands 3", "Action");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Borderlands 3", "RPG");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter World", "Action");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter World", "RPG");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter World", "Coopération");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter World", "Multijoueur");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter Iceborne", "Action");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter Iceborne", "RPG");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter Iceborne", "Coopération");
INSERT INTO PossedeGenre(titreContenu, nomGenre) VALUES ("Monster Hunter Iceborne", "Multijoueur");

INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 50, '2010-05-06', '2010-06-06');
INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Monster Hunter Iceborne", 10, '2010-05-06', '2010-06-06');
INSERT INTO Promotion(titreProduit, pourcentage, dateDebut, dateFin) VALUES ("Bundle Monster Hunter World", 60, '2010-05-06', '2010-06-06');

INSERT INTO Achat(idCompte, titreProduit, date) VALUES (2, "Borderlands", '2010-04-03');

INSERT INTO EstAmi (idCompte, idAmi) VALUES (1,2);
INSERT INTO EstAmi (idCompte, idAmi) VALUES (1,3);
INSERT INTO EstAmi (idCompte, idAmi) VALUES (2,3);
INSERT INTO EstAmi (idCompte, idAmi) VALUES (3,2);


#DROP VIEW IF EXISTS vueAchats;
#DROP FUNCTION IF EXISTS calculPrixPromo;
#DROP TRIGGER IF EXISTS bundle_luiMeme;
#DROP TRIGGER IF EXISTS achat_age;
#DROP TRIGGER IF EXISTS note_Produit;
#DROP TRIGGER IF EXISTS promotion_Pourcentage;
#DROP TRIGGER IF EXISTS double_Achat_Produit;