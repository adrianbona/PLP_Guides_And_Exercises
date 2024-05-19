module Guide_PreExam (
    Componente (..),
    NaveEspacial (..),
    foldNave,
    recNave,
    espejo,
    truncar,
    esSubnavePropia,
) where

--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11

data Componente = Contenedor | Motor | Escudo | Cañón deriving Eq
data NaveEspacial = Módulo Componente NaveEspacial NaveEspacial | Base Componente deriving Eq

instance Show Componente where
    show Contenedor = "Contenedor"
    show Motor = "Motor"
    show Escudo = "Escudo"
    show Cañón = "Cañón"

instance Show NaveEspacial where
    show = foldNave (\c i d -> "Módulo " ++ show c ++ " (" ++ i ++ ") (" ++ d ++ ")") (\c -> "Base " ++ show c)

foldNave :: (Componente -> a -> a -> a) -> (Componente -> a) -> NaveEspacial -> a
foldNave _ fBase (Base c) = fBase c
foldNave fMódulo fBase (Módulo c i d) = fMódulo c (rec i) (rec d) where rec = foldNave fMódulo fBase

recNave :: (NaveEspacial -> Componente -> a -> a -> a) -> (Componente -> a) -> NaveEspacial -> a
recNave _ fBase (Base c) = fBase c
recNave fMódulo fBase (Módulo c i d) = fMódulo (Módulo c i d) c (rec i) (rec d) where rec = recNave fMódulo fBase

espejo :: NaveEspacial -> NaveEspacial
espejo = foldNave (\c i d -> Módulo c d i) Base

truncar :: NaveEspacial -> Int -> NaveEspacial
truncar (Base c) _ = Base c
truncar (Módulo c i d) n = if n == 0 then Base c else Módulo c (truncar i (n-1)) (truncar d (n-1))

--No se asegura de que no sean la misma nave
esSubnavePropia :: NaveEspacial -> NaveEspacial -> Bool
esSubnavePropia subNave nave =
    recNave(\n c i d ->
      case n of
        Módulo c' i' d' -> rec i' || rec d' || n == subNave
    )
    (\c -> subNave == Base c)
    nave
        where rec = esSubnavePropia subNave


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

-- Predicado unario: P(t) = ∀ n::Int . n ≥ 0 ⇒ (altura (truncar t n) = min n (altura t))

-- Caso base: P(Nil) = ∀ n::Int . n ≥ 0 ⇒ (altura (truncar Nil n) = min n (altura Nil))

-- ∀ n::Int . n ≥ 0 ⇒ (altura (truncar Nil n) = min n (altura Nil)) {T0}
-- ∀ n::Int . n ≥ 0 ⇒ (altura (Nil) = min n (altura Nil)) {A0}
-- ∀ n::Int . n ≥ 0 ⇒ (0 = min n 0) {aritmética}
-- ∀ n::Int . n ≥ 0 ⇒ (0 = 0) {queda demostrada la implicación}

-- Hipótesis inductivas:
--    P(i) = ∀ n::Int . n ≥ 0 ⇒ (altura (truncar i n) = min n (altura i))
--    P(d) = ∀ n::Int . n ≥ 0 ⇒ (altura (truncar d n) = min n (altura d))

-- Paso inductivo: P(Bin i r d) = ∀ n::Int . n ≥ 0 ⇒ (altura (truncar (Bin i r d) n) = min n (altura (Bin i r d)))

-- Vamos a separar la demostración en tres partes: n = 0, n > 0 y n < 0

-- Caso n < 0:

-- Si n < 0 entonces n ≥ 0 es falso y la implicación es verdadera.

-- Caso n = 0:

-- altura (truncar (Bin i r d) 0) = min 0 (altura (Bin i r d)) {T1}
-- altura (if n == 0 then Nil else Bin (truncar i (n-1)) r (truncar d (n-1))) = min 0 (altura (Bin i r d)) {CASO n = 0}
-- altura (Nil) = min 0 (altura (Bin i r d)) {A0}
-- foldAB 0 (\ri x rd -> 1 + max ri rd) Nil = min 0 (altura (Bin i r d)) {F0}
-- 0 = min 0 (altura (Bin i r d)) {aritmética}
-- 0 = 0 {queda demostrada la igualdad}

-- Caso n > 0:

-- altura (truncar (Bin i r d) n) = min n (altura (Bin i r d)) {A0}
-- foldAB 0 (\ri x rd -> 1 + max ri rd) (truncar (Bin i r d) n) = min n (altura (Bin i r d)) {T1}
-- foldAB 0 (\ri x rd -> 1 + max ri rd) (if n == 0 then Nil else Bin (truncar i (n-1)) r (truncar d (n-1))) = min n (altura (Bin i r d)) {CASO n > 0}
-- foldAB 0 (\ri x rd -> 1 + max ri rd) (Bin (truncar i (n-1)) r (truncar d (n-1))) = min n (altura (Bin i r d)) {F1}
-- 1 + max (foldAB 0 (\ri x rd -> 1 + max ri rd) (truncar i (n-1))) (foldAB 0 (\ri x rd -> 1 + max ri rd) (truncar d (n-1))) = min n (altura (Bin i r d)) {A0}
-- 1 + max (altura (truncar i (n-1))) (altura (truncar d (n-1))) = min n (altura (Bin i r d)) {A0}
-- 1 + max (altura (truncar i (n-1))) (altura (truncar d (n-1))) = min n (foldAB 0 (\ri x rd -> 1 + max ri rd) (Bin i r d)) {F1}
-- 1 + max (altura (truncar i (n-1))) (altura (truncar d (n-1))) = min n (1 + max (foldAB 0 (\ri x rd -> 1 + max ri rd) i) (foldAB 0 (\ri x rd -> 1 + max ri rd) d)) {A0}
-- 1 + max (altura (truncar i (n-1))) (altura (truncar d (n-1))) = min n (1 + max (altura i) (altura d)) {LEMA_2}
-- 1 + max (altura (truncar i (n-1))) (altura (truncar d (n-1))) = 1 + min (n-1) (max (altura i) (altura d)) {aritmética}
-- max (altura (truncar i (n-1))) (altura (truncar d (n-1))) = min (n-1) (max (altura i) (altura d))

-- Como estamos en el caso n > 0 entonces vale n-1 ≥ 0 y podemos reescribir de la siguiente forma sin perder generalidad:

-- max (altura (truncar i n)) (altura (truncar d n)) = min n (max (altura i) (altura d)) {HI}
-- max (min n (altura i) min n (altura d)) = min n (max (altura i) (altura d)) {LEMA_1}
-- min n (max (altura i) (altura d)) = min n (max (altura i) (altura d)) {queda demostrada la igualdad y la implicación}


--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33

-- Demostrar que la siguiente fórmula es un teorema. No utilizar razonamientos clásicos para la vuelta.

-- de Morgan (ida): ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)

--                                                                                                                                  --------------- ax    --------------- ax
--                                                                                                                                  ¬(P ∧ Q), P, Q ⊢ P    ¬(P ∧ Q), P, Q ⊢ Q
--                                                                                                     ---------------------- ax    ------------------------------------- ∧i
--                                                                                                     ¬(P ∧ Q), P, Q ⊢ ¬(P ∧ Q)    ¬(P ∧ Q), P, Q ⊢ P ∧ Q
--                                                                        ----------------- ax         ------------------------------------------------ ¬e
--                                                                        ¬(P ∧ Q), P, ¬Q ⊢ ¬Q         ¬(P ∧ Q), P, Q ⊢ ⊥
--                      -------------- ax         ---------------- LEM    --------------------- ∨i2    --------------------- ⊥e
--                      ¬(P ∧ Q), ¬P ⊢ ¬P         ¬(P ∧ Q), P ⊢ Q ∨ ¬Q    ¬(P ∧ Q), P, ¬Q ⊢ ¬P ∨ ¬Q    ¬(P ∧ Q), P, Q ⊢ ¬P ∨ ¬Q
---------------- LEM    ------------------ ∨i1    -------------------------------------------------------------------------- ∨e
-- ¬(P ∧ Q) ⊢ ¬P ∨ P    ¬(P ∧ Q), ¬P ⊢ ¬P ∨ ¬Q    ¬(P ∧ Q), P ⊢ ¬P ∨ ¬Q
-------------------------------------------------------------------- ∨e
-- ¬(P ∧ Q) ⊢ ¬P ∨ ¬Q
---------------------- ⇒i
-- ⊢ ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)


-- de Morgan (vuelta): (¬P ∨ ¬Q) ⇒ ¬(P ∧ Q)

--                                                                                  -------------------------- ax
--                                                                                  ¬P ∨ ¬Q, P ∧ Q, ¬Q, P ⊢ P ∧ Q
--                                                                                  ------------------------- ∧e2    ----------------------- ax
--                                                                                  ¬P ∨ ¬Q, P ∧ Q, ¬Q, P ⊢ Q        ¬P ∨ ¬Q, P ∧ Q, ¬Q, P ⊢ ¬Q
--                                                                                  -------------------------------------------------------- ¬e
--                                                                                  ¬P ∨ ¬Q, P ∧ Q, ¬Q, P ⊢ ⊥
---------------------- ax    --------------------- ax    -------------------- ax    ---------------------- ¬i
-- ¬P ∨ ¬Q, P ∧ Q ⊢ P ∧ Q    ¬P ∨ ¬Q, P ∧ Q ⊢ ¬P ∨ ¬Q    ¬P ∨ ¬Q, P ∧ Q, ¬P ⊢ ¬P    ¬P ∨ ¬Q, P ∧ Q, ¬Q ⊢ ¬P
--------------------- ∧e1    --------------------------------------------------------------------------- ∨e
-- ¬P ∨ ¬Q, P ∧ Q ⊢ P        ¬P ∨ ¬Q, P ∧ Q ⊢ ¬P
--------------------------------------------- ¬e
-- ¬P ∨ ¬Q, P ∧ Q ⊢ ⊥
------------------ ¬i
-- ¬P ∨ ¬Q ⊢ ¬(P ∧ Q)
---------------------- ⇒i
-- ⊢ (¬P ∨ ¬Q) ⇒ ¬(P ∧ Q)


--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44


--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55

