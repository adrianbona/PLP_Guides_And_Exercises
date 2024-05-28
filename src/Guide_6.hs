module Guide_6 (
) where

-- Ejercicio 1

-- Dados F = {d, f, g} (símbolos de función), donde: d tiene aridad 0, f aridad 2 y g aridad 3

-- i. g(d, d)

-- No es correcto, ya que g tiene aridad 3 y se le están pasando 2 argumentos.


-- ii. f(X, g(Y, Z), d)

-- No es correcto, ya que f tiene aridad 2 y se le están pasando 3 argumentos.


-- iii. g(X, f(d, Z), d)

-- Las aridades son correctas pero se están mezclando símbolos de función con variables.


-- iv. g(X, h(Y, Z), d)

-- No es correcto, ya que h no pertenece al conjunto de funciones F.


-- v. f(f(g(d, X), f(g(d, X), Y, g(Y, d)), g(d, d)), g(f(d, d, X), d), Z)

-- No es correcto, ya que f tiene aridad 2 y se le están pasando 3 argumentos y g tiene aridad 3 y se le están pasando 2 argumentos.































