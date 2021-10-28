/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  28/10/2021 23:05:02                      */
/*==============================================================*/


DROP TABLE IF EXISTS CANDIDATS;

DROP TABLE IF EXISTS JURE;

DROP TABLE IF EXISTS VOTANT;

/*==============================================================*/
/* Table : CANDIDATS                                            */
/*==============================================================*/
CREATE TABLE CANDIDATS
(
   IDCANDIDAT           INT NOT NULL AUTO_INCREMENT,
   NOM                  VARCHAR(100) NOT NULL,
   PRENOM               VARCHAR(100) NOT NULL,
   SEXE                 CHAR(1) NOT NULL,
   PHOTO                VARCHAR(255) NOT NULL,
   PRIMARY KEY (IDCANDIDAT)
);

/*==============================================================*/
/* Table : JURE                                                 */
/*==============================================================*/
CREATE TABLE JURE
(
   IDJURE               INT NOT NULL AUTO_INCREMENT,
   NOM                  VARCHAR(100) NOT NULL,
   PRENOM               VARCHAR(100) NOT NULL,
   GRADE                INT NOT NULL,
   PRIMARY KEY (IDJURE)
);

/*==============================================================*/
/* Table : VOTANT                                               */
/*==============================================================*/
CREATE TABLE VOTANT
(
   IDVOTANT             INT NOT NULL AUTO_INCREMENT,
   IDJURE               INT NOT NULL,
   IDCANDIDAT           INT NOT NULL,
   NOM                  VARCHAR(100) NOT NULL,
   PRENOM               VARCHAR(100) NOT NULL,
   EMAIL                VARCHAR(100) NOT NULL,
   SEXE                 CHAR(1) NOT NULL,
   DATE                 DATETIME NOT NULL,
   PRIMARY KEY (IDVOTANT)
);

ALTER TABLE VOTANT ADD CONSTRAINT FK_BANIR FOREIGN KEY (IDJURE)
      REFERENCES JURE (IDJURE) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE VOTANT ADD CONSTRAINT FK_VOTE FOREIGN KEY (IDCANDIDAT)
      REFERENCES CANDIDATS (IDCANDIDAT) ON DELETE RESTRICT ON UPDATE RESTRICT;

