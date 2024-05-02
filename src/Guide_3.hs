module Guide_3 (
) where

-- Ejercicio 6

-- Demostrar en deducción natural que las siguientes fórmulas son teoremas
-- sin usar principios de razonamiento clásicos salvo que se indique lo contrario


-- i. Modus ponens relativizado: (P ⇒ Q ⇒ R) ⇒ (P ⇒ Q) ⇒ P ⇒ R

----------------------------- ax      ----------------------------- ax
-- P ⇒ Q ⇒ R, P ⇒ Q, P ⊢ P ⇒ Q        P ⇒ Q ⇒ R, P ⇒ Q, P ⊢ P ⇒ Q ⇒ R
------------------------------------------------------------------- ⇒e
-- P ⇒ Q ⇒ R, P ⇒ Q, P ⊢ R
--------------------------- ⇒i
-- P ⇒ Q ⇒ R, P ⇒ Q ⊢ P ⇒ R
------------------------------ ⇒i
-- P ⇒ Q ⇒ R ⊢ (P ⇒ Q) ⇒ P ⇒ R
-------------------------------- ⇒i
-- ⊢ (P ⇒ Q ⇒ R) ⇒ (P ⇒ Q) ⇒ P ⇒ R


-- ii. Reducción al absurdo: (P ⇒ ⊥) ⇒ ¬P

-------------- ax       --------------- ax
-- P ⇒ ⊥, P ⊢ P        P ⇒ ⊥, P ⊢ P ⇒ ⊥
-------------------------------------- ⇒e
-- P ⇒ ⊥, P ⊢ ⊥
------------ ¬i
-- P ⇒ ⊥ ⊢ ¬P
---------------- ⇒i
-- ⊢ (P ⇒ ⊥) ⇒ ¬P


-- iii. Introducción de la doble negación: P ⇒ ¬¬P

------------ ax      --------- ax
-- P, ¬P ⊢ P        P, ¬P ⊢ ¬P
------------ ¬e
-- P, ¬P ⊢ ⊥
------------ ¬i
-- P ⊢ ¬¬P
----------- ⇒i
-- ⊢ P ⇒ ¬¬P


-- iv. Eliminación de la triple negación: ¬¬¬P ⇒ ¬P

------------ ax
-- ¬¬¬P, P ⊢ P
-------------- ¬¬i      ------------ ax
-- ¬¬¬P, P ⊢ ¬¬P        ¬¬¬P, P ⊢ ¬¬¬P
----------------------------------------- ¬e
-- ¬¬¬P, P ⊢ ⊥
------------------ ¬i
-- ¬¬¬P ⊢ ¬P
-------------- ⇒i
-- ⊢ ¬¬¬P ⇒ ¬P


-- v. Contraposición: (P ⇒ Q) ⇒ (¬Q ⇒ ¬P)

-------------------- ax        ---------------- ax
-- P ⇒ Q, ¬Q, P ⊢ P ⇒ Q        P ⇒ Q, ¬Q, P ⊢ P
----------------- ⇒e      ---------------- ax
-- P ⇒ Q, ¬Q, P ⊢ Q       P ⇒ Q, ¬Q, P ⊢ ¬Q
------------------------------------------------- ¬e
-- P ⇒ Q, ¬Q, P ⊢ ⊥
--------------------- ¬i
-- P ⇒ Q, ¬Q ⊢ ¬P
----------------- ⇒i
-- P ⇒ Q ⊢ ¬Q ⇒ ¬P
---------------------- ⇒i
-- ⊢ (P ⇒ Q) ⇒ (¬Q ⇒ ¬P)


-- vi. Adjunción: ((P ∧ Q) ⇒ R) ⇔ (P ⇒ Q ⇒ R)

-- Adjunción (ida): ((P ∧ Q) ⇒ R) ⇒ (P ⇒ Q ⇒ R)

----------------------- ax        -------------------- ax
-- (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ P        (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ Q
---------------------------- ∧i       ------------------------------ ax
-- (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ P ∧ Q        (P ∧ Q) ⇒ R, P, Q ⊢ ⇒ (P ∧ Q) ⇒ R
--------------------------------------------------------------------- ⇒e
-- (P ∧ Q) ⇒ R, P, Q ⊢ R
----------------------- ⇒i
-- (P ∧ Q) ⇒ R, P ⊢ Q ⇒ R
----------------------- ⇒i
-- (P ∧ Q) ⇒ R ⊢ P ⇒ Q ⇒ R
----------------------------- ⇒i
-- ⊢ ((P ∧ Q) ⇒ R) ⇒ (P ⇒ Q ⇒ R)


-- Adjunción (vuelta): (P ⇒ Q ⇒ R) ⇒ ((P ∧ Q) ⇒ R)

------------------------------ ax
-- P ⇒ Q ⇒ R, P ∧ Q, P ⊢ P ∧ Q
-------------------------- ∧e1
-- P ⇒ Q ⇒ R, P ∧ Q, P ⊢ Q
------------------------ ⇒i        ------------------------- ax
-- P ⇒ Q ⇒ R, P ∧ Q ⊢ P ⇒ Q        P ⇒ Q ⇒ R, P ∧ Q ⊢ P ⇒ Q ⇒ R
------------------------------------------------------------- ⇒e
-- P ⇒ Q ⇒ R, P ∧ Q ⊢ R
----------------------- ⇒i
-- P ⇒ Q ⇒ R ⊢ (P ∧ Q) ⇒ R
----------------------------- ⇒i
-- ⊢ (P ⇒ Q ⇒ R) ⇒ ((P ∧ Q) ⇒ R)


-- vii. de Morgan (I): ¬(P ∨ Q) ⇔ (¬P ∧ ¬Q)

-- de Morgan (ida): ¬(P ∨ Q) ⇒ (¬P ∧ ¬Q)

-- ¬(P ∨ Q), P ⊢ P ∨ Q        ¬(P ∨ Q), P ⊢ ¬(P ∨ Q)

--B------------- ax
-- ¬(P ∨ Q), Q ⊢ Q
--B----------------- v2       --B------------------ ax
-- ¬(P ∨ Q), Q ⊢ P ∨ Q        ¬(P ∨ Q), Q ⊢ ¬(P ∨ Q)

--A------------- ax
-- ¬(P ∨ Q), P ⊢ P
--A----------------- v1       --A------------------ ax
-- ¬(P ∨ Q), P ⊢ P ∨ Q        ¬(P ∨ Q), P ⊢ ¬(P ∨ Q)

--AB---------------------------------------------- ¬e
-- ¬(P ∨ Q), P ⊢ ⊥      ¬(P ∨ Q), Q ⊢ ⊥
--------------- ¬i      ----------- ¬i
-- ¬(P ∨ Q) ⊢ ¬P        ¬(P ∨ Q) ⊢ ¬Q
------------------------------------∧i
-- ¬(P ∨ Q) ⊢ ¬P ∧ ¬Q
------------------------ ⇒i
-- ⊢ ¬(P ∨ Q) ⇒ (¬P ∧ ¬Q)


-- de Morgan (vuelta): (¬P ∧ ¬Q) ⇒ ¬(P ∨ Q)

--B------------------------- ax
-- ¬P ∧ ¬Q, P ∨ Q, P ⊢ ¬P ∧ ¬Q
--B------------------- ∧e1       --B----------------- ax
-- ¬P ∧ ¬Q, P ∨ Q, Q ⊢ ¬Q        ¬P ∧ ¬Q, P ∨ Q, Q ⊢ Q

--A------------------------- ax
-- ¬P ∧ ¬Q, P ∨ Q, P ⊢ ¬P ∧ ¬Q
--A------------------- ∧e2       --A----------------- ax
-- ¬P ∧ ¬Q, P ∨ Q, P ⊢ ¬P        ¬P ∧ ¬Q, P ∨ Q, P ⊢ P

--A------------------- ¬e   --B---------------- ¬e   -------------------- ax
-- ¬P ∧ ¬Q, P ∨ Q, P ⊢ ⊥    ¬P ∧ ¬Q, P ∨ Q, Q ⊢ ⊥    ¬P ∧ ¬Q, P ∨ Q ⊢ P ∨ Q
------------------------------------------------------------------------- ∨e
-- ¬P ∧ ¬Q, P ∨ Q ⊢ ⊥
--------------------- ¬i
-- ¬P ∧ ¬Q ⊢ ¬(P ∨ Q)
------------------------ ⇒i
-- ⊢ (¬P ∧ ¬Q) ⇒ ¬(P ∨ Q)


-- viii. de Morgan (II): ¬(P ∧ Q) ⇔ (¬P ∨ ¬Q) (Para la dirección ⇒ es necesario usar principios de razonamiento clásicos)

-- de Morgan (ida): ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)

--------------------------------- ax        ------------------------------ ax
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬(¬P ∨ ¬Q)        ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬(¬P ∨ ¬Q)
-------------------------------- DM1        ---------------------------- DM1
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬P ^ ¬¬Q        ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬P ^ ¬¬Q
------------------------------- ∧e1        ---------------------------- ∧e2
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬P        ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬Q
------------------------ ¬¬e         --------------------- ¬¬e
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ P          ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ Q
---------------------------------------------------------- ∧i       ---------------------------- ax
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ P ∧ Q                                     ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬(P ∧ Q)
------------------------ ¬e
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ⊥
------------------- PBC
-- ¬(P ∧ Q) ⊢ ¬P ∨ ¬Q
---------------------- ⇒i
-- ⊢ ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)


-- de Morgan (vuelta): (¬P ∨ ¬Q) ⇒ ¬(P ∧ Q)

---------------------- ax      ------------------- ax
-- ¬P ∨ ¬Q, P ∧ Q ⊢ P ∧ Q      ¬P ∨ ¬Q, P ∧ Q ⊢ P ∧ Q
----------------- ∧e1          -------------- ∧e2
-- ¬P ∨ ¬Q, P ∧ Q ⊢ P          ¬P ∨ ¬Q, P ∧ Q ⊢ Q
------------------- ¬¬i        ---------------- ¬¬i
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ¬¬P        ¬P ∨ ¬Q, P ∧ Q ⊢ ¬¬Q
--------------------------------------------------- ∧i
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ¬¬P ∧ ¬¬Q
-------------------------- DM1        --------------------- ax
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ¬(¬P ∨ ¬Q)        ¬P ∨ ¬Q, P ∧ Q ⊢ ¬P ∨ ¬Q
------------------ ¬e
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ⊥
------------------ ¬i
-- ¬P ∨ ¬Q ⊢ ¬(P ∧ Q)
---------------------- ⇒i
-- ⊢ (¬P ∨ ¬Q) ⇒ ¬(P ∧ Q)


-- ix. Conmutatividad (∧): (P ∧ Q) ⇒ (Q ∧ P)

------------- ax    ---------- ax
-- P ∧ Q ⊢ P ∧ Q    P ∧ Q ⊢ P ∧ Q
------------ ∧e1    --------- ∧e2
-- P ∧ Q ⊢ P        P ∧ Q ⊢ Q
-------------------------- ∧i
-- P ∧ Q ⊢ Q ∧ P
-------------------- ⇒i
-- ⊢ (P ∧ Q) ⇒ (Q ∧ P)


-- x. Asociatividad (∧): ((P ∧ Q) ∧ R) ⇔ (P ∧ (Q ∧ R))

-- Asociatividad (∧) (ida): ((P ∧ Q) ∧ R) ⇒ (P ∧ (Q ∧ R))

--                               ---------------------- ax
--                               (P ∧ Q) ∧ R ⊢ (P ∧ Q) ∧ R
------------------------- ax     --------------------- ∧e1  ---------------------- ax
-- (P ∧ Q) ∧ R ⊢ (P ∧ Q) ∧ R     (P ∧ Q) ∧ R ⊢ P ∧ Q        (P ∧ Q) ∧ R ⊢ (P ∧ Q) ∧ R
------------------------ ∧e1     --------------- ∧e2        --------------------- ∧e2
-- (P ∧ Q) ∧ R ⊢ P ∧ Q           (P ∧ Q) ∧ R ⊢ Q            (P ∧ Q) ∧ R ⊢ R
------------------ ∧e1           --------------------------------------- ∧i
-- (P ∧ Q) ∧ R ⊢ P               (P ∧ Q) ∧ R ⊢ Q ∧ R
------------------------------------------------- ∧i
-- (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)
------------------------------- ⇒i
-- ⊢ ((P ∧ Q) ∧ R) ⇒ (P ∧ (Q ∧ R))


-- Asociatividad (∧) (vuelta): (P ∧ (Q ∧ R)) ⇒ ((P ∧ Q) ∧ R)

--                                                             ---------------------- ax
--                                                             P ∧ (Q ∧ R) ⊢ P ∧ (Q ∧ R)
------------------------- ax     ---------------------- ax     --------------------- ∧e2
-- P ∧ (Q ∧ R) ⊢ P ∧ (Q ∧ R)     P ∧ (Q ∧ R) ⊢ P ∧ (Q ∧ R)     P ∧ (Q ∧ R) ⊢ Q ∧ R
------------------ ∧e2           ------------- ∧e2             ------------- ∧e1
-- P ∧ (Q ∧ R) ⊢ Q ∧ R           P ∧ (Q ∧ R) ⊢ P               P ∧ (Q ∧ R) ⊢ Q
------------------ ∧e2           ------------------------------------------- ∧i
-- P ∧ (Q ∧ R) ⊢ R               P ∧ (Q ∧ R) ⊢ P ∧ Q
------------------------------------------------ ∧i
-- P ∧ (Q ∧ R) ⊢ (P ∧ Q) ∧ R
------------------------------- ⇒i
-- ⊢ (P ∧ (Q ∧ R)) ⇒ ((P ∧ Q) ∧ R)


-- xi. Conmutatividad (∨): (P ∨ Q) ⇒ (Q ∨ P)

--                  ---------- ax       ---------- ax
--                  P ∨ Q, P ⊢ P        P ∨ Q, Q ⊢ Q
------------- ax    ------------- v2    ------------- v1
-- P ∨ Q ⊢ P ∨ Q    P ∨ Q, P ⊢ Q ∨ P    P ∨ Q, Q ⊢ Q ∨ P
------------------------------------------------------ ve
-- P ∨ Q ⊢ Q ∨ P
-------------------- ⇒i
-- ⊢ (P ∨ Q) ⇒ (Q ∨ P)


-- xii. Asociatividad (∨): ((P ∨ Q) ∨ R) ⇔ (P ∨ (Q ∨ R))

-- Asociatividad (∨) (ida): ((P ∨ Q) ∨ R) ⇒ (P ∨ (Q ∨ R))
--                                                                                                     ---------------------- ax
--                                                                                                     (P ∨ Q) ∨ R, P ∨ Q, Q ⊢ Q
--                              --------------- ax              ---------------------- ax              -------------------------- v1
--                              (P ∨ Q) ∨ R, R ⊢ R              (P ∨ Q) ∨ R, P ∨ Q, P ⊢ P              (P ∨ Q) ∨ R, P ∨ Q, Q ⊢ Q ∨ R
--                              ------------------- v2          -------------------------------- v1    -------------------------------- v2    ----------------------- ax
--                              (P ∨ Q) ∨ R, R ⊢ Q ∨ R          (P ∨ Q) ∨ R, P ∨ Q, P ⊢ P ∨ (Q ∨ R)    (P ∨ Q) ∨ R, P ∨ Q, Q ⊢ P ∨ (Q ∨ R)    (P ∨ Q) ∨ R, P ∨ Q ⊢ P ∨ Q
------------------------- ax    ------------------------- v2    ----------------------------------------------------------------------------------------------------- ve
-- (P ∨ Q) ∨ R ⊢ (P ∨ Q) ∨ R    (P ∨ Q) ∨ R, R ⊢ P ∨ (Q ∨ R)    (P ∨ Q) ∨ R, P ∨ Q ⊢ P ∨ (Q ∨ R)
--------------------------------------------------------------------------------------------- ve
-- (P ∨ Q) ∨ R ⊢ P ∨ (Q ∨ R)
--------------------------- ⇒i
-- ⊢ (P ∨ Q) ∨ R ⇒ P ∨ (Q ∨ R)


-- Asociatividad (∨) (vuelta): (P ∨ (Q ∨ R)) ⇒ ((P ∨ Q) ∨ R)

--                                                              ---------------------- ax
--                                                              P ∨ (Q ∨ R), Q ∨ R, Q ⊢ Q
--                              --------------- ax              -------------------------- v2          ---------------------- ax
--                              P ∨ (Q ∨ R), P ⊢ P              P ∨ (Q ∨ R), Q ∨ R, Q ⊢ P ∨ Q          P ∨ (Q ∨ R), Q ∨ R, R ⊢ R
                                ------------------- v1          -------------------------------- v1    -------------------------------- v2    ----------------------- ax
--                              P ∨ (Q ∨ R), P ⊢ P ∨ Q          P ∨ (Q ∨ R), Q ∨ R, Q ⊢ (P ∨ Q) ∨ R    P ∨ (Q ∨ R), Q ∨ R, R ⊢ (P ∨ Q) ∨ R    P ∨ (Q ∨ R), Q ∨ R ⊢ Q ∨ R
------------------------- ax    ------------------------- v1    ----------------------------------------------------------------------------------------------------- ve
-- P ∨ (Q ∨ R) ⊢ P ∨ (Q ∨ R)    P ∨ (Q ∨ R), P ⊢ (P ∨ Q) ∨ R    P ∨ (Q ∨ R), Q ∨ R ⊢ (P ∨ Q) ∨ R
--------------------------------------------------------------------------------------------- ve
-- P ∨ (Q ∨ R) ⊢ (P ∨ Q) ∨ R
------------------------------- ⇒i
-- ⊢ (P ∨ (Q ∨ R)) ⇒ ((P ∨ Q) ∨ R)


-- Ejercicio 7

-- i. Absurdo clásico: (¬τ ⇒ ⊥) ⇒ τ

------------------- ax    ------------ ax
-- ¬τ ⇒ ⊥, ¬τ ⊢ ¬τ ⇒ ⊥    ¬τ ⇒ ⊥, ¬τ ⊢ ¬τ
--------------------------------------- ⇒e
-- ¬τ ⇒ ⊥, ¬τ ⊢ ⊥
------------- PBC
-- ¬τ ⇒ ⊥ ⊢ τ
-------------- ⇒i
-- ⊢ (¬τ ⇒ ⊥) ⇒ τ


-- ii. Ley de Peirce: ((τ ⇒ ρ) ⇒ τ) ⇒ τ

--                         ------------------- ax    -------------------- ax
--                         (τ ⇒ ρ) ⇒ τ, ¬τ, τ ⊢ τ    (τ ⇒ ρ) ⇒ τ, ¬τ, τ ⊢ ¬τ
--                         ---------------------------------------------- ¬e
--                         (τ ⇒ ρ) ⇒ τ, ¬τ, τ ⊢ ⊥
--                         ------------------- ⊥e
--                         (τ ⇒ ρ) ⇒ τ, ¬τ, τ ⊢ ρ
--                         --------------------- ⇒i   -------------------------- ax
--                         (τ ⇒ ρ) ⇒ τ, ¬τ ⊢ τ ⇒ ρ    (τ ⇒ ρ) ⇒ τ, ¬τ ⊢ (τ ⇒ ρ) ⇒ τ
-------------------- ax    ----------------------------------------------------- ⇒e
-- (τ ⇒ ρ) ⇒ τ, ¬τ ⊢ ¬τ    (τ ⇒ ρ) ⇒ τ, ¬τ ⊢ τ
------------------------------------------- ¬e
-- (τ ⇒ ρ) ⇒ τ, ¬τ ⊢ ⊥
------------------- ¬i
-- (τ ⇒ ρ) ⇒ τ ⊢ ¬¬τ
---------------- ¬¬e
-- (τ ⇒ ρ) ⇒ τ ⊢ τ
--------------- ⇒i
-- ⊢ ((τ ⇒ ρ) ⇒ τ) ⇒ τ


-- iii. Tercero excluido: τ ∨ ¬τ

---------------- ax
-- ¬(τ ∨ ¬τ), τ ⊢ τ
-------------------- ∨i1    --------------------- ax
-- ¬(τ ∨ ¬τ), τ ⊢ τ ∨ ¬τ    ¬(τ ∨ ¬τ), τ ⊢ ¬(τ ∨ ¬τ)
------------------------------------------------- ¬e
-- ¬(τ ∨ ¬τ), τ ⊢ ⊥
---------------- ¬i
-- ¬(τ ∨ ¬τ) ⊢ ¬τ
----------------- ∨i2    ------------------ ax
-- ¬(τ ∨ ¬τ) ⊢ τ ∨ ¬τ    ¬(τ ∨ ¬τ) ⊢ ¬(τ ∨ ¬τ)
------------------------------------------- ¬e
-- ¬(τ ∨ ¬τ) ⊢ ⊥
------------- ¬i
-- ⊢ ¬¬(τ ∨ ¬τ)
----------- ¬¬e
-- ⊢ τ ∨ ¬τ


-- iv. Consecuencia milagrosa: (¬τ ⇒ τ) ⇒ τ

--                    ---------------- ax    ------------ ax
--                    ¬τ ⇒ τ, ¬τ ⊢ ¬τ ⇒ τ    ¬τ ⇒ τ, ¬τ ⊢ ¬τ
--------------- ax    ----------------------------------- ⇒e
-- ¬τ ⇒ τ, ¬τ ⊢ ¬τ    ¬τ ⇒ τ, ¬τ ⊢ τ
--------------------------------- ¬e
-- ¬τ ⇒ τ, ¬τ ⊢ ⊥
------------- PBC
-- ¬τ ⇒ τ ⊢ τ
-------------- ⇒i
-- ⊢ (¬τ ⇒ τ) ⇒ τ


-- v. Contraposición clásica: (¬ρ ⇒ ¬τ) ⇒ (τ ⇒ ρ)

-- vi. Análisis de casos: (τ ⇒ ρ) ⇒ (¬τ ⇒ ρ) ⇒ ρ

-- vii. Implicación vs. disyunción: (τ ⇒ ρ) ⇔ (¬τ ∨ ρ)




































