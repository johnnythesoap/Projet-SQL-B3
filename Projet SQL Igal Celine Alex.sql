/* Projet SQL avance Igal, Alex, Celine */

# transformation des colonnes int en varchar

ALTER TABLE zoo
MODIFY COLUMN hair VARCHAR(5),
MODIFY COLUMN feathers VARCHAR(5),
MODIFY COLUMN eggs VARCHAR(5),
MODIFY COLUMN milk VARCHAR(5),
MODIFY COLUMN airborne VARCHAR(5),
MODIFY COLUMN aquatic VARCHAR(5),
MODIFY COLUMN predator VARCHAR(5),
MODIFY COLUMN toothed VARCHAR(5),
MODIFY COLUMN backbone VARCHAR(5),
MODIFY COLUMN breathes VARCHAR(5),
MODIFY COLUMN venomous VARCHAR(5),
MODIFY COLUMN fins VARCHAR(5),
MODIFY COLUMN tail VARCHAR(5),
MODIFY COLUMN domestic VARCHAR(5),
MODIFY COLUMN catsize VARCHAR(5);


# replace values 0 par flase et 1 par true

UPDATE zoo
SET 
    hair = CASE 
              WHEN hair = 1 THEN 'true'
              ELSE 'false'
           END,
    feathers = CASE 
                  WHEN feathers = 1 THEN 'true'
                  ELSE 'false'
               END,
    eggs = CASE 
              WHEN eggs = 1 THEN 'true'
              ELSE 'false'
           END,
    milk = CASE 
              WHEN milk = 1 THEN 'true'
              ELSE 'false'
           END,
    airborne = CASE 
                  WHEN airborne = 1 THEN 'true'
                  ELSE 'false'
               END,
    aquatic = CASE 
                 WHEN aquatic = 1 THEN 'true'
                 ELSE 'false'
              END,
    predator = CASE 
                  WHEN predator = 1 THEN 'true'
                  ELSE 'false'
               END,
    toothed = CASE 
                 WHEN toothed = 1 THEN 'true'
                 ELSE 'false'
              END,
    backbone = CASE 
                  WHEN backbone = 1 THEN 'true'
                  ELSE 'false'
               END,
    breathes = CASE 
                  WHEN breathes = 1 THEN 'true'
                  ELSE 'false'
               END,
    venomous = CASE 
                  WHEN venomous = 1 THEN 'true'
                  ELSE 'false'
               END,
    fins = CASE 
              WHEN fins = 1 THEN 'true'
              ELSE 'false'
           END,
    tail = CASE 
              WHEN tail = 1 THEN 'true'
              ELSE 'false'
           END,
    domestic = CASE 
                  WHEN domestic = 1 THEN 'true'
                  ELSE 'false'
               END,
    catsize = CASE 
                 WHEN catsize = 1 THEN 'true'
                 ELSE 'false'
              END;


# AVG, STDEV, MIN, MAX de la valeur legs (pour faire des statistiques sur le nombre de jambes/pattes des animaux)

SELECT 
    MAX(legs) AS max_legs,
    MIN(legs) AS min_legs,
    SUM(legs) AS total_legs,
    AVG(legs) AS avg_legs,
    STDDEV(legs) AS stddev_legs
FROM zoo;

# nombre medien de legs, utilisant la formule pour trouver les median dans les datasets avec un nombre impair de lignes

SELECT legs AS median_legs
FROM (
    SELECT legs,
           @row_number := @row_number + 1 AS row_num
    FROM zoo, (SELECT @row_number := 0) AS r
    ORDER BY legs
) AS ranked
WHERE row_num = (SELECT FLOOR((COUNT(*) + 1) / 2) FROM zoo);


#animaux avec le nombre de legs le plus bas (0)

SELECT *
FROM zoo
WHERE legs = (SELECT MIN(legs) FROM zoo);

#animals avec le nombre de legs le plus haut (8)

SELECT *
FROM zoo
WHERE legs = (SELECT MAX(legs) FROM zoo);

#nombre de true dans chaque colonne (sur 101 animaux) pour deduire le nombre d'animaux possedant ces caracteristiques ou non

SELECT 
    SUM(CASE WHEN hair = 'true' THEN 1 ELSE 0 END) AS hair_true_count,
    SUM(CASE WHEN feathers = 'true' THEN 1 ELSE 0 END) AS feathers_true_count,
    SUM(CASE WHEN eggs = 'true' THEN 1 ELSE 0 END) AS eggs_true_count,
    SUM(CASE WHEN milk = 'true' THEN 1 ELSE 0 END) AS milk_true_count,
    SUM(CASE WHEN airborne = 'true' THEN 1 ELSE 0 END) AS airborne_true_count,
    SUM(CASE WHEN aquatic = 'true' THEN 1 ELSE 0 END) AS aquatic_true_count,
    SUM(CASE WHEN predator = 'true' THEN 1 ELSE 0 END) AS predator_true_count,
    SUM(CASE WHEN toothed = 'true' THEN 1 ELSE 0 END) AS toothed_true_count,
    SUM(CASE WHEN backbone = 'true' THEN 1 ELSE 0 END) AS backbone_true_count,
    SUM(CASE WHEN breathes = 'true' THEN 1 ELSE 0 END) AS breathes_true_count,
    SUM(CASE WHEN venomous = 'true' THEN 1 ELSE 0 END) AS venomous_true_count,
    SUM(CASE WHEN fins = 'true' THEN 1 ELSE 0 END) AS fins_true_count,
    
  #pour les jambes, il y en a de 0 a 8, donc 0 = false et > 0 = true
    SUM(CASE WHEN legs > 0 THEN 1 ELSE 0 END) AS legs_true_count,
    
    SUM(CASE WHEN tail = 'true' THEN 1 ELSE 0 END) AS tail_true_count,
    SUM(CASE WHEN domestic = 'true' THEN 1 ELSE 0 END) AS domestic_true_count,
    SUM(CASE WHEN catsize = 'true' THEN 1 ELSE 0 END) AS catsize_true_count
FROM zoo;


# le nombre d'especes dans chaque type de class (mamiferes, etc...)

SELECT 
    c.class_type, 
    COUNT(z.animal_name) AS number_of_species
FROM class c
JOIN zoo z ON c.class_number = z.class_type
GROUP BY c.class_type
ORDER BY number_of_species DESC;

# le nombre d'especes aquatiques par class

SELECT 
    c.class_type, 
    COUNT(z.animal_name) AS aquatic_species_count
FROM class c
JOIN zoo z ON c.class_number = z.class_type
WHERE z.aquatic = 'true'
GROUP BY c.class_type
ORDER BY aquatic_species_count DESC;

