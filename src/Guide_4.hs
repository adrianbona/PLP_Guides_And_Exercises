module Guide_4 (
) where

-- Ejercicio 6

-- a) ⊢ if true then zero else succ(zero) : Nat

--                                  ---- ax-zero
--                                  ⊢ zero : Nat
-------- ax-true    ---- ax-zero    ------------- succ
-- ⊢ true : Bool    ⊢ zero : Nat    ⊢ succ(zero) : Nat
--------------------------------------------------- if
-- ⊢ if true then zero else succ(zero) : Nat


-- b) x : Nat, y : Bool ⊢ if true then false else (λz : Bool. z) true : Bool

--                                                                        --------------------------------- ax-v
--                                                                        x : Nat, y : Bool, z : Bool ⊢ z : Bool
--                                                                        --------------------------------------------- ⇒i    ----------------------- ax-true
--                                                                        x : Nat, y : Bool ⊢ (λz : Bool. z) : Bool ⇒ Bool    x : Nat, y : Bool ⊢ true : Bool
-------------------------- ax-true    ----------------------- ax-false    -------------------------------------------------------------------------------- ⇒e
-- x : Nat, y : Bool ⊢ true : Bool    x : Nat, y : Bool ⊢ false : Bool    x : Nat, y : Bool ⊢ (λz : Bool. z) true : Bool
--------------------------------------------------------------------------------------------------------------------- if
-- x : Nat, y : Bool ⊢ if true then false else (λz : Bool. z) true : Bool


-- c) ⊢ if λx: Bool. x then zero else succ(zero) : Nat

--                                         ---- ax-zero
--                                         ⊢ zero : Nat
------------------- XXX    ---- ax-zero    ------------- succ
-- ⊢ λx: Bool. x : Bool    ⊢ zero : Nat    ⊢ succ(zero) : Nat
---------------------------------------------------------- if
-- ⊢ if λx: Bool. x then zero else succ(zero) : Nat


-- d) x : Bool → Nat, y : Bool ⊢ x y : Nat

--------------------------------------- ax-v    ------------------------------ ax-v
-- x : Bool → Nat, y : Bool ⊢ x : Bool → Nat    x : Bool → Nat, y : Bool ⊢ y : Bool
-------------------------------------------------------------------------------- ⇒e
-- x : Bool → Nat, y : Bool ⊢ x y : Nat


-- Ejercicio 7

-- TIPADO VÁLIDO EN REGLA MODIFICADA

--------------- ax-v
-- x : Nat ⊢ x : Nat
------------- succ
-- ⊢ succ(x) : Nat
---------------------------------- ⇒i2
-- ⊢ (λx : Bool. succ(x)) : Bool ⇒ Nat


-- TIPADO INVÁLIDO EN REGLA ORIGINAL

---------------- ax-v
-- x : Bool ⊢ x : Nat
---------------------- succ
-- x : Bool ⊢ succ(x) : Nat
----------------------------------- ⇒i
-- ⊢ (λx : Bool. succ(x)) : Bool ⇒ Nat


-- Ejercicio 8

-- Determinar qué tipo representa σ en cada uno de los siguientes juicios de tipado

-- a) ⊢ succ(zero) : σ

-- σ representa el tipo Nat

----- ax-zero
-- ⊢ zero : σ
-------------- succ
-- ⊢ succ(zero) : σ


-- b) ⊢ isZero(succ(zero)) : σ

-- σ representa el tipo Bool

------- ax-zero
-- ⊢ zero : Nat
---------------- succ
-- ⊢ succ(zero) : Nat
-------------------- isZero
-- ⊢ isZero(succ(zero)) : σ


-- c) ⊢ if (if true then false else false) then zero else succ(zero) : σ

-- σ representa el tipo Nat

-------- ax-true    ----- ax-false    ----- ax-false                  -- ax-zero
-- ⊢ true : Bool    ⊢ false : Bool    ⊢ false : Bool                  ⊢ zero : σ
------------------------------------------------- if    -- ax-zero    ----------- succ
-- ⊢ if true then false else false : Bool               ⊢ zero : σ    ⊢ succ(zero) : σ
----------------------------------------------------------------------------------- if
-- ⊢ if (if true then false else false) then zero else succ(zero) : σ


-- Ejercicio 10

-- a) x: σ ⊢ isZero(succ(x)) : τ

-- σ representa el tipo Nat, τ representa el tipo Bool

------------ ax-v
-- x: σ ⊢ x : Nat
---------------- succ
-- x: σ ⊢ succ(x) : Nat
---------------------- isZero
-- x: σ ⊢ isZero(succ(x)) : τ


-- b) ⊢ (λx: σ. x)(λy : Bool. zero) : σ

-- ρ representa el tipo Bool, π representa el tipo Nat, σ representa el tipo Bool ⇒ Nat

-- τ representa el tipo Bool ⇒ Nat
-- σ representa varios tipos, contradicción

--------------- ax-v        ------------- ax-zero
-- x : σ ⊢ x : τ ⇒ σ        y : Bool ⊢ zero : Nat
------------------------    -----------------------
-- ⊢ (λx : σ. x) : τ ⇒ σ    ⊢ (λy : Bool. zero) : τ
------------------------------------------------ ⇒e
-- ⊢ (λx : σ. x)(λy : Bool. zero) : σ


-- c) y : τ ⊢ if (λx: σ. x) then y else succ(zero) : σ

-- τ representa el tipo Nat
-- σ representa el tipo Bool y Nat, contradicción

-------------------- ax-v                      ---------- ax-zero
-- y : τ, x: σ ⊢ x : Bool                      y : τ ⊢ zero : Nat
----------------------- ⇒i    -------- ax-v    ----------------- succ
-- y : τ ⊢ λx: σ. x : Bool    y : τ ⊢ y : σ    y : τ ⊢ succ(zero) : σ
------------------------------------------------------------------ if
-- y : τ ⊢ if (λx: σ. x) then y else succ(zero) : σ


-- d) x: σ ⊢ x y : τ

-- σ representa el tipo ρ ⇒ τ

-------------- ax-v    ------- ax-v
-- x: σ ⊢ x : ρ ⇒ τ    x: σ ⊢ y : ρ
-------------------------------- ⇒e
-- x: σ ⊢ x y : τ


-- e) x: σ, y : τ ⊢ x y : τ

-- σ representa el tipo τ ⇒ τ, τ puede ser cualquier tipo

--------------------- ax-v    -------------- ax-v
-- x: σ, y : τ ⊢ x : ρ ⇒ τ    x: σ, y : τ ⊢ y : ρ
---------------------------------------------- ⇒e
-- x: σ, y : τ ⊢ x y : τ


-- f) x: σ ⊢ x true : τ

-- σ representa el tipo Bool ⇒ τ

----------------- ax-v    ---------- ax-true
-- x: σ ⊢ x : Bool ⇒ τ    x: σ ⊢ true : Bool
----------------------------------------- ⇒e
-- x: σ ⊢ x true : τ


-- g) x: σ ⊢ x true : σ

-- σ representa el tipo Bool ⇒ σ (referencia circular no tipa)

----------------- ax-v    ---------- ax-true
-- x: σ ⊢ x : Bool ⇒ σ    x: σ ⊢ true : Bool
----------------------------------------- ⇒e
-- x: σ ⊢ x true : σ


-- h) x: σ ⊢ x x : τ

-- σ representa el tipo σ ⇒ τ (referencia circular no tipa)

-------------- ax-v    ------- ax-v
-- x: σ ⊢ x : σ ⇒ τ    x: σ ⊢ x : σ
-------------------------------- ⇒e
-- x: σ ⊢ x x : τ


-- Ejercicio 12

-- Demostrar que si valen Γ, x : σ ⊢ M : τ y Γ ⊢ N : σ entonces vale Γ ⊢ M{x := N} : τ.

-- El término M reduce a tipo τ y sabemos que la variable x reduce a tipo σ
-- Γ, x : σ ⊢ M : τ


-- El término N reduce a tipo σ
-- Γ ⊢ N : σ

-- Queremos ver que el término M con la variable x sustituída por N sigue reduciendo a tipo τ
-- Γ ⊢ M{x := N} : τ




















