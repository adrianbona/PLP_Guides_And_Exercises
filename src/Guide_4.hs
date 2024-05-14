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


-- d) x : Bool ⇒ Nat, y : Bool ⊢ x y : Nat

--------------------------------------- ax-v    ------------------------------ ax-v
-- x : Bool ⇒ Nat, y : Bool ⊢ x : Bool ⇒ Nat    x : Bool ⇒ Nat, y : Bool ⊢ y : Bool
-------------------------------------------------------------------------------- ⇒e
-- x : Bool ⇒ Nat, y : Bool ⊢ x y : Nat


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


-- Ejercicio 9

-- a) σ ⇒ τ ⇒ σ

-- La función const, que toma dos argumentos y devuelve el primero
-- M = λx . λy . x

---------------- ax-v
-- x: σ, y: τ ⊢ x : σ
----------------------- ⇒i
-- x: σ ⊢ λy: τ. x : τ ⇒ σ
----------------------------- ⇒i
-- ⊢ λx: σ. λy: τ. x : σ ⇒ τ ⇒ σ


-- b) (σ ⇒ τ ⇒ ρ) ⇒ (σ ⇒ τ) ⇒ σ ⇒ ρ

-- Combinador S
-- M = λf . λg . λx . f x (g x)

--------------------------------------------- ax-v    ---------------------------------- ax-v    -------------------------------------- ax-v    ---------------------------------- ax-v
-- f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ f : σ ⇒ τ ⇒ ρ    f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ x : σ    f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ g : σ ⇒ τ    f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ x : σ
------------------------------------------------------------------------------------------ ⇒e    ----------------------------------------------------------------------------------- ⇒e
-- f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ f x : τ ⇒ ρ                                                 f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ g x : τ
--------------------------------------------------------------------------------------------------------------------------------------- ⇒e
-- f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ (f x) (g x) : ρ
----------------------------------------------------- ⇒i
-- f : σ ⇒ τ ⇒ ρ, g : σ ⇒ τ ⊢ λx : σ . f x (g x) : σ ⇒ ρ
--------------------------------------------------------------------- ⇒i
-- f : (σ ⇒ τ ⇒ ρ) ⊢ λg : (σ ⇒ τ) . λx : σ . f x (g x) : (σ ⇒ τ) ⇒ σ ⇒ ρ
--------------------------------------------------------------------- ⇒i
-- ⊢ λf : (σ ⇒ τ ⇒ ρ) . λg : (σ ⇒ τ) . λx : σ . f x (g x)


-- c) (σ ⇒ τ ⇒ ρ) ⇒ τ ⇒ σ ⇒ ρ

-- Flip, que toma una función de dos argumentos y devuelve una función que toma los argumentos en orden inverso
-- M = λf . λy . λx . f x y

----------------------------------------- ax-v    ------------------------------ ax-v
-- f : σ ⇒ τ ⇒ ρ, y : τ, x : σ ⊢ f : σ ⇒ τ ⇒ ρ    f : σ ⇒ τ ⇒ ρ, y : τ, x : σ ⊢ x : σ
---------------------------------------------------------------------------------- ⇒e    ------------------------------ ax-v
-- f : σ ⇒ τ ⇒ ρ, y : τ, x : σ ⊢ f x : τ ⇒ ρ                                             f : σ ⇒ τ ⇒ ρ, y : τ, x : σ ⊢ y : τ
------------------------------------------------------------------------------------------------------------------------- ⇒e
-- f : σ ⇒ τ ⇒ ρ, y : τ, x : σ ⊢ f x y : ρ
--------------------------------------------- ⇒i
-- f : σ ⇒ τ ⇒ ρ, y : τ ⊢ λx : σ . f x y : σ ⇒ ρ
--------------------------------------------------- ⇒i
-- f : σ ⇒ τ ⇒ ρ ⊢ λy : τ . λx : σ . f x y : τ ⇒ σ ⇒ ρ
---------------------------------------------------------------------- ⇒i
-- ⊢ λf : (σ ⇒ τ ⇒ ρ) . λy : τ . λx : σ . f x y : (σ ⇒ τ ⇒ ρ) ⇒ τ ⇒ σ ⇒ ρ


-- d) (τ ⇒ ρ) ⇒ (σ ⇒ τ) ⇒ σ ⇒ ρ

-- Composición de funciones, que toma dos funciones y devuelve una función que es la composición de ambas
-- M = λf . λg . λx . f (g x)


--                                            ---------------------------------- ax-v    ------------------------------ ax-v
--                                            f : τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ g : σ ⇒ τ    f : τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ x : σ
------------------------------------- ax-v    --------------------------------------------------------------------------- ⇒e
-- f : τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ f : τ ⇒ ρ    f : τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ g x : τ
-------------------------------------------------------------------------------- ⇒e
-- f : τ ⇒ ρ, g : σ ⇒ τ, x : σ ⊢ f(g x) : ρ
---------------------------------------------- ⇒i
-- f : τ ⇒ ρ, g : σ ⇒ τ ⊢ λx : σ . f(g x) : σ ⇒ ρ
------------------------------------------------------------ ⇒i
-- f : τ ⇒ ρ ⊢ λg : (σ ⇒ τ) . λx : σ . f(g x) : (σ ⇒ τ) ⇒ σ ⇒ ρ
--------------------------------------------------------------------------- ⇒i
-- ⊢ λf : (τ ⇒ ρ) . λg : (σ ⇒ τ) . λx : σ . f(g x) : (τ ⇒ ρ) ⇒ (σ ⇒ τ) ⇒ σ ⇒ ρ


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


-- Ejercicio 13

-- a) (λy : σ. x (λx : τ. x)){x := (λy : ρ. x y)}

-- (λy : σ. x (λx : τ. x)){x := (λy : ρ. x y)}
-- (λy : σ. x (λz : τ. z)){x := (λw : ρ. v w)}
-- λu : σ. (x (λz : τ. z)){u := y}{x := (λw : ρ. v w)}
-- λu : σ. x{u := y}{x := (λw : ρ. v w)}(λz : τ. z){u := y}{x := (λw : ρ. v w)}
-- λu : σ. x{x := (λw : ρ. v w)}(λz : τ. z){u := y}{x := (λw : ρ. v w)}
-- λu : σ. (λw : ρ. v w)(λz : τ. z){x := (λw : ρ. v w)}
-- λu : σ. (λw : ρ. v w)(λz : τ. z)


-- b) (y (λv : σ. x v)){x := (λy : τ. v y)}

-- (y (λv : σ. x v)){x := (λy : τ. v y)}
-- (y (λz : σ. x z)){x := (λy : τ. v y)}
-- y{x := (λy : τ. v y)}(λz : σ. x z){x := (λy : τ. v y)}
-- y(λz : σ. x z){x := (λy : τ. v y)}
-- y(λu : σ. (x u){u := z}{x := (λy : τ. v y)})
-- y(λu : σ. x{u := z}{x := (λy : τ. v y)}u{u := z}{x := (λy : τ. v y)})
-- y(λu : σ. x{x := (λy : τ. v y)}u{u := z})
-- y(λu : σ. (λy : τ. v y)z)


-- Ejercicio 16

-- Un programa no puede contener variables libres

-- i) (λx : Bool. x) true

-- (λx : Bool. x) true
-- x{x := true}
-- true


-- ii) λx : Nat. pred(succ(x))

-- λx : Nat. pred(succ(x))
-- pred(succ(x)){x := x}
-- x{x := x}
-- x

-- NO ES UN PROGRAMA, CONTIENE VARIABLES LIBRES


-- iii) λx : Nat. pred(succ(y))

-- λx : Nat. pred(succ(y))
-- pred(succ(y)){x := x}
-- y{x := x}
-- y

-- NO ES UN PROGRAMA, CONTIENE VARIABLES LIBRES


-- iv) (λx : Bool. pred(isZero(x))) true

-- (λx : Bool. pred(isZero(x))) true
-- pred(isZero(x)){x := true}

-- NO REDUCE POR TIPADO


-- v) (λf : Nat ⇒ Bool. f zero) (λx : Nat. isZero(x))

-- (λf : Nat ⇒ Bool. f zero) (λx : Nat. isZero(x))
-- (f zero){f := (λx : Nat. isZero(x))}
-- f{f := (λx : Nat. isZero(x))} zero{f := (λx : Nat. isZero(x))}
-- (λx : Nat. isZero(x)) zero{f := (λx : Nat. isZero(x))}
-- (λx : Nat. isZero(x)) zero
-- isZero(x){x := zero}
-- isZero(zero)
-- true


-- vi) (λf : Nat ⇒ Bool. x) (λx : Nat. isZero(x))

-- (λf : Nat ⇒ Bool. x) (λx : Nat. isZero(x))
-- x{f := (λx : Nat. isZero(x))}
-- x

-- NO ES UN PROGRAMA, CONTIENE VARIABLES LIBRES


-- vii) (λf : Nat ⇒ Bool. f pred(zero)) (λx : Nat. isZero(x))

-- (λf : Nat ⇒ Bool. f pred(zero)) (λx : Nat. isZero(x))
-- (f pred(zero)){f := (λx : Nat. isZero(x))}
-- f{f := (λx : Nat. isZero(x))} pred(zero){f := (λx : Nat. isZero(x))}
-- (λx : Nat. isZero(x)) pred(zero){f := (λx : Nat. isZero(x))}
-- (λx : Nat. isZero(x)) pred(zero)
-- isZero(x){x := pred(zero)}
-- isZero(pred(zero))

-- NO REDUCE


-- viii) µy : Nat. succ(y)

-- µy : Nat. succ(y)
-- succ(y){y := µy : Nat. succ(y)}
-- succ(µy : Nat. succ(y))

-- NO REDUCE, CICLA INFINITAMENTE


-- Ejercicio 20

-- Extensión de cálculo-lambda tipado con pares:
-- σ ::= . . . | σ × σ
-- M ::= . . . | ⟨M, M⟩ | π1(M) | π2(M)


-- a) Definir reglas de tipado para los nuevos constructores de términos

------- ax-v    ---- ax-v
-- Γ ⊢ M : σ    Γ ⊢ M : τ
------------------ ax-par
-- Γ ⊢ ⟨M, N⟩ : σ × τ

----------- ax-v
-- Γ ⊢ M : σ × τ
------- ax-par-1
-- Γ ⊢ π1(M) : σ

----------- ax-v
-- Γ ⊢ M : σ × τ
------- ax-par-2
-- Γ ⊢ π2(M) : τ


-- b) Usando las reglas de tipado anteriores, exhibir habitantes de los siguientes tipos:

-- i) Constructor de pares: σ ⇒ τ ⇒ (σ × τ)

-- Función que dado un par de valores devuelve el par

-- M = λx : σ . λy : τ . ⟨x, y⟩ : σ × τ

------------------ ax-v    --------------- ax-v
-- x : σ, y : τ ⊢ x : σ    x : σ, y : τ ⊢ y : τ
---------------------------------------- ax-par
-- x : σ, y : τ ⊢ ⟨x, y⟩ : σ × τ
------------------------------- ⇒i
-- x : σ ⊢ λy : τ . ⟨x, y⟩ : σ × τ
---------------------------------- ⇒i
-- ⊢ λx : σ . λy : τ . ⟨x, y⟩ : σ × τ


-- ii) Proyecciones: (σ × τ) ⇒ σ y (σ × τ) ⇒ τ

--1- M = λx . π1(x)

------------------- ax-v
-- x : σ × τ ⊢ x : σ × τ
--------------- ax-par-1
-- x : σ × τ ⊢ π1(x) : σ
------------------------------------ ⇒i
-- ⊢ λx : (σ × τ) . π1(x) : (σ × τ) ⇒ σ


--2- M = λx : (σ × τ) . π2(x) : (σ × τ) ⇒ τ

------------------- ax-v
-- x : σ × τ ⊢ x : σ × τ
--------------- ax-par-2
-- x : σ × τ ⊢ π2(x) : τ
------------------------------------ ⇒i
-- ⊢ λx : (σ × τ) . π2(x) : (σ × τ) ⇒ τ

-- iii) Conmutatividad: (σ × τ) ⇒ (τ × σ)

-- M = λx . ⟨π2(x), π1(x)⟩

--------------------- ax-v    ------------------ ax-v
-- x : (σ × τ) ⊢ x : σ × τ    x : (σ × τ) ⊢ x : σ × τ
----------------- ax-par-2    -------------- ax-par-1
-- x : (σ × τ) ⊢ π2(x) : τ    x : (σ × τ) ⊢ π1(x) : σ
---------------------------------------------- ax-par
-- x : (σ × τ) ⊢ ⟨π2(x), π1(x)⟩ : (τ × σ)
----------------------------------------- ⇒i
-- ⊢ λx : (σ × τ) . ⟨π2(x), π1(x)⟩ : (τ × σ)


-- iv) Asociatividad: ((σ × τ) × ρ) ⇒ (σ × (τ × ρ)) y (σ × (τ × ρ)) ⇒ ((σ × τ) × ρ)

--1- M = λx . ⟨π1(π1(x)), ⟨π2(π1(x)), π2(x)⟩⟩

--2- M = λx . ⟨⟨π1(x), π1(π2(x))⟩, π2(π2(x))⟩


-- v) Currificación: ((σ × τ) ⇒ ρ) ⇒ (σ ⇒ τ ⇒ ρ) y (σ ⇒ τ ⇒ ρ) ⇒ ((σ × τ) ⇒ ρ)

--1- M = λf : ((σ × τ) ⇒ ρ) . λx : σ . λy : τ . f ⟨x, y⟩ : ((σ × τ) ⇒ ρ) ⇒ (σ ⇒ τ ⇒ ρ)

--2- M = λf : (σ ⇒ τ ⇒ ρ) . λx : (σ × τ) . f π1(x) π2(x) : (σ ⇒ τ ⇒ ρ) ⇒ ((σ × τ) ⇒ ρ)


-- c) Reglas de semántica operacional

-- V ::= . . . | ⟨V, V⟩

-- π1(⟨V1, V2⟩) ⇒ V1
-- π2(⟨V1, V2⟩) ⇒ V2

-- Reglas de congruencia, si M ⇒ N entonces:

-- ⟨M, O⟩ ⇒ ⟨N, o⟩ --PL
-- ⟨V, M⟩ ⇒ ⟨V, N⟩ --PR
-- π1(M) ⇒ π1(N)   --π1
-- π2(M) ⇒ π2(N)   --π2













