module Guide_7 (
) where

-- Ejercicio 1

-- Convertir a forma normal conjuntiva y luego a forma clausal

-- i. P ⇒ P

-- P ⇒ P
-- ¬P v P
-- {¬P, P}


-- ii. (P ∧ Q) ⇒ P

-- (P ∧ Q) ⇒ P
-- ¬(P ∧ Q) v P
-- ¬P v ¬Q v P
-- {¬P, ¬Q, P}


-- iii. (P ∨ Q) ⇒ P

-- (P ∨ Q) ⇒ P
-- ¬(P ∨ Q) v P
-- (¬P ∧ ¬Q) v P
-- (¬P v P) ∧ (¬Q v P)
-- {{¬P, P}, {¬Q, P}}


-- iv. ¬(P ⇔ ¬P)

-- ¬(P ⇔ ¬P)
-- ¬((P ⇒ ¬P) ∧ (¬P ⇒ P))
-- ¬((¬P v ¬P) ∧ (¬¬P v P))
-- ¬((¬P v ¬P) ∧ (P v P))
-- ¬(¬P ∧ P)
-- P v ¬P
-- {{P, ¬P}}


-- v. ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)

-- ¬(P ∧ Q) ⇒ (¬P ∨ ¬Q)
-- ¬¬(P ∧ Q) v (¬P ∨ ¬Q)
-- (P ∧ Q) v (¬P ∨ ¬Q)
-- P v (¬P ∨ ¬Q) ∧ Q v (¬P ∨ ¬Q)
-- (P v ¬P ∨ ¬Q) ∧ (Q v ¬P ∨ ¬Q)
-- (true ∨ ¬Q) ∧ (true v ¬P)
-- true
-- {{}}


-- vi. (P ∧ Q) ∨ (P ∧ R)

-- (P ∧ Q) ∨ (P ∧ R)
-- (P ∧ (Q ∨ R))
-- P ∧ (Q ∨ R)
-- {{P}, {Q, R}}


-- vii. (P ∧ Q) ⇒ R

-- (P ∧ Q) ⇒ R
-- ¬(P ∧ Q) v R
-- ¬P ∨ ¬Q v R
-- {{¬P, ¬Q, R}}


-- viii. P ⇒ (Q ⇒ R)

-- P ⇒ (Q ⇒ R)
-- P ⇒ (¬Q ∨ R)
-- ¬P ∨ (¬Q ∨ R)
-- ¬P ∨ ¬Q ∨ R
-- {{¬P, ¬Q, R}}


-- Ejercicio 2

-- i. Indicar cuáles fórmulas son tautologías: se niega la fórmula, se convierte a forma normal conjuntiva y se obtienen las cláusulas

-- ¬(P ⇒ P)
-- ¬(¬P ∨ P)
-- ¬¬P ∧ ¬P
-- P ∧ ¬P

-- {{P}, {¬P}}
-- {{P}, {¬P}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que es una tautología


-- ii. ¬((P ∧ Q) ⇒ P)

-- ¬((P ∧ Q) ⇒ P)
-- ¬(¬(P ∧ Q) ∨ P)
-- ¬¬(P ∧ Q) ∧ ¬P
-- P ∧ Q ∧ ¬P

-- {{P}, {Q}, {¬P}}
-- {{P}, {Q}, {¬P}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que es una tautología


-- iii. ¬((P ∨ Q) ⇒ P)

-- ¬((P ∨ Q) ⇒ P)
-- ¬(¬(P ∨ Q) ∨ P)
-- ¬¬(P ∨ Q) ∧ ¬P
-- (P ∨ Q) ∧ ¬P

-- {{P, Q}, {¬P}}
-- {{P, Q}, {¬P}, {Q}}

-- La resolución de la fórmula es satisfacible, por lo que no es una tautología


-- iv. ¬¬(P ⇔ ¬P)

-- ¬¬(P ⇔ ¬P)
-- P ⇔ ¬P
-- (P ⇒ ¬P) ∧ (¬P ⇒ P)
-- (¬P ∨ ¬P) ∧ (¬¬P ∨ P)
-- ¬P ∧ P

-- {{¬P}, {P}}
-- {{¬P}, {P}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que es una tautología


-- v. ¬(¬(P ∧ Q) ⇒ (¬P ∨ ¬Q))

-- ¬(¬(P ∧ Q) ⇒ (¬P ∨ ¬Q))
-- ¬(¬¬(P ∧ Q) ∨ (¬P ∨ ¬Q))
-- ¬(P ∧ Q) ∧ ¬(¬P ∨ ¬Q)
-- (¬P ∨ ¬Q) ∧ ¬¬(P ∧ Q)
-- (¬P ∨ ¬Q) ∧ P ∧ Q

-- {{¬P, ¬Q}, {P}, {Q}}
-- {{¬P, ¬Q}, {P}, {Q}, {¬Q}}
-- {{¬P, ¬Q}, {P}, {Q}, {¬Q}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que es una tautología


-- vi. ¬((P ∧ Q) ∨ (P ∧ R))

-- ¬((P ∧ Q) ∨ (P ∧ R))
-- ¬(P ∧ Q) ∧ ¬(P ∧ R)
-- (¬P ∨ ¬Q) ∧ (¬P ∨ ¬R)

-- {{¬P, ¬Q}, {¬P, ¬R}}

-- La resolución de la fórmula es satisfacible, por lo que no es una tautología


-- vii. ¬((P ∧ Q) ⇒ R)

-- ¬((P ∧ Q) ⇒ R)
-- ¬(¬(P ∧ Q) ∨ R)
-- ¬¬(P ∧ Q) ∧ ¬R
-- P ∧ Q ∧ ¬R

-- {{P}, {Q}, {¬R}}

-- La resolución de la fórmula es satisfacible, por lo que no es una tautología


-- viii. ¬(P ⇒ (Q ⇒ R))

-- ¬(P ⇒ (Q ⇒ R))
-- ¬(¬P ∨ (¬Q ∨ R))
-- P ∧ ¬(¬Q ∨ R)
-- P ∧ Q ∧ ¬R

-- {{P}, {Q}, {¬R}}

-- La resolución de la fórmula es satisfacible, por lo que no es una tautología


-- ii. ¿Se deduce (P ∧ Q) de (¬P ⇒ Q) ∧ (P ⇒ Q) ∧ (¬P ⇒ ¬Q)?

-- Pasaje de premisas a forma clausal: (¬P ⇒ Q) ∧ (P ⇒ Q) ∧ (¬P ⇒ ¬Q)

-- ¬P ⇒ Q
-- ¬¬P ∨ Q
-- P ∨ Q
-- {P, Q}

-- P ⇒ Q
-- ¬P ∨ Q
-- {¬P, Q}

-- ¬P ⇒ ¬Q
-- ¬¬P ∨ ¬Q
-- P ∨ ¬Q
-- {P, ¬Q}

-- Premisas en forma clausal: {{P, Q}, {¬P, Q}, {P, ¬Q}}

-- Negación de la conclusión: ¬(P ∧ Q)

-- ¬(P ∧ Q)
-- ¬P ∨ ¬Q
-- {¬P, ¬Q}

-- Resolución sobre conjunto clausal: {{P, Q}, {¬P, Q}, {P, ¬Q}, {¬P, ¬Q}}

-- {{P, Q}, {¬P, Q}, {P, ¬Q}, {¬P, ¬Q}}
-- {{P, Q}, {¬P, Q}, {P, ¬Q}, {¬P, ¬Q}, {Q}}
-- {{P, Q}, {¬P, Q}, {P, ¬Q}, {¬P, ¬Q}, {Q}, {P}}
-- {{P, Q}, {¬P, Q}, {P, ¬Q}, {¬P, ¬Q}, {Q}, {P}, {¬P}}
-- {{P, Q}, {¬P, Q}, {P, ¬Q}, {¬P, ¬Q}, {Q}, {P}, {¬P}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que se deduce (P ∧ Q) de (¬P ⇒ Q) ∧ (P ⇒ Q) ∧ (¬P ⇒ ¬Q)


-- Ejercicio 3

-- Demostrar que las siguientes son tauntologías

-- i. (P ⇒ (P ⇒ Q)) ⇒ (P ⇒ Q)

-- ¬((P ⇒ (P ⇒ Q)) ⇒ (P ⇒ Q))
-- ¬(¬(P ⇒ (P ⇒ Q)) ∨ (P ⇒ Q))
-- ¬¬(P ⇒ (P ⇒ Q)) ∧ ¬(P ⇒ Q)
-- ¬¬(P ⇒ (¬P ∨ Q)) ∧ ¬(¬P ∨ Q)
-- ¬¬(¬P ∨ (¬P ∨ Q)) ∧ ¬(¬P ∨ Q)
-- ¬(¬P ∨ (¬P ∨ Q)) ∨ (¬P ∨ Q)
-- (¬¬P ∧ ¬(¬P ∨ Q)) ∨ (¬P ∨ Q)
-- (P ∧ (P ∧ ¬Q)) ∨ (¬P ∨ Q)
-- (P ∧ P ∧ ¬Q) ∨ (¬P ∨ Q)
-- (P ∧ ¬Q) ∨ ¬P ∨ Q

-- {{P, ¬Q}, {¬P}, {Q}}
-- {{P, ¬Q}, {¬P}, {Q}, {¬Q}}
-- {{P, ¬Q}, {¬P}, {Q}, {¬Q}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que es una tautología


-- ii. (R ⇒ ¬Q) ⇒ ((R ∧ Q) ⇒ P)

-- ¬((R ⇒ ¬Q) ⇒ ((R ∧ Q) ⇒ P))
-- ¬(¬(R ⇒ ¬Q) ∨ ((R ∧ Q) ⇒ P))
-- (R ⇒ ¬Q) ∧ ¬((R ∧ Q) ⇒ P)
-- (¬R ∨ ¬Q) ∧ ¬(¬(R ∧ Q) ∨ P)
-- (¬R ∨ ¬Q) ∧ (¬¬(R ∧ Q) ∧ ¬P)
-- (¬R ∨ ¬Q) ∧ (R ∧ Q ∧ ¬P)
-- (¬R ∧ (R ∧ Q ∧ ¬P) ∨ ¬Q ∧ (R ∧ Q ∧ ¬P)
-- (¬R ∧ R ∧ Q ∧ ¬P) ∨ (¬Q ∧ R ∧ Q ∧ ¬P)
-- false ∨ false
-- false

-- {{}}

-- La resolución de la fórmula es insatisfacible, por lo que es una tautología


-- iii. ((P ⇒ Q) ⇒ (R ⇒ ¬Q)) ⇒ ¬(R ∧ Q)

-- ¬(((P ⇒ Q) ⇒ (R ⇒ ¬Q)) ⇒ ¬(R ∧ Q))
-- ¬(¬((P ⇒ Q) ⇒ (R ⇒ ¬Q)) ∨ ¬(R ∧ Q))
-- ((P ⇒ Q) ⇒ (R ⇒ ¬Q)) ∧ (R ∧ Q)
-- (¬(P ⇒ Q) ∨ (R ⇒ ¬Q)) ∧ (R ∧ Q)
-- ((¬¬P ∧ ¬Q) ∨ (¬R ∨ ¬Q)) ∧ (R ∧ Q)
-- ((P ∧ ¬Q) ∨ (¬R ∨ ¬Q)) ∧ (R ∧ Q)
-- (P ∧ ¬Q) ∧ (R ∧ Q) ∨ (¬R ∨ ¬Q) ∧ (R ∧ Q)
-- (P ∧ ¬Q) ∧ (R ∧ Q) ∨ ¬(R ∧ Q) ∧ (R ∧ Q)
-- P ∧ ¬Q ∧ R ∧ Q

-- {{P}, {¬Q}, {R}, {Q}}
-- {{P}, {¬Q}, {R}, {Q}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que es una tautología


-- Ejercicio 4

-- Premisas: P ⇒ A, ¬P ⇒ C, ¬(A ∧ C), A, ¬L y conclusión P ∧ ¬L

-- Pasaje de premisas a forma clausal: P ⇒ A, ¬P ⇒ C, ¬(A ∧ C), A, ¬L

-- P ⇒ A
-- ¬P ∨ A
-- {¬P, A}

-- ¬P ⇒ C
-- ¬¬P ∨ C
-- P ∨ C
-- {P, C}

-- ¬(A ∧ C)
-- ¬A ∨ ¬C
-- {¬A, ¬C}

-- Premisas en forma clausal: {{¬P, A}, {P, C}, {¬A, ¬C}, {A}, {¬L}}

-- Negación de la conclusión: ¬(P ∧ ¬L)

-- ¬(P ∧ ¬L)
-- ¬P ∨ ¬¬L
-- ¬P ∨ L
-- {¬P, L}

-- Resolución sobre conjunto clausal: {{¬P, A}, {P, C}, {¬A, ¬C}, {A}, {¬L}, {¬P, L}}

-- {{¬P, A}, {P, C}, {¬A, ¬C}, {A}, {¬L}, {¬P, L}}

-- Con {A} y {¬A, ¬C} obtenemos {¬C}
-- {{¬P, A}, {P, C}, {¬A, ¬C}, {A}, {¬L}, {¬P, L}, {¬C}}

-- Con {¬C} y {P, C} obtenemos {P}
-- {{¬P, A}, {P, C}, {¬A, ¬C}, {A}, {¬L}, {¬P, L}, {¬C}, {P}}

-- Con {P} y {¬P, L} obtenemos {L}
-- {{¬P, A}, {P, C}, {¬A, ¬C}, {A}, {¬L}, {¬P, L}, {¬C}, {P}, {L}}

-- Con {L} y {¬L} obtenemos {}
-- {{¬P, A}, {P, C}, {¬A, ¬C}, {A}, {¬L}, {¬P, L}, {¬C}, {P}, {L}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que se deduce P ∧ ¬L de P ⇒ A, ¬P ⇒ C, ¬(A ∧ C), A, ¬L


-- Ejercicio 5

-- Convertir a Forma Normal Negada (NNF)

-- i. ∀X.∀Y.(¬Q(X,Y) ⇒ ¬P(X,Y))

-- ∀X.∀Y.(¬Q(X,Y) ⇒ ¬P(X,Y))
-- ∀X.∀Y.(¬¬Q(X,Y) ∨ ¬P(X,Y))
-- ∀X.∀Y.(Q(X,Y) ∨ ¬P(X,Y))


-- ii. ∀X.∀Y.((P(X,Y) ∧ Q(X,Y)) ⇒ R(X,Y))

-- ∀X.∀Y.((P(X,Y) ∧ Q(X,Y)) ⇒ R(X,Y))
-- ∀X.∀Y.(¬(P(X,Y) ∧ Q(X,Y)) ∨ R(X,Y))
-- ∀X.∀Y.(¬P(X,Y) ∨ ¬Q(X,Y) ∨ R(X,Y))


-- iii. ∀X.∃Y.(P(X,Y) ⇒ Q(X,Y))

-- ∀X.∃Y.(P(X,Y) ⇒ Q(X,Y))
-- ∀X.∃Y.(¬P(X,Y) ∨ Q(X,Y))


-- Ejercicio 6

-- Convertir a Forma Normal de Skolem y luego a Forma Clausal

-- i. ∃X.∃Y.(X < Y), siendo < un predicado binario usado de forma infija

-- ∃X.∃Y.(X < Y)
-- ∃Y.(x < Y)
-- x < y
-- {{x < y}}


-- ii. ∀X.∃Y.(X < Y)

-- ∀X.∃Y.(X < Y)
-- ∀X.(X < f(X))
-- ∀X.(X < f(X))
-- {{X < f(X)}}


-- iii. ∀X.¬(P(X) ∧ ∀Y.(¬P(Y) ∨ Q(Y)))

-- ∀X.¬(P(X) ∧ ∀Y.(¬P(Y) ∨ Q(Y)))
-- ∀X.(¬P(X) ∨ ¬∀Y.(¬P(Y) ∨ Q(Y)))
-- ∀X.(¬P(X) ∨ ∃Y.¬(¬P(Y) ∨ Q(Y)))
-- ∀X.(¬P(X) ∨ ∃Y.(P(Y) ∧ ¬Q(Y)))
-- ∀X.∃Y.(¬P(X) ∨ (P(Y) ∧ ¬Q(Y)))
-- ∀X.∃Y.((¬P(X) ∨ P(Y)) ∧ (¬P(X) ∨ ¬Q(Y)))
-- ∀X.((¬P(X) ∨ P(f(X))) ∧ (¬P(X) ∨ ¬Q(f(X))
-- ∀X.(¬P(X) ∨ P(f(X))) ∧ ∀X.(¬P(X) ∨ ¬Q(f(X)))
-- {{¬P(X), P(f(X))}, {¬P(X), ¬Q(f(X))}}


-- iv. ∃X.∀Y.(P(X,Y) ∧ Q(X) ∧ ¬R(Y))

-- ∃X.∀Y.(P(X,Y) ∧ Q(X) ∧ ¬R(Y))
-- ∀Y.(P(x, Y) ∧ Q(x) ∧ ¬R(Y))
-- ∀Y.P(x, Y) ∧ ∀Y.Q(x) ∧ ∀Y.¬R(Y)
-- ∀Y.P(x, Y) ∧ ∀Y.Q(x) ∧ ∀Y.¬R(Y)
-- {{P(x, Y)}, {Q(x)}, {¬R(Y)}}


-- v. ∀X.(P(X) ∧ ∃Y.(Q(Y) ∨ ∀Z.∃W.(P(Z) ∧ ¬Q(W))))

-- ∀X.(P(X) ∧ ∃Y.(Q(Y) ∨ ∀Z.∃W.(P(Z) ∧ ¬Q(W))))
-- ∀X.∃Y.(P(X) ∧ (Q(Y) ∨ ∀Z.∃W.(P(Z) ∧ ¬Q(W))))
-- ∀X.∃Y.∀Z.(P(X) ∧ (Q(Y) ∨ ∃W.(P(Z) ∧ ¬Q(W))))
-- ∀X.∃Y.∀Z.∃W.(P(X) ∧ (Q(Y) ∨ (P(Z) ∧ ¬Q(W))))
-- ∀X.∀Z.∃W.(P(X) ∧ (Q(f(X)) ∨ (P(Z) ∧ ¬Q(W))))
-- ∀X.∀Z.(P(X) ∧ (Q(f(X)) ∨ (P(Z) ∧ ¬Q(g(X,Z)))))
-- ∀X.∀Z.(P(X) ∧ Q(f(X)) ∨ P(Z) ∧ Q(f(X)) ∨ ¬Q(g(X,Z)))
-- ∀X.∀Z.P(X) ∧ ∀X.∀Z.(Q(f(X)) ∨ P(Z)) ∧ ∀X.∀Z.(Q(f(X)) ∨ ¬Q(g(X,Z))))
-- {{P(X)}, {Q(f(X)), P(Z)}, {Q(f(X)) ∨ ¬Q(g(X,Z))}}


-- Ejercicio 8

-- Utilizar los siguientes predicados y constantes: Pagó(X) para expresar que X pagó su multa, Espía(X) para X
-- es un espía, smullyan para el Sr. Smullyan y jefeGob para el jefe de gobierno.

-- Hipótesis:

-- ¬Pagó(smullyan)
-- Pagó(smullyan)

-- Conclusión:
-- Espía(jefeGob)

-- Cláusulas:
-- {{¬Pagó(smullyan)}, {Pagó(smullyan)}, {¬Espía(jefeGob)}}

-- Aplicando método de resolución:
-- {{¬Pagó(smullyan)}, {Pagó(smullyan)}, {¬Espía(jefeGob)}}
-- {{¬Pagó(smullyan)}, {Pagó(smullyan)}, {¬Espía(jefeGob)}, {}}

-- La resolución de la fórmula es insatisfacible, por lo que se deduce Espía(jefeGob) de ¬Pagó(smullyan) y Pagó(smullyan)


-- Ejercicio 9

-- Cuáles de las siguientes fórmulas son lógicamente válidas? Demostrarlo mediante la técnica de resolución.

-- i. [∃X.∀Y.R(X,Y)] ⇒ ∀Y.∃X.R(X,Y)

-- ¬([∃X.∀Y.R(X,Y)] ⇒ ∀Y.∃X.R(X,Y))
-- ¬(¬[∃X.∀Y.R(X,Y)] ∨ ∀Y.∃X.R(X,Y))
-- ∃X.∀Y.R(X,Y) ∧ ¬∀Y.∃X.R(X,Y)
-- ∃X.∀Y.R(X,Y) ∧ ∃Y.¬∃X.R(X,Y)
-- ∃X.∀Y.R(X,Y) ∧ ∃Y.∀X.¬R(X,Y)
-- ∃X.∀Y.R(X,Y) ∧ ∃Z.∀W.¬R(W,Z)
-- ∃X.∀Y.∃Z.∀W.(R(X,Y) ∧ ¬R(W,Z))
-- ∀Y.∃Z.∀W.(R(a,Y) ∧ ¬R(W,Z))
-- ∀Y.∀W.(R(a,Y) ∧ ¬R(W,f(Y)))
-- ∀Y.∀W.R(a,Y) ∧ ∀X.∀W.¬R(W,f(X))
-- {{R(a,Y)}, {¬R(W,f(X))}}

-- MGU sobre las dos cláusulas:
-- { R(a,Y) ≟ R(W,f(X)) }
-- Decompose ⇒ { a ≟ W, Y ≟ f(X) }
-- Swap ⇒ { W ≟ a, Y ≟ f(X) }
-- Elim { W := a } ⇒ { Y ≟ f(X) }
-- Elim { Y := f(X) } ⇒ {}
-- MGU = { W := a, Y := f(X) }

-- {{R(a,Y)}, {¬R(a,Y)}}
-- {{R(a,Y)}, {¬R(a,Y)}, {}}

-- La resolución de la negación fórmula es insatisfacible por lo que la fórmula es válida


-- ii. [∀X.∃Y.R(X,Y)] ⇒ ∃Y.∀X.R(X,Y)

-- ¬([∀X.∃Y.R(X,Y)] ⇒ ∃Y.∀X.R(X,Y))
-- ¬(¬[∀X.∃Y.R(X,Y)] ∨ ∃Y.∀X.R(X,Y))
-- ∀X.∃Y.R(X,Y) ∧ ¬∃Y.∀X.R(X,Y)
-- ∀X.∃Y.R(X,Y) ∧ ∀Y.¬∀X.R(X,Y)
-- ∀X.∃Y.R(X,Y) ∧ ∀Z.∃W.¬R(W,Z)
-- ∀X.∃Y.∀Z.∃W.(R(X,Y) ∧ ¬R(W,Z))
-- ∀X.∀Z.∃W.(R(f(X),Y) ∧ ¬R(W,Z))
-- ∀X.∀Z.(R(f(X),Y) ∧ ¬R(g(X,Z),Z))
-- ∀X.∀Z.R(f(X),Y) ∧ ∀X.∀Z.¬R(g(X,Z),Z)
-- {{R(f(X),Y)}, {¬R(g(X,Z),Z)}}

-- MGU sobre las dos cláusulas:
-- { R(f(X),Y) ≟ R(g(X,Z),Z) }
-- Decompose ⇒ { f(X) ≟ g(X,Z), Y ≟ Z }
-- OccursCheck ⇒ FALLA

-- Al no poder unificar las únicas cláusulas, la fórmula no es válida dado que su negación es satisfacible


-- iii. ∃X.[P(X) ⇒ ∀X.P(X)]

-- ¬∃X.[P(X) ⇒ ∀X.P(X)]
-- ¬∃X.[¬P(X) ∨ ∀X.P(X)]
-- ∀X.[P(X) ∧ ¬∀X.P(X)]
-- ∀X.[P(X) ∧ ∃X.¬P(X)]
-- ∀X.[P(X) ∧ ∃Y.¬P(Y)]
-- ∀X.∃Y.(P(X) ∧ ¬P(Y))
-- ∀X.(P(X) ∧ ¬P(f(X)))
-- ∀X.P(X) ∧ ∀X.¬P(f(X))
-- ∀X.P(X) ∧ ∀Y.¬P(f(Y))
-- {{P(X)}, {¬P(f(Y))}}

-- MGU sobre las dos cláusulas:
-- { P(X) ≟ P(f(Y)) }
-- Decompose ⇒ { X ≟ f(Y) }
-- Elim { X := f(Y) } ⇒ {}
-- MGU = { X := f(Y) }

-- {{P(f(Y))}, {¬P(f(Y))}}
-- {{P(f(Y))}, {¬P(f(Y))}, {}

-- La resolución de la negación fórmula es insatisfacible por lo que la fórmula es válida


-- iv. ∃X.[P(X) ∨ Q(X)] ⇒ [∃X.P(X) ∨ ∃X.Q(X)]

-- ¬(∃X.[P(X) ∨ Q(X)] ⇒ [∃X.P(X) ∨ ∃X.Q(X)])
-- ¬(¬∃X.[P(X) ∨ Q(X)] ∨ [∃X.P(X) ∨ ∃X.Q(X)])
-- ∃X.[P(X) ∨ Q(X)] ∧ ¬[∃X.P(X) ∨ ∃X.Q(X)]
-- ∃X.[P(X) ∨ Q(X)] ∧ ¬∃X.P(X) ∧ ¬∃X.Q(X)
-- ∃X.[P(X) ∨ Q(X)] ∧ ∀X.¬P(X) ∧ ∀X.¬Q(X)
-- ∃X.[P(X) ∨ Q(X)] ∧ ∀Y.¬P(Y) ∧ ∀Z.¬Q(Z)
-- ∃X.∀Y.((P(X) ∨ Q(X)) ∧ ¬P(Y) ∧ ∀Z.¬Q(Z))
-- ∃X.∀Y.∀Z.((P(X) ∨ Q(X)) ∧ ¬P(Y) ∧ ¬Q(Z))
-- ∀Y.∀Z.((P(c) ∨ Q(c)) ∧ ¬P(Y) ∧ ¬Q(Z))
-- ∀Y.∀Z.((P(c) ∨ Q(c)) ∧ ∀Y.∀Z.¬P(Y) ∧ ∀Y.∀Z.¬Q(Z))
-- {{P(c), Q(c)}, {¬P(Y)}, {¬Q(Z)}}

-- MGU sobre las dos primeras cláusulas:
-- { P(c) ≟ P(Y) }
-- Decompose ⇒ { c ≟ Y }
-- Swap ⇒ { Y ≟ c }
-- Elim { Y := c } ⇒ {}
-- MGU = { Y := c }

-- {{P(c), Q(c)}, {¬P(c)}, {¬Q(Z)}, {Q(c)}}

-- MGU sobre las dos últimas cláusulas:
-- { Q(Z) ≟ Q(c) }
-- Decompose ⇒ { Z ≟ c }
-- Elim { Z := c } ⇒ {}
-- MGU = { Z := c }

-- {{P(c), Q(c)}, {¬P(c)}, {¬Q(c)}, {Q(c)}}
-- {{P(c), Q(c)}, {¬P(c)}, {¬Q(c)}, {Q(c)}, {}}

-- La resolución de la fórmula es insatisfacible por lo que la fórmula es válida


-- v. ∀X.[P(X) ∨ Q(X)] ⇒ [∀X.P(X) ∨ ∀X.Q(X)]

-- ¬(∀X.[P(X) ∨ Q(X)] ⇒ [∀X.P(X) ∨ ∀X.Q(X)])
-- ¬(¬∀X.[P(X) ∨ Q(X)] ∨ [∀X.P(X) ∨ ∀X.Q(X)])
-- ∀X.[P(X) ∨ Q(X)] ∧ ¬[∀X.P(X) ∨ ∀X.Q(X)]
-- ∀X.[P(X) ∨ Q(X)] ∧ ¬∀X.P(X) ∧ ¬∀X.Q(X)
-- ∀X.[P(X) ∨ Q(X)] ∧ ∃X.¬P(X) ∧ ∃X.¬Q(X)
-- ∀X.[P(X) ∨ Q(X)] ∧ ∃Y.¬P(Y) ∧ ∃Z.¬Q(Z)
-- ∀X.∃Y.((P(X) ∨ Q(X)) ∧ ¬P(Y) ∧ ∃Z.¬Q(Z))
-- ∀X.∃Y.∃Z.((P(X) ∨ Q(X)) ∧ ¬P(Y) ∧ ¬Q(Z))
-- ∀X.∃Z.((P(X) ∨ Q(X)) ∧ ¬P(f(X)) ∧ ¬Q(Z))
-- ∀X.((P(X) ∨ Q(X)) ∧ ¬P(f(X)) ∧ ¬Q(g(X)))
-- ∀X.(P(X) ∨ Q(X)) ∧ ∀X.¬P(f(X)) ∧ ∀X.¬Q(g(X))
-- ∀X.(P(X) ∨ Q(X)) ∧ ∀Y.¬P(f(Y)) ∧ ∀Z.¬Q(g(Z))
-- {{P(X), Q(X)}, {¬P(f(Y))}, {¬Q(g(Z))}}

-- MGU sobre las dos primeras cláusulas:
-- { P(X) ≟ P(f(Y)) }
-- Decompose ⇒ { X ≟ f(Y) }
-- Elim { X := f(Y) } ⇒ {}
-- MGU = { X := f(Y) }

-- {{P(f(Y)), Q(f(Y))}, {¬P(f(Y))}, {¬Q(g(Z))}}

-- MGU sobre las dos últimas cláusulas:
-- { Q(g(Z)) ≟ Q(f(Y)) }
-- Decompose ⇒ { g(Z) ≟ f(Y) }
-- OccursCheck ⇒ FALLA

-- Al no poder unificar las cláusulas, la fórmula no es válida dado que su negación es satisfacible


-- vi. [∃X.P(X) ∧ ∀X.Q(X)] ⇒ ∃X.[P(X) ∧ Q(X)]

-- ¬([∃X.P(X) ∧ ∀X.Q(X)] ⇒ ∃X.[P(X) ∧ Q(X)])
-- ¬(¬[∃X.P(X) ∧ ∀X.Q(X)] ∨ ∃X.[P(X) ∧ Q(X)])
-- ∃X.P(X) ∧ ∀X.Q(X) ∧ ¬∃X.[P(X) ∧ Q(X)]
-- ∃X.P(X) ∧ ∀X.Q(X) ∧ ∀Y.¬[P(Y) ∧ Q(Y)]
-- ∃X.P(X) ∧ ∀X.Q(X) ∧ ∀Y.(¬P(Y) ∨ ¬Q(Y))
-- ∃X.P(X) ∧ ∀Z.Q(Z) ∧ ∀Y.(¬P(Y) ∨ ¬Q(Y))
-- ∃X.∀Z.∀Y.(P(X) ∧ Q(Z) ∧ (¬P(Y) ∨ ¬Q(Y)))
-- ∀Z.∀Y.(P(c) ∧ Q(Z) ∧ (¬P(Y) ∨ ¬Q(Y)))
-- ∀Z.∀Y.P(c) ∧ ∀Z.∀Y.Q(Z) ∀Z.∀Y.(¬P(Y) ∨ ¬Q(Y))
-- {{P(c)}, {Q(Z)}, {¬P(Y), ¬Q(Y)}}

-- MGU sobre las dos cláusulas de los extremos:
-- { P(c) ≟ P(Y) }
-- Decompose ⇒ { c ≟ Y }
-- Swap ⇒ { Y ≟ c }
-- Elim { Y := c } ⇒ {}
-- MGU = { Y := c }

-- {{P(c)}, {Q(c)}, {¬P(c), ¬Q(Y)}, {¬Q(c)}}

-- MGU sobre las segunda y la última cláusula:

-- { Q(Z) ≟ Q(c) }
-- Decompose ⇒ { Z ≟ c }
-- Elim { Z := c } ⇒ {}
-- MGU = { Z := c }

-- {{P(c)}, {Q(c)}, {¬P(c), ¬Q(Y)}, {¬Q(c)}}
-- {{P(c)}, {Q(c)}, {¬P(c), ¬Q(Y)}, {¬Q(c)}, {}}

-- La resolución de la fórmula es insatisfacible por lo que la fórmula es válida


-- vii. ∀X.∃Y.∀Z.∃W.[P(X,Y) ∨ ¬P(W,Z)]

-- ¬(∀X.∃Y.∀Z.∃W.[P(X,Y) ∨ ¬P(W,Z)])
-- ∃X.¬(∃Y.∀Z.∃W.[P(X,Y) ∨ ¬P(W,Z)])
-- ∃X.∀Y.¬(∀Z.∃W.[P(X,Y) ∨ ¬P(W,Z)])
-- ∃X.∀Y.∃Z.¬(∃W.[P(X,Y) ∨ ¬P(W,Z)])
-- ∃X.∀Y.∃Z.∀W.¬[P(X,Y) ∨ ¬P(W,Z)]
-- ∃X.∀Y.∃Z.∀W.(¬P(X,Y) ∧ P(W,Z))
-- ∀Y.∃Z.∀W.(¬P(c,Y) ∧ P(W,Z))
-- ∀Y.∀W.(¬P(c,Y) ∧ P(W,f(Y)))
-- ∀Y.∀W.¬P(c,Y) ∧ ∀Y.∀W.P(W,f(Y)))
-- ∀Y.∀W.¬P(c,Y) ∧ ∀Z.∀W.P(W,f(Z)))
-- {{¬P(c,Y)}, {P(W,f(Z))}}

-- MGU sobre las dos cláusulas:
-- { P(c,Y) ≟ P(W,f(Z)) }
-- Decompose ⇒ { c ≟ W, Y ≟ f(Z) }
-- Swap ⇒ { W ≟ c, Y ≟ f(Z) }
-- Elim { W := c } ⇒ { Y ≟ f(Z) }
-- Elim { Y := f(Z) } ⇒ {}
-- MGU = { W := c, Y := f(Z) }

-- {{¬P(c,Y)}, {P(c,Y)}}
-- {{¬P(c,Y)}, {P(c,Y)}, {}}

-- La resolución de la fórmula es insatisfacible por lo que la fórmula es válida


-- viii. ∀X.∀Y.∀Z.([¬P(f(a)) ∨ ¬P(Y) ∨ Q(Y)] ∧ P(f(Z)) ∧ [¬P(f(f(X))) ∨ ¬Q(f(X))])

-- ¬(∀X.∀Y.∀Z.([¬P(f(a)) ∨ ¬P(Y) ∨ Q(Y)] ∧ P(f(Z)) ∧ [¬P(f(f(X))) ∨ ¬Q(f(X))])
-- ∃X.¬(∀Y.∀Z.([¬P(f(a)) ∨ ¬P(Y) ∨ Q(Y)] ∧ P(f(Z)) ∧ [¬P(f(f(X))) ∨ ¬Q(f(X))])
-- ∃X.∃Y.¬(∀Z.([¬P(f(a)) ∨ ¬P(Y) ∨ Q(Y)] ∧ P(f(Z)) ∧ [¬P(f(f(X))) ∨ ¬Q(f(X))])
-- ∃X.∃Y.∃Z.¬([¬P(f(a)) ∨ ¬P(Y) ∨ Q(Y)] ∧ P(f(Z)) ∧ [¬P(f(f(X))) ∨ ¬Q(f(X))])
-- ∃X.∃Y.∃Z.(¬[¬P(f(a)) ∨ ¬P(Y) ∨ Q(Y)] ∨ ¬P(f(Z)) ∨ [¬P(f(f(X))) ∨ ¬Q(f(X))])
-- ∃X.∃Y.∃Z.([¬¬P(f(a)) ∧ ¬¬P(Y) ∧ ¬Q(Y)] ∨ ¬P(f(Z)) ∨ [¬P(f(f(X))) ∨ ¬Q(f(X))])
-- ∃X.∃Y.∃Z.([P(f(a)) ∧ P(Y) ∧ ¬Q(Y)] ∨ ¬P(f(Z)) ∨ [¬P(f(f(X))) ∨ ¬Q(f(X))])
-- ∃X.∃Y.∃Z.([P(f(a)) ∧ P(Y) ∧ ¬Q(Y)] ∨ ¬P(f(Z)) ∨ [P(f(f(X))) ∧ Q(f(X))])
-- ∃X.∃Y.∃Z.([P(f(a)) ∨ ¬P(f(Z)) ∨ (P(f(f(X))) ∧ Q(f(X)))] ∧ [P(Y) ∨ ¬P(f(Z)) ∨ (P(f(f(X))) ∧ Q(f(X)))] ∧ [¬Q(Y) ∨ ¬P(f(Z)) ∨ (P(f(f(X))) ∧ Q(f(X)))])
-- ∃X.∃Y.∃Z.((P(f(a)) ∨ ¬P(f(Z)) ∨ P(f(f(X)))) ∧ (P(f(a)) ∨ ¬P(f(Z)) ∨ Q(f(X))) ∧ (P(Y) ∨ ¬P(f(Z)) ∨ P(f(f(X)))) ∧ (P(Y) ∨ ¬P(f(Z)) ∨ Q(f(X))) ∧ (¬Q(Y) ∨ ¬P(f(Z)) ∨ P(f(f(X)))) ∧ (¬Q(Y) ∨ ¬P(f(Z)) ∨ Q(f(X))))
-- ∃Y.∃Z.((P(f(a)) ∨ ¬P(f(Z)) ∨ P(f(f(b)))) ∧ (P(f(a)) ∨ ¬P(f(Z)) ∨ Q(f(b))) ∧ (P(Y) ∨ ¬P(f(Z)) ∨ P(f(f(b)))) ∧ (P(Y) ∨ ¬P(f(Z)) ∨ Q(f(b))) ∧ (¬Q(Y) ∨ ¬P(f(Z)) ∨ P(f(f(b)))) ∧ (¬Q(Y) ∨ ¬P(f(Z)) ∨ Q(f(b))))
-- ∃Z.((P(f(a)) ∨ ¬P(f(Z)) ∨ P(f(f(b)))) ∧ (P(f(a)) ∨ ¬P(f(Z)) ∨ Q(f(b))) ∧ (P(c) ∨ ¬P(f(Z)) ∨ P(f(f(b)))) ∧ (P(c) ∨ ¬P(f(Z)) ∨ Q(f(b))) ∧ (¬Q(c) ∨ ¬P(f(Z)) ∨ P(f(f(b)))) ∧ (¬Q(c) ∨ ¬P(f(Z)) ∨ Q(f(b))))
-- ((P(f(a)) ∨ ¬P(f(d)) ∨ P(f(f(b)))) ∧ (P(f(a)) ∨ ¬P(f(d)) ∨ Q(f(b))) ∧ (P(c) ∨ ¬P(f(d)) ∨ P(f(f(b)))) ∧ (P(c) ∨ ¬P(f(d)) ∨ Q(f(b))) ∧ (¬Q(c) ∨ ¬P(f(d)) ∨ P(f(f(b)))) ∧ (¬Q(c) ∨ ¬P(f(d)) ∨ Q(f(b)))

-- {
--  {P(f(a)), ¬P(f(d)), P(f(f(b)))},
--  {P(f(a)), ¬P(f(d)), Q(f(b))},
--  {P(c), ¬P(f(d)), P(f(f(b))},
--  {P(c), ¬P(f(d)), Q(f(b))},
--  {¬Q(c), ¬P(f(d)), P(f(f(b))},
--  {¬Q(c), ¬P(f(d)), Q(f(b))}
-- }

-- MGU con cualquier combinación de cláusulas no es posible dado que siempre se llega a un occurs check.
-- No existen unificadores para las cláusulas, por lo que la fórmula no es válida dado que su negación es satisfacible


-- Ejercicio 10

-- i. Expresar la regla del modus ponens en forma clausal y mostrar que es válida

-- Regla del modus ponens: (P ⇒ Q) ∧ P ⇒ Q

-- ¬(((P ⇒ Q) ∧ P) ⇒ Q)
-- ¬(¬((P ⇒ Q) ∧ P) ∨ Q)
-- (P ⇒ Q) ∧ P ∧ ¬Q
-- (¬P ∨ Q) ∧ P ∧ ¬Q
-- {{¬P, Q}, {P}, {¬Q}}

-- {{¬P, Q}, {P}, {¬Q}}
-- {{¬P, Q}, {P}, {¬Q}, {Q}}
-- {{¬P, Q}, {P}, {¬Q}, {Q}, {}}

-- La resolución de la fórmula es insatisfacible por lo que la regla del modus ponens es válida


-- ii. Expresar la regla del modus tollens en forma clausal y mostrar que es válida

-- Regla del modus tollens: (P ⇒ Q) ∧ ¬Q ⇒ ¬P

-- ¬(((P ⇒ Q) ∧ ¬Q) ⇒ ¬P)
-- ¬(¬((P ⇒ Q) ∧ ¬Q) ∨ ¬P)
-- (P ⇒ Q) ∧ ¬Q ∧ P
-- (¬P ∨ Q) ∧ ¬Q ∧ P
-- {{¬P, Q}, {¬Q}, {P}}

-- {{¬P, Q}, {¬Q}, {P}}
-- {{¬P, Q}, {¬Q}, {P}, {Q}}
-- {{¬P, Q}, {¬Q}, {P}, {Q}, {}}

-- La resolución de la fórmula es insatisfacible por lo que la regla del modus tollens es válida


-- iii. Expresar la regla de especialización en forma clausal y mostrar que es válida

-- Regla de especialización: ∀X.P(X) ⇒ P(t)

-- ¬(∀X.P(X) ⇒ P(t))
-- ¬(¬∀X.P(X) ∨ P(t))
-- ∀X.P(X) ∧ ¬P(t)
-- ∀X.P(X) ∧ ∀X.¬P(t)
-- {{P(X)}, {¬P(t)}}

-- MGU sobre las dos cláusulas:
-- { P(X) ≟ P(t) }
-- Decompose ⇒ { X ≟ t }
-- Elim { X := t } ⇒ {}
-- MGU = { X := t }

-- {{P(t)}, {¬P(t)}}
-- {{P(t)}, {¬P(t)}, {}}

-- La resolución de la fórmula es insatisfacible por lo que la regla de especialización es válida






