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