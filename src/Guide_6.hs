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


-- Ejercicio 2

-- Sean c una constante, f un símbolo de función de aridad 1 y S y B, dos símbolos de predicado binarios.

-- i. S(c, X)

-- Es una fórmula atómica, un predicado binario con dos términos.


-- ii. B(c, f(c))

-- Es una fórmula atómica, un predicado binario con dos términos.


-- iii. f(c)

-- No es una fórmula ya que la gramática no lo permite.


-- iv. B(B(c, X), Y)

-- No es una fórmula ya que la gramática no permite un predicado binario con una variable y un predicado binario.


-- v. S(B(c), Z)

-- No es una fórmula ya que la gramática no permite un predicado binario con un predicado binario y una variable.


-- vi. B(X,Y) ⇒ ∃Z . S(Z,Y)

-- Es una fórmula formada por una implicación cuyo antecedente es un predicado binario y cuyo consecuente es una cuantificación existencial.


-- vii. S(X,Y) ⇒ S(Y,f(f(X)))

-- Es una fórmula formada por una implicación cuyo antecedente es un predicado binario y cuyo consecuente es también un predicado binario.

-- viii. B(X,Y) ⇒ f(X)

-- No es una fórmula ya que la gramática no permite una implicación cuyo consecuente sea un símbolo de función.


-- ix. S(X,f(Y)) ∧ B(X,Y)

-- Es una fórmula formada por una conjunción cuyos términos son dos predicados binarios.


-- x. ∀X . B(X, f(X))

-- Es una fórmula formada por una cuantificación universal que consta de un predicado binario.


-- xi. ∃X . B(Y,X(c))

-- Es una fórmula formada por una cuantificación existencial que consta de un predicado binario.
-- Sin embargo X es una variable y no una función con aridad.


-- Ejercicio 3

-- Sea σ = ∃X . P(Y, Z) ∧ ∀Y . ¬Q(Y, X) ∨ P(Y, Z)
-- Reescribo como σ = ∃X' . P(Y, Z) ∧ ∀Y' . ¬Q(Y', X) ∨ P(Y, Z)

-- i. Identificar todas las variables libres y ligadas

-- Variables libres: Y, Z, X, Z, variables ligadas: X', Y'.


-- ii. Calcular:

-- σ[X := W]

-- ∃X' . P(Y, Z) ∧ ∀Y' . ¬Q(Y', X) ∨ P(Y, Z)
-- ∃X' . P(Y, Z) ∧ ∀Y' . ¬Q(Y', W) ∨ P(Y, Z)


-- σ[Y := W]

-- ∃X' . P(Y, Z) ∧ ∀Y' . ¬Q(Y', X) ∨ P(Y, Z)
-- ∃X' . P(W, Z) ∧ ∀Y' . ¬Q(Y', X) ∨ P(W, Z)


-- σ[Y := f(X)]

-- ∃X' . P(Y, Z) ∧ ∀Y' . ¬Q(Y', X) ∨ P(Y, Z)
-- ∃X' . P(f(X), Z) ∧ ∀Y' . ¬Q(Y', X) ∨ P(f(X), Z)

-- σ[Z := g(Y, Z)]

-- ∃X' . P(Y, Z) ∧ ∀Y' . ¬Q(Y', X) ∨ P(Y, Z)
-- ∃X' . P(Y, g(Y, Z)) ∧ ∀Y' . ¬Q(Y', X) ∨ P(Y, g(Y, Z))


-- Ejericio 4

-- Sea σ = ¬∀X . (∃Y . P(X, Y, Z)) ∧ ∀Z . P(X, Y, Z)
-- Reescribo como σ = ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(X, Y, Z')

-- i. Identificar todas las variables libres y ligadas

-- Variables libres: Z, X, Y, variables ligadas: X', Y', Z'.


-- ii. Calcular

-- σ[X := t] con t = g(f(g(Y,Y)),Y)

-- ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(X, Y, Z')
-- ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(t, Y, Z')
-- ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(g(f(g(Y,Y)),Y), Y, Z')


-- σ[Y := t] con t = g(f(g(Y,Y)),Y)

-- ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(X, Y, Z')
-- ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(X, t, Z')
-- ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(X, g(f(g(Y,Y)),Y), Z')


-- σ[Z := t] con t = g(f(g(Y,Y)),Y)

-- ¬∀X' . (∃Y' . P(X', Y', Z)) ∧ ∀Z' . P(X, Y, Z')
-- ¬∀X' . (∃Y' . P(X', Y', t)) ∧ ∀Z' . P(X, Y, Z')
-- ¬∀X' . (∃Y' . P(X', Y', g(f(g(Y,Y)),Y))) ∧ ∀Z' . P(X, Y, Z')


-- Ejercicio 5

-- Para unir las expresiones que unifican entre si pruebo todas las combinaciones que partan de los mismos predicados.
-- Las agrupo y pruebo cada unificación si alcanzo un conjunto vacío de términos o un fallo.

-- P(f(X)) | P(a) | P(Y)
-- P(X) | P(f(a)) | P(g(Z))

-- i) P(f(X)) y P(X)

-- { f(X) ≟ X } Swap ⇒ { X ≟ f(X) } OccursCheck ⇒ FALLA

-- ii) P(f(X)) y P(f(a))

-- { f(X) ≟ f(a) } Decompose ⇒ { X ≟ a } Elim { X := a } ⇒ ø

-- iii) P(f(X)) y P(g(Z))

-- { f(X) ≟ g(Z) } Clash ⇒ FALLA

-- iv) P(a) y P(X)

-- { a ≟ X } Elim { X := a } ⇒ ø

-- v) P(a) y P(f(a))

-- { a ≟ f(a) } OccursCheck ⇒ FALLA

-- vi) P(a) y P(g(Z))

-- { a ≟ g(Z) } Elim { g(Z) := a } ⇒ ø

-- vii) P(Y) y P(X)

-- { Y ≟ X } Elim { Y := X } ⇒ ø

-- viii) P(Y) y P(f(a))

-- { Y ≟ f(a) } Elim { Y := f(a) } ⇒ ø

-- ix) P(Y) y P(g(Z))

-- { Y ≟ g(Z) } Elim { Y := g(Z) } ⇒ ø


-- Q(X,f(Y)) | Q(X,f(Z)) | Q(X,f(a))
-- Q(f(Y),X) | Q(f(Y),f(X)) | Q(f(Y),Y)


-- X | f(X)
-- f(f(c)) | f(g(Y))









