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

#animaux avec le nombre de legs le plus bas (0)

SELECT *
FROM zoo
WHERE legs = (SELECT MIN(legs) FROM zoo);

#animals avec le nombre de legs le plus haut (8)

SELECT *
FROM zoo
WHERE legs = (SELECT MAX(legs) FROM zoo);