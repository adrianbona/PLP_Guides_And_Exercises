module Guide_5 (
) where

-- Ejercicio Extra 1

-- Dar interpretación CBN para: (λx. x) ((λy. if y then ff else tt) tt)

--                                                                                         -------- TT
--                                                                                         ø ⊢ tt ↪ tt
--                                                                                         --------------------    ------------------ FF
--                                                                                         y = ⟨tt, ø⟩ ⊢ y ↪ tt    y = ⟨tt, ø⟩ ⊢ ff ↪ ff
--                          ------------------------------------------------------- ABS    ----------------------------------------- IF
--                          ø ⊢ λy. if y then ff else tt ↪ ⟨y, if y then ff else tt, ø⟩    y = ⟨tt, ø⟩ ⊢ if y then ff else tt ↪ ff
--                          --------------------------------------------------------------------------------------------------- MN
--                          ø ⊢ (λy. if y then ff else tt) tt ↪ ff
-------------------- ABS    -------------------------------------------- MN
-- ø ⊢ λx. x ↪ ⟨x, x, ø⟩    x = ⟨(λy. if y then ff else tt) tt, ø⟩ ⊢ x ↪ ff
------------------------------------------------------------------------ MN
-- ø ⊢ (λx. x) ((λy. if y then ff else tt) tt) ↪ ff


-- Dar interpretación CBV para: (λx. x) ((λy. if y then ff else tt) tt)

--                                                                                                                            ------------ TT    ------------- FF
--                                                                                                                            y = tt ⊢ y ↪ tt    y = tt ⊢ ff ↪ ff
--                                              -------- TT    ------------------------------------------------------- ABS    -------------------------------- IF
--                                              ø ⊢ tt ↪ tt    ø ⊢ λy. if y then ff else tt ↪ ⟨y, if y then ff else tt, ø⟩    y = tt ⊢ if y then ff else tt ↪ ff
-------------------- ABS    ------------- FF    ------------------------------------------------------------------------------------------------------------- MN
-- ø ⊢ λx. x ↪ ⟨x, x, ø⟩    x = ff ⊢ x ↪ ff     ø ⊢ (λy. if y then ff else tt) tt ↪ ff
----------------------------------------------------------------------------------- MN
-- ø ⊢ (λx. x) ((λy. if y then ff else tt) tt) ↪ ff


-- Ejercicio 1

-- Evaluar en el intérprete CBN

-- i. (λx.x) zero

--                         ----------- Z
--                         ⊢ zero ↪ zero
------------------- ABS    ---------------------- Z
-- ø ⊢ λx.x ↪ ⟨x, x, ø⟩    x = ⟨zero, ø⟩ ⊢ x ↪ zero
------------------------------------------------ MN
-- ø ⊢ (λx.x) zero ↪ zero


-- ii. (λx.λx.x) 2 3

------------------------- ABS    ------------------------ SUCC    -- SUCC
-- ø ⊢ λx.λx.x ↪ ⟨x, λx.x, ø⟩    x = ⟨2, ø⟩ ⊢ λx.x ↪ ⟨x, x, ø⟩    ⊢ 3 ↪ 3
----------------------------------------------------------- MN    ------------- SUCC
-- ø ⊢ (λx.λx.x) 2 ↪ ⟨x, x, ø⟩                                    x = ⟨3, ø⟩ ⊢ x ↪ 3
--------------------------------------------------------------------------------- MN
-- ø ⊢ (λx.λx.x) 2 3 ↪ 3


-- iii. (λx.λy.(λx.if isZero(x) then y else x) x) 5 4

------------------------------------------------------------------------------- ?    -------------------------------------------- ?
-- ø ⊢ λy.(λx.if isZero(x) then y else x) ↪ ⟨y, λx.if isZero(x) then y else x, ø⟩    y = ⟨x, ø⟩ ⊢ λx.if isZero(x) then y else x ↪ V
-------------------------------------------------------------------------------------------------------------------------------- MN    ------------------ ?
-- ø ⊢ λx.λy.(λx.if isZero(x) then y else x) x ↪ ⟨x, M'', ø⟩                                                                           x = ⟨5, ø⟩ ⊢ M'' ↪ V
------------------------------------------------------------ MN    ----------------- ?
-- ø ⊢ (λx.λy.(λx.if isZero(x) then y else x) x) 5 ↪ ⟨x, M', ø⟩    x = ⟨4, ø⟩ ⊢ M' ↪ V
----------------------------------------------------------------------------------- MN
-- ø ⊢ (λx.λy.(λx.if isZero(x) then y else x) x) 5 4 ↪ V


-- iv. (λx.(λf.(λy.f 6) 5) (λy.if isZero(y) then x else y)) 4

--------------------------------------------- ABS    -------------------------------------------------------- ?
-- ø ⊢ λx.(λf.(λy.f 6) 5) ↪ ⟨x, λf.(λy.f 6) 5, ø⟩    x = ⟨λy.if isZero(y) then x else y, ø⟩ ⊢ λf.(λy.f 6) 5 ↪ V
-------------------------------------------------------------------------------------------------------------MN    ----------------- ?
-- ø ⊢ λx.(λf.(λy.f 6) 5) (λy.if isZero(y) then x else y) ↪ ⟨x, M', ø⟩                                             x = ⟨4, ø⟩ ⊢ M' ↪ V
----------------------------------------------------------------------------------------------------------------------------------- MN
-- ø ⊢ (λx.(λf.(λy.f 6) 5) (λy.if isZero(y) then x else y)) 4 ↪ V












