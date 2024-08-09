SET default_storage_engine = InnoDb;

create database if not exists formation character set utf8mb4 collate utf8mb4_unicode_ci;

use formation;

drop table if exists etudiant;
drop table if exists options;

create table options
(
    id           char(1) primary key,
    libelleCourt char(4)     not null,
    libelleLong  varchar(50) not null
);

insert into options(id, libelleCourt, libelleLong)
values ('A', 'SISR', 'solutions d''infrastructure, systèmes et réseaux'),
       ('B', 'SLAM', 'solutions logicielles et applications métiers');

create table etudiant
(
    id            int auto_increment primary key,
    nom           varchar(20) not null,
    prenom        varchar(20) NOT NULL,
    dateNaissance date        not null,
    idOption      char(1)     NOT NULL,
    fichier varchar(50)        null,
    unique (nom, prenom, dateNaissance),
    foreign key (idOption) references options (id)
);

create trigger avantAjoutEtudiant
    before insert
    on etudiant
    for each row
begin
    set new.nom = upper(new.nom);
    if exists(select 1 from etudiant where nom = new.nom and prenom = new.prenom and dateNaissance = new.dateNaissance) then
        SIGNAL sqlstate '45000' set message_text = '#Cet étudiant existe déjà';
    end if;
end;


create trigger avantModificationEtudiant
    before update
    on etudiant
    for each row
begin
    set new.nom = upper(new.nom);
    if exists(select 1 from etudiant where nom = new.nom and prenom = new.prenom  and dateNaissance = new.dateNaissance and  id != new.id) then
        SIGNAL sqlstate '45000' set message_text = '#Modification refusée : un homonyme existe';
    end if;
end;

INSERT INTO etudiant(id, nom, prenom, dateNaissance, idOption, fichier)
VALUES (1, 'BOULONGNE', 'Alexandre',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (2, 'COLLINA', 'Mathéo',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (3, 'CREUZOT', 'Jules',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (4, 'CUISINIER', 'Hugo',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (5, 'DAWAGNE', 'Jérémy',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (6, 'DELAPORTE', 'Pierre',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (7, 'DELAPORTE', 'Théo',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (8, 'DESSOUT', 'Jérémie',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (9, 'DUMOULIN', 'Florian',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (10, 'DURIEZ', 'Dimitri',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (11, 'FOURDAIN', 'Océane',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (12, 'HERBET', 'Kévin',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (13, 'HMIDI', 'Karim',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (14, 'HUSSIAUX', 'Valentin',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (15, 'KABA', 'Théo',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (16, 'KREMER', 'Anton',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (17, 'LASORNE', 'Lucas',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (18, 'LEGUAY', 'Théo',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (19, 'LEMAIRE', 'Gauthier',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (20, 'MAILLARD', 'Grégoire',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (21, 'MAILLET', 'Arnaud',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (22, 'MARTIN', 'Aurélien',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (23, 'MEZGHACHE', 'Yanis',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (24, 'NANCELLE', 'Alexis',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (25, 'NEVES', 'Dylan',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (26, 'OUTREBON', 'Pierre',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (27, 'POSSON', 'Corentin',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (28, 'PYRAM', 'Léonard',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'B', concat(lcase(nom), ' ', lcase(prenom), '.jpg')),
       (29, 'TRICOTET', 'Baptiste',
        CONCAT(YEAR(CURDATE()) - FLOOR(RAND() * 7) - 17, '-', FLOOR(RAND() * 12) + 1, '-', FLOOR(RAND() * 28) + 1),
        'A', concat(lcase(nom), ' ', lcase(prenom), '.jpg'));

UPDATE etudiant
SET fichier = REPLACE(
        REPLACE(
                REPLACE(
                        REPLACE(
                                REPLACE(
                                        REPLACE(
                                                REPLACE(
                                                        REPLACE(
                                                                REPLACE(
                                                                        REPLACE(
                                                                                REPLACE(
                                                                                        REPLACE(fichier,
                                                                                                'é', 'e'),
                                                                                        'è', 'e'),
                                                                                'ê', 'e'),
                                                                        'ë', 'e'),
                                                                'à', 'a'),
                                                        'â', 'a'),
                                                'ä', 'a'),
                                        'ô', 'o'),
                                'ö', 'o'),
                        'û', 'u'),
                'ü', 'u'),
        'ç', 'c');

select *
from options;
select *
from etudiant;