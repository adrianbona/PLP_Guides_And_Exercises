module Guide_3 (
) where

-- Ejercicio 6

-- Demostrar en deducción natural que las siguientes fórmulas son teoremas
-- sin usar principios de razonamiento clásicos salvo que se indique lo contrario


-- i. Modus ponens relativizado: (P ⇒ Q ⇒ R) ⇒ (P ⇒ Q) ⇒ P ⇒ R

----------------------------- ax      ------------------------------- ax
-- P ⇒ Q ⇒ R, P ⇒ Q, P ⊢ P ⇒ Q        P ⇒ Q ⇒ R, P ⇒ Q, P ⊢ P ⇒ Q ⇒ R
--------------------------------------------------------------------- ⇒e
-- P ⇒ Q ⇒ R, P ⇒ Q, P ⊢ R
--------------------------- ⇒i
-- P ⇒ Q ⇒ R, P ⇒ Q ⊢ P ⇒ R
------------------------------ ⇒i
-- P ⇒ Q ⇒ R ⊢ (P ⇒ Q) ⇒ P ⇒ R
-------------------------------- ⇒i
-- ⊢ (P ⇒ Q ⇒ R) ⇒ (P ⇒ Q) ⇒ P ⇒ R


-- ii. Reducción al absurdo: (P ⇒ ⊥) ⇒ ¬P

--------------ax       ---------------ax
-- P ⇒ ⊥, P ⊢ P        P ⇒ ⊥, P ⊢ P ⇒ ⊥
-------------------------------------- ⇒e
-- P ⇒ ⊥, P ⊢ ⊥
------------ ¬i
-- P ⇒ ⊥ ⊢ ¬P
---------------- ⇒i
-- ⊢ (P ⇒ ⊥) ⇒ ¬P


-- iii. Introducción de la doble negación: P ⇒ ¬¬P

------------ax      ---------ax
-- P, ¬P ⊢ P        P, ¬P ⊢ ¬P
------------ ⊥e
-- P, ¬P ⊢ ⊥
------------ ¬i
-- P ⊢ ¬¬P
----------- ⇒i
-- ⊢ P ⇒ ¬¬P


-- iv. Eliminación de la triple negación: ¬¬¬P ⇒ ¬P

-------------------ax     ----------------ax
-- ¬¬¬P, P, ¬P ⊢ P        ¬¬¬P, P, ¬P ⊢ ¬P
----------------------------------------- ⊥e
-- ¬¬¬P, P, ¬P ⊢ ⊥
------------------ ¬i
-- ¬¬¬P ⊢ ¬P
-------------- ⇒i
-- ⊢ ¬¬¬P ⇒ ¬P


-- v. Contraposición: (P ⇒ Q) ⇒ (¬Q ⇒ ¬P)

-----------------------ax      --------------------ax
-- P ⇒ Q, ¬Q, P, ¬P ⊢ P        P ⇒ Q, ¬Q, P, ¬P ⊢ ¬P
----------------------------------------- ⊥e
-- P ⇒ Q, ¬Q, P, ¬P ⊢ ⊥
---------------------- ¬i
-- P ⇒ Q, ¬Q ⊢ ¬P
------------------- ⇒i
-- P ⇒ Q ⊢ ¬Q ⇒ ¬P
------------------------ ⇒i
-- ⊢ (P ⇒ Q) ⇒ (¬Q ⇒ ¬P)


-- vi. Adjunción: ((P ∧ Q) ⇒ R) ⇔ (P ⇒ Q ⇒ R)

-- Adjunción (ida): ((P ∧ Q) ⇒ R) ⇒ (P ⇒ Q ⇒ R)

-------------------------ax       ----------------------ax
-- (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ P        (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ Q
------------------------------∧i       ------------------------------ ax
-- (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ P ∧ Q        (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ (P ∧ Q) ⇒ R
---------------------------------------------------------------------- ⇒e
-- (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ R
------------------------ ⇒i
-- (P ∧ Q) ⇒ R, P ⊢ Q ⇒ R
-------------------------- ⇒i
-- (P ∧ Q) ⇒ R ⊢ P ⇒ Q ⇒ R
------------------------------- ⇒i
-- ⊢ ((P ∧ Q) ⇒ R) ⇒ (P ⇒ Q ⇒ R)


-- Adjunción (vuelta): (P ⇒ Q ⇒ R) ⇒ ((P ∧ Q) ⇒ R)

------------------------------ax
-- P ⇒ Q ⇒ R, P ∧ Q, P ⊢ P ∧ Q
--------------------------∧e1
-- P ⇒ Q ⇒ R, P ∧ Q, P ⊢ Q
-------------------------- ⇒i      ----------------------------ax
-- P ⇒ Q ⇒ R, P ∧ Q ⊢ P ⇒ Q        P ⇒ Q ⇒ R, P ∧ Q ⊢ P ⇒ Q ⇒ R
----------------------------------------------------------------- ⇒e
-- P ⇒ Q ⇒ R, P ∧ Q ⊢ R
-------------------------- ⇒i
-- P ⇒ Q ⇒ R ⊢ (P ∧ Q) ⇒ R
------------------------------- ⇒i
-- ⊢ (P ⇒ Q ⇒ R) ⇒ ((P ∧ Q) ⇒ R)


-- vii. de Morgan (I): ¬(P ∨ Q) ⇔ (¬P ∧ ¬Q)

-- de Morgan (ida): ¬(P ∨ Q) ⇒ (¬P ∧ ¬Q)
-- de Morgan (vuelta): (¬P ∧ ¬Q) ⇒ ¬(P ∨ Q)


-- viii. de Morgan (II): ¬(P ∧ Q) ⇔ (¬P ∨ ¬Q) (Para la dirección ⇒ es necesario usar principios de razonamiento clásicos)

-- de Morgan (ida): ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)
-- de Morgan (vuelta): (¬P ∨ ¬Q) ⇒ ¬(P ∧ Q)


-- ix. Conmutatividad (∧): (P ∧ Q) ⇒ (Q ∧ P)


-- x. Asociatividad (∧): ((P ∧ Q) ∧ R) ⇔ (P ∧ (Q ∧ R))

-- Asociatividad (∧) (ida): ((P ∧ Q) ∧ R) ⇒ (P ∧ (Q ∧ R))
-- Asociatividad (∧) (vuelta): (P ∧ (Q ∧ R)) ⇒ ((P ∧ Q) ∧ R)


-- xi. Conmutatividad (∨): (P ∨ Q) ⇒ (Q ∨ P)


-- xii. Asociatividad (∨): ((P ∨ Q) ∨ R) ⇔ (P ∨ (Q ∨ R))

-- Asociatividad (∨) (ida): ((P ∨ Q) ∨ R) ⇒ (P ∨ (Q ∨ R))
-- Asociatividad (∨) (vuelta): (P ∨ (Q ∨ R)) ⇒ ((P ∨ Q) ∨ R)










































