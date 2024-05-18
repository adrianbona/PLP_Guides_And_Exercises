module Guide_PreExam (
) where

--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22

-- Demostrar las siguientes propiedades sobre árboles AB:

-- data AB a = Nil | Bin (AB a) a (AB a)

-- truncar :: AB a -> Int -> AB a
-- truncar Nil = Nil {T0}
-- truncar (Bin i r d) n = if n == 0 then Nil else Bin (truncar i (n-1)) r (truncar d (n-1)) {T1}

-- foldAB :: b -> (b -> a -> b -> b) -> AB a -> b
-- foldAB cNil cBin Nil = cNil {F0}
-- foldAB cNil cBin (Bin i r d) = cBin (rec i) r (rec d) where rec = foldAB cNil cBin {F1}

-- altura :: AB a -> Int
-- altura = foldAB 0 (\ri x rd -> 1 + max ri rd) {A0}

-- ∀ x::Int . ∀ y::Int . ∀ z::Int . max (min x y) (min x z) = min x (max y z) {LEMA_1}
-- ∀ x::Int . ∀ y::Int . ∀ z::Int . z + min x y = min (z+x) (z+y) {LEMA_2}

-- ∀ t::AB a . altura t ≥ 0

-- Predicado unario: P(t) = altura t ≥ 0

-- Caso base: P(Nil) = altura Nil ≥ 0

-- altura Nil ≥ 0 {A0}
-- foldAB 0 (\ri x rd -> 1 + max ri rd) Nil ≥ 0 {F0}
-- 0 ≥ 0 {queda demostrada la desigualdad}

-- Hipótesis inductiva: P(i) = altura i ≥ 0 y P(d) = altura d ≥ 0
-- Paso inductivo: P(Bin i r d) = altura (Bin i r d) ≥ 0

-- altura (Bin i r d) ≥ 0 {A0}
-- foldAB 0 (\ri x rd -> 1 + max ri rd) (Bin i r d) ≥ 0 {F1}
-- 1 + max (foldAB 0 (\ri x rd -> 1 + max ri rd) i) (foldAB 0 (\ri x rd -> 1 + max ri rd) d) ≥ 0 {A0}
-- 1 + max (altura i) (altura d) ≥ 0 {aritmética}









--  ∀ t::AB a . ∀ n::Int . n ≥ 0 ⇒ (altura (truncar t n) = min n (altura t))






--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33

-- Demostrar que la siguiente fórmula es un teorema. No utilizar razonamientos clásicos para la vuelta.

-- de Morgan (ida): ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)

--------------------------------- ax    ------------------------------ ax
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬(¬P ∨ ¬Q)    ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬(¬P ∨ ¬Q)
-------------------------------- DM1    ----------------------------- DM1
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬P ^ ¬¬Q     ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬P ^ ¬¬Q
------------------------------- ∧e1     ---------------------------- ∧e2
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬P           ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬¬Q
------------------------ ¬¬e            --------------------- ¬¬e
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ P             ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ Q
------------------------------------------------------------- ∧i             ---------------------------- ax
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ P ∧ Q                                              ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ¬(P ∧ Q)
------------------------ ¬e
-- ¬(P ∧ Q), ¬(¬P ∨ ¬Q) ⊢ ⊥
------------------- PBC
-- ¬(P ∧ Q) ⊢ ¬P ∨ ¬Q
---------------------- ⇒i
-- ⊢ ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)


-- de Morgan (vuelta): (¬P ∨ ¬Q) ⇒ ¬(P ∧ Q)

---------------------- ax    ------------------- ax
-- ¬P ∨ ¬Q, P ∧ Q ⊢ P ∧ Q    ¬P ∨ ¬Q, P ∧ Q ⊢ P ∧ Q
--------------------- ∧e1    ------------------ ∧e2
-- ¬P ∨ ¬Q, P ∧ Q ⊢ P        ¬P ∨ ¬Q, P ∧ Q ⊢ Q
------------------- ¬¬i      ---------------- ¬¬i
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ¬¬P      ¬P ∨ ¬Q, P ∧ Q ⊢ ¬¬Q
---------------------------------------------- ∧i
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ¬¬P ∧ ¬¬Q
-------------------------- DM1                         --------------------- ax
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ¬(¬P ∨ ¬Q)                         ¬P ∨ ¬Q, P ∧ Q ⊢ ¬P ∨ ¬Q
---------------------------------------------------------------------------- ¬e
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ⊥
------------------ ¬i
-- ¬P ∨ ¬Q ⊢ ¬(P ∧ Q)
---------------------- ⇒i
-- ⊢ (¬P ∨ ¬Q) ⇒ ¬(P ∧ Q)


--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44