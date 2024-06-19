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

-- Ejercicio 11

-- i. {P(X), ¬P(X), Q(a)}

-- No son cláusulas de Horn, ya que no cumplen con la restricción de tener a lo sumo un literal positivo.
-- ∃Y.∀X.(P(X) ∨ ¬P(X) ∨ Q(Y))


-- ii. {P(X), ¬Q(Y), ¬R(X,Y)}

-- Es una cláusula de Horn (DEFINICIÓN), ya que cumple con la restricción de tener a lo sumo un literal positivo.
-- ∀X.∀Y.(P(X) ∨ ¬Q(Y) ∨ ¬R(X,Y))


-- iii. {¬P(X,X,Z), ¬Q(X,Y), ¬Q(Y,Z)}

-- Es una cláusula de Horn (OBJETIVO), ya que cumple con la restricción de tener a lo sumo un literal positivo.
-- ∀X.∀Y.∀Z.(¬P(X,X,Z) ∨ ¬Q(X,Y) ∨ ¬Q(Y,Z))
-- ∀X.∀Y.∀Z.(¬P(X,X,Z) ∨ (Q(X,Y) ⇒ ¬Q(Y,Z)))
-- ∀X.∀Y.∀Z.(P(X,X,Z) ⇒ (Q(X,Y) ⇒ ¬Q(Y,Z)))


-- iv. {M(1,2,X)}

-- Es una cláusula de Horn (DEFINICIÓN), ya que cumple con la restricción de tener a lo sumo un literal positivo.
-- ∃Z.∃Y.∀X.M(Z,Y,X)


-- Ejercicio 12

-- Realizarse de manera lineal (utilizando en cada paso el resolvente obtenido en el paso anterior) ✔
-- Utilizar únicamente cláusulas de Horn ✔
-- Utilizar cada cláusula a lo sumo una vez ✖
-- Empezar por una cláusula objetivo (sin literales positivos) ✔
-- Empezar por una cláusula que provenga de la negación de lo que se quiere demostrar ✖
-- Recorrer el espacio de búsqueda de arriba hacia abajo y de izquierda a derecha ✖
-- Utilizar la regla de resolución binaria en lugar de la general ✔


-- Ejercicio 13

-- Constantes y predicados:

-- R(X) para expresar que X es un robot
-- Res(X,Y) para X puede resolver Y
-- PL(X) para X es un problema lógico
-- Pr(X) para X es un problema de esta práctica
-- I(X) para X es inteligente
-- J(X) para X es japonés
-- la constante alan para Alan


-- Hipótesis:

-- Alan es un robot japonés.
-- R(alan) ∧ J(alan)

-- Cualquier robot que puede resolver un problema lógico es inteligente.
-- ∀X.(R(X) ∧ ∃Y.(PL(Y) ∧ Res(X,Y)) ⇒ I(X))

-- Todos los robots japoneses pueden resolver todos los problemas de esta práctica.
-- ∀X.(R(X) ∧ J(X) ⇒ ∀Y.(Pr(Y) ⇒ Res(X,Y)))

-- Todos los problemas de esta práctica son lógicos.
-- ∀X.(Pr(X) ⇒ PL(X))

-- Existe al menos un problema en esta práctica.
-- ∃X.Pr(X)

-- Conclusión:

-- ¿Quién es inteligente?
-- I(X)

-- Pasaje a forma clausal:

-- R(alan) ∧ J(alan)
-- {{R(alan)}, {J(alan)}}

-- ∀X.((R(X) ∧ ∃Y.(PL(Y) ∧ Res(X,Y)) ⇒ I(X))
-- ∀X.(¬(R(X) ∧ ∃Y.(PL(Y) ∧ Res(X,Y))) ∨ I(X))
-- ∀X.(¬R(X) ∨ ¬∃Y.(PL(Y) ∧ Res(X,Y)) ∨ I(X))
-- ∀X.(¬R(X) ∨ ∀Y.¬(PL(Y) ∧ Res(X,Y)) ∨ I(X))
-- ∀X.(¬R(X) ∨ ∀Y.(¬PL(Y) ∨ ¬Res(X,Y)) ∨ I(X))
-- ∀X.∀Y.(¬R(X) ∨ ¬PL(Y) ∨ ¬Res(X,Y) ∨ I(X))
-- {{¬R(X), ¬PL(Y), ¬Res(X,Y), I(X)}}

-- ∀X.(R(X) ∧ J(X) ⇒ ∀Y.(Pr(Y) ⇒ Res(X,Y)))
-- ∀X.(¬(R(X) ∧ J(X)) ∨ ∀Y.(Pr(Y) ⇒ Res(X,Y)))
-- ∀X.(¬R(X) ∨ ¬J(X) ∨ ∀Y.(Pr(Y) ⇒ Res(X,Y)))
-- ∀X.(¬R(X) ∨ ¬J(X) ∨ ∀Y.(¬Pr(Y) ∨ Res(X,Y)))
-- ∀X.∀Y.(¬R(X) ∨ ¬J(X) ∨ ¬Pr(Y) ∨ Res(X,Y))
-- {{¬R(X), ¬J(X), ¬Pr(Y), Res(X,Y)}}

-- ∀X.(Pr(X) ⇒ PL(X))
-- ∀X.(¬Pr(X) ∨ PL(X))
-- {{¬Pr(X), PL(X)}}

-- ∃X.Pr(X)
-- {{Pr(a)}}

-- ¬I(X)
-- {{¬I(X)}}

-- Conjunto de cláusulas y sus roles:
-- 1 {R(alan)} (DEFINICIÓN)
-- 2 {J(alan)} (DEFINICIÓN)
-- 3 {¬R(X), ¬PL(Y), ¬Res(X,Y), I(X)} (DEFINICIÓN)
-- 4 {¬R(X), ¬J(X), ¬Pr(Y), Res(X,Y)} (DEFINICIÓN)
-- 5 {¬Pr(X), PL(X)} (DEFINICIÓN)
-- 6 {Pr(a)} (DEFINICIÓN)
-- 7 {¬I(X)} (OBJETIVO)

-- Procedemos a la resolución SLD, se aplica la regla de resolución binaria sobre una cláusula de definición y el objetivo:

-- MGU sobre las cláusulas 3 y 7:
-- { I(X) ≟ I(X) }
-- Decompose ⇒ {X ≟ X}
-- Delete ⇒ {}
-- MGU = {}

-- 8 {¬R(X), ¬PL(Y), ¬Res(X,Y)} (OBJETIVO)

-- MGU sobre las cláusulas 1 y 8:
-- { R(alan) ≟ R(X) }
-- Decompose ⇒ { alan ≟ X }
-- Swap ⇒ { X ≟ alan }
-- Elim { X := alan } ⇒ {}
-- MGU = { X := alan }

-- 9 {¬PL(Y), ¬Res(alan,Y)} (OBJETIVO)

-- MGU sobre las cláusulas 5 y 9:

-- { PL(X) ≟ PL(Y) }
-- Decompose ⇒ { X ≟ Y }
-- Elim { X := Y } ⇒ {}
-- MGU = { X := Y }

-- 10 {¬Res(alan,Y), ¬Pr(Y)} (OBJETIVO)

-- MGU sobre las cláusulas 6 y 10:
-- { Pr(a) ≟ Pr(Y) }
-- Decompose ⇒ { a ≟ Y }
-- Swap ⇒ { Y ≟ a }
-- Elim { Y := a } ⇒ {}
-- MGU = { Y := a }

-- 11 {¬Res(alan,a)} (OBJETIVO)

-- MGU sobre las cláusulas 4 y 11:
-- { Res(X,Y) ≟ Res(alan,a) }
-- Decompose ⇒ { X ≟ alan, Y ≟ a }
-- Elim { X := alan, Y := a } ⇒ {}
-- MGU = { X := alan, Y := a }

-- 12 {¬R(alan), ¬J(alan), ¬Pr(a)} (OBJETIVO)

-- Aplico la regla de resolución binaria sobre las cláusulas 2 y 12:

-- 13 {¬R(alan), ¬Pr(a)}

-- Aplico la regla de resolución binaria sobre las cláusulas 1 y 13:

-- 14 {¬Pr(a)}

-- Aplico la regla de resolución binaria sobre las cláusulas 6 y 14:

-- 15 {}

-- La resolución de la fórmula es insatisfacible por lo que la fórmula es válida










-- Ejercicio 14

-- Ejercicio 15

-- Ejercicio 16

-- Ejercicio 17

-- Ejercicio 18

-- Ejercicio 26

-- a. Representar en forma clausal

-- i. ∀X.(par(X) ⇒ ∃Y.(Y > X ∧ ¬par(Y)))

-- ∀X.(par(X) ⇒ ∃Y.(esMayorQue(Y,X) ∧ ¬par(Y)))
-- ∀X.(¬par(X) ∨ ∃Y.(esMayorQue(Y,X) ∧ ¬par(Y)))
-- ∀X.∃Y.(¬par(X) ∨ (esMayorQue(Y,X) ∧ ¬par(Y)))
-- ∀X.(¬par(X) ∨ (esMayorQue(f(X),X) ∧ ¬par(f(X))))
-- ∀X.(¬par(X) ∨ esMayorQue(f(X),X) ∧ ¬par(X) ∨ ¬par(f(X)))
-- ∀X.(¬par(X) ∨ esMayorQue(f(X),X) ∧ ∀X.(¬par(X) ∨ ¬par(f(X)))
-- {{¬par(X), esMayorQue(f(X),X)}, {¬par(X), ¬par(f(X))}}


-- ii. ∀X.(¬par(X) ⇒ ∃Y.(Y > X ∧ par(Y)))

-- ∀X.(¬par(X) ⇒ ∃Y.(esMayorQue(Y,X) ∧ par(Y)))
-- ∀X.(par(X) ∨ ∃Y.(esMayorQue(Y,X) ∧ par(Y)))
-- ∀X.∃Y.(par(X) ∨ (esMayorQue(Y,X) ∧ par(Y)))
-- ∀X.(par(X) ∨ (esMayorQue(f(X),X) ∧ par(f(X)))
-- ∀X.(par(X) ∨ esMayorQue(f(X),X) ∧ par(X) ∨ par(f(X)))
-- ∀X.(par(X) ∨ esMayorQue(f(X),X) ∧ ∀X.(par(X) ∨ par(f(X)))
-- {{par(X), esMayorQue(f(X),X)}, {par(X), par(f(X))}}


-- iii. ∀X.∀Y.∀Z.((X > Y ∧ Y > Z) ⇒ X > Z)

-- ∀X.∀Y.∀Z.((esMayorQue(X,Y) ∧ esMayorQue(Y,Z)) ⇒ esMayorQue(X,Z))
-- ∀X.∀Y.∀Z.(¬(esMayorQue(X,Y) ∧ esMayorQue(Y,Z)) ∨ esMayorQue(X,Z))
-- ∀X.∀Y.∀Z.(¬esMayorQue(X,Y) ∨ ¬esMayorQue(Y,Z) ∨ esMayorQue(X,Z))
-- {{¬esMayorQue(X,Y), ¬esMayorQue(Y,Z), esMayorQue(X,Z)}}

-- b. Usando resolución demostrar: ∀X.(par(X) ⇒ ∃Y.(Y > X ∧ par(Y)))

-- ¬∀X.(par(X) ⇒ ∃Y.(esMayorQue(Y,X) ∧ par(Y)))
-- ∃X.¬(par(X) ⇒ ∃Y.(esMayorQue(Y,X) ∧ par(Y)))
-- ∃X.¬(¬par(X) ∨ ∃Y.(esMayorQue(Y,X) ∧ par(Y)))
-- ∃X.(par(X) ∧ ¬∃Y.(esMayorQue(Y,X) ∧ par(Y)))
-- ∃X.(par(X) ∧ ∀Y.¬(esMayorQue(Y,X) ∧ par(Y)))
-- ∃X.(par(X) ∧ ∀Y.(¬esMayorQue(Y,X) ∨ ¬par(Y)))
-- ∃X.∀Y.(par(X) ∧ (¬esMayorQue(Y,X) ∨ ¬par(Y)))
-- ∀Y.(par(a) ∧ (¬esMayorQue(Y,a) ∨ ¬par(Y)))
-- ∀Y.par(a) ∧ ∀Y.(¬esMayorQue(Y,a) ∨ ¬par(Y)))
-- {{par(a)}, {¬esMayorQue(Y,a), ¬par(Y)}}

-- Conjunto de cláusulas:

-- 1 {¬par(X1), esMayorQue(f(X1),X1)}
-- 2 {¬par(X2), ¬par(f(X2))}
-- 3 {par(X3), esMayorQue(f(X3),X3)},
-- 4 {par(X4), par(f(X4))}
-- 5 {par(a)}
-- 6 {¬esMayorQue(Y1,a), ¬par(Y1)}

-- MGU sobre las cláusulas 5 y 6:
-- { par(a) ≟ par(Y1) }
-- Decompose ⇒ { a ≟ Y1 }
-- Swap ⇒ { Y1 ≟ a }
-- Elim { Y1 := a } ⇒ {}
-- MGU = { Y1 := a }

-- 1 {¬par(X1), esMayorQue(f(X1),X1)}
-- 2 {¬par(X2), ¬par(f(X2))}
-- 3 {par(X3), esMayorQue(f(X3),X3)},
-- 4 {par(X4), par(f(X4))}
-- 5 {par(a)}
-- 6 {¬esMayorQue(a,a), ¬par(a)}
-- 7 {esMayorQue(f(a),a)}

-- MGU sobre las cláusulas 1 y 7:
-- { esMayorQue(f(X1),X1) ≟ esMayorQue(f(a),a) }
-- Decompose ⇒ { f(X1) ≟ f(a), X1 ≟ a }
-- Elim { X1 := a } ⇒ {f(a) ≟ f(a)}
-- Decompose ⇒ { a ≟ a }
-- Delete ⇒ {}
-- MGU = { X1 := a }

-- 1 {¬par(a), esMayorQue(f(a),a)}
-- 2 {¬par(X2), ¬par(f(X2))}
-- 3 {par(X3), esMayorQue(f(X3),X3)},
-- 4 {par(X4), par(f(X4))}
-- 5 {par(a)}
-- 6 {¬esMayorQue(a,a), ¬par(a)}
-- 7 {esMayorQue(f(a),a)}
-- 8 {¬par(a)}

-- Por resolución entre las cláusulas 5 y 6 se obtiene la cláusula vacía, por lo que la fórmula es válida


-- c. La demostración es SLD?

-- Veamos que no todas las cláusulas son de Horn:

-- {¬par(X1), esMayorQue(f(X1),X1)} : Es de Horn
-- {¬par(X2), ¬par(f(X2))} : Es de Horn (podría ser GOAL)
-- {par(X3), esMayorQue(f(X3),X3)} : No es de Horn
-- {par(X4), par(f(X4))} : No es de Horn
-- {par(a)} : Es de Horn
-- {¬esMayorQue(Y1,a), ¬par(Y1)} : Es de Horn (podría ser GOAL)

-- No todas las cláusulas son de Horn, por lo que la demostración no es SLD. Sin embargo podrían ser descartadas las
-- cláusulas 3 y 4 para que todas las cláusulas sean de Horn. Luego la demostración habrá que hacerla de forma lineal.


-- Ejercicio Recuperatorio

-- Dadas las definiciones de Descendiente y Abuela a partir de la relación Madre, demostrar usando resolución general
-- que los nietos son descendientes, es decir que: ∀X.∀Y.(Abuela(X,Y) ⇒ Descendiente(Y,X))

-- Se quiere ver que ∀X.∀Y.(Abuela(X,Y) ⇒ Descendiente(Y,X))

-- Pasaje a forma clausal:
-- ¬∀X.∀Y.(Abuela(X,Y) ⇒ Descendiente(Y,X))
-- ¬∀X.∀Y.(¬Abuela(X,Y) ∨ Descendiente(Y,X))
-- ∃X.¬∀Y.(¬Abuela(X,Y) ∨ Descendiente(Y,X))
-- ∃X.∃Y.¬(¬Abuela(X,Y) ∨ Descendiente(Y,X))
-- ∃X.∃Y.(Abuela(X,Y) ∧ ¬Descendiente(Y,X))
-- ∃Y.(Abuela(a,Y) ∧ ¬Descendiente(Y,a))
-- Abuela(a,b) ∧ ¬Descendiente(b,a)
-- {{Abuela(a,b)}, {¬Descendiente(b,a)}}


-- i. Los hijos son descendientes:
-- ∀X.∀Y.(Madre(X,Y) ⇒ Descendiente(Y,X))

-- Pasaje a forma clausal:
-- ∀X.∀Y.(Madre(X,Y) ⇒ Descendiente(Y,X))
-- ∀X.∀Y.(¬Madre(X,Y) ∨ Descendiente(Y,X))
-- ∀X.∀Y.¬Madre(X,Y) ∨ ∀X.∀Y.Descendiente(Y,X)
-- {{¬Madre(X,Y), Descendiente(Y,X)}}


-- ii. La relación de descendencia es transitiva:
-- ∀X.∀Y.∀Z.((Descendiente(X,Y) ∧ Descendiente(Y,Z)) ⇒ Descendiente(X,Z))

-- Pasaje a forma clausal:
-- ∀X.∀Y.∀Z.((Descendiente(X,Y) ∧ Descendiente(Y,Z)) ⇒ Descendiente(X,Z))
-- ∀X.∀Y.∀Z.(¬(Descendiente(X,Y) ∧ Descendiente(Y,Z)) ∨ Descendiente(X,Z))
-- ∀X.∀Y.∀Z.(¬Descendiente(X,Y) ∨ ¬Descendiente(Y,Z) ∨ Descendiente(X,Z))
-- ∀X.∀Y.∀Z.¬Descendiente(X,Y) ∨ ∀X.∀Y.∀Z.¬Descendiente(Y,Z) ∨ ∀X.∀Y.∀Z.Descendiente(X,Z)
-- {{¬Descendiente(X,Y), ¬Descendiente(Y,Z), Descendiente(X,Z)}}


-- iii. La abuela es madre de alguien que es madre del nieto:
-- ∀X.∀Y.(Abuela(X,Y) ⇒ ∃Z.(Madre(X,Z) ∧ Madre(Z,Y)))

-- Pasaje a forma clausal:
-- ∀X.∀Y.(Abuela(X,Y) ⇒ ∃Z.(Madre(X,Z) ∧ Madre(Z,Y))
-- ∀X.∀Y.(¬Abuela(X,Y) ∨ ∃Z.(Madre(X,Z) ∧ Madre(Z,Y)))
-- ∀X.∀Y.∃Z.(¬Abuela(X,Y) ∨ (Madre(X,Z) ∧ Madre(Z,Y)))
-- ∀X.∀Y.∃Z.(¬Abuela(X,Y) ∨ Madre(X,Z) ∧ ¬Abuela(X,Y) ∨ Madre(Z,Y))
-- ∀X.∀Y.(¬Abuela(X,Y) ∨ Madre(X,f(X,Y)) ∧ ¬Abuela(X,Y) ∨ Madre(f(X,Y),Y))
-- ∀X.∀Y.(¬Abuela(X,Y) ∨ Madre(X,f(X,Y))) ∧ ∀X.∀Y.(¬Abuela(X,Y) ∨ Madre(f(X,Y),Y))
-- {{¬Abuela(X,Y), Madre(X,f(X,Y))}, {¬Abuela(X,Y), Madre(f(X,Y),Y)}}


-- Conjunto de cláusulas:

-- 1 {¬Madre(X1,Y1), Descendiente(Y1,X1)}
-- 2 {¬Descendiente(X2,Y2), ¬Descendiente(Y2,Z2), Descendiente(X2,Z2)}
-- 3 {¬Abuela(X3,Y3), Madre(X3,f(X3,Y3))}
-- 4 {¬Abuela(X4,Y4), Madre(f(X4,Y4),Y4)}
-- 5 {Abuela(a,b)}
-- 6 {¬Descendiente(b,a)}

-- MGU sobre las cláusulas 3 y 5:
-- { Abuela(X3,Y3) ≟ Abuela(a,b) }
-- Decompose ⇒ { X3 ≟ a, Y3 ≟ b }
-- Elim { X3 := a, Y3 := b } ⇒ {}
-- MGU = { X3 := a, Y3 := b }

-- 7 {Madre(a,f(a,b))}

-- MGU sobre las cláusulas 1 y 7:
-- { Madre(a,f(a,b)) ≟ Madre(X1,Y1) }
-- Decompose ⇒ { a ≟ X1, f(a,b) ≟ Y1 }
-- Elim { X1 := a, Y1 := f(a,b) } ⇒ {}
-- MGU = { X1 := a, Y1 := f(a,b) }

-- 8 {Descendiente(f(a,b),a)}

-- MGU sobre las cláusulas 4 y 5:
-- { Abuela(X4,Y4) ≟ Abuela(a,b) }
-- Decompose ⇒ { X4 ≟ a, Y4 ≟ b }
-- Elim { X4 := a, Y4 := b } ⇒ {}
-- MGU = { X4 := a, Y4 := b }

-- 9 {Madre(f(a,b),b)}

-- MGU sobre las cláusulas 1 y 9:

-- { Madre(X1,Y1) ≟ Madre(f(a,b),b) }
-- Decompose ⇒ { X1 ≟ f(a,b), Y1 ≟ b }
-- Elim { X1 := f(a,b), Y1 := b } ⇒ {}
-- MGU = { X1 := f(a,b), Y1 := b }

-- 10 {Descendiente(b,f(a,b))}

-- MGU sobre las cláusulas 2 y 10:
-- { Descendiente(X2,Y2) ≟ Descendiente(b,f(a,b)) }
-- Decompose ⇒ { X2 ≟ b, Y2 ≟ f(a,b) }
-- Elim { X2 := b, Y2 := f(a,b) } ⇒ {}
-- MGU = { X2 := b, Y2 := f(a,b) }

-- 11 {¬Descendiente(f(a,b),Z2), Descendiente(b,Z2)}

-- MGU sobre las cláusulas 8 y 11:
-- { Descendiente(f(a,b),a) ≟ Descendiente(f(a,b),Z2) }
-- Decompose ⇒ { a ≟ Z2 }
-- Swap ⇒ { Z2 ≟ a }
-- Elim { Z2 := a } ⇒ {}
-- MGU = { Z2 := a }

-- 12 {Descendiente(b,a)}

-- MGU sobre las cláusulas 6 y 12:
-- { Descendiente(b,a) ≟ Descendiente(b,a) }
-- Delete ⇒ {}
-- MGU = {}

-- 13 {}

-- Por resolución entre las cláusulas 12 y 13 se obtiene la cláusula vacía, por lo que la fórmula es válida

-- Observando el conjunto de cláusulas sabremos si hay posibilidad de resolución SLD:

-- {¬Madre(X1,Y1), Descendiente(Y1,X1)} : Es de Horn
-- {¬Descendiente(X2,Y2), ¬Descendiente(Y2,Z2), Descendiente(X2,Z2)} : Es de Horn
-- {¬Abuela(X3,Y3), Madre(X3,f(X3,Y3))} : Es de Horn
-- {¬Abuela(X4,Y4), Madre(f(X4,Y4),Y4)} : Es de Horn
-- {Abuela(a,b)} : Es de Horn
-- {¬Descendiente(b,a)} : Es de Horn (podría ser GOAL)


-- Ejercicio Parcial

-- Demostrar mediante método de resolución una propiedad de las relaciones binarias. A saber, una relación no vacía
-- no puede ser irreflexiva, simétrica y transitiva al mismo tiempo. Si R satisface las tres propiedades, entonces es vacía.


-- R es irreflexiva: ∀X.¬R(X,X)

-- Forma clausal:
-- ∀X.¬R(X,X)
-- {¬R(X1,X1)}


-- R es simétrica: ∀X.∀Y.(R(X,Y) ⇒ R(Y,X))

-- Forma clausal:
-- ∀X.∀Y.(R(X,Y) ⇒ R(Y,X))
-- ∀X.∀Y.(¬R(X,Y) ∨ R(Y,X))
-- {¬R(X2,Y2), R(Y2,X2)}


-- R es transitiva: ∀X.∀Y.∀Z.((R(X,Y) ∧ R(Y,Z)) ⇒ R(X,Z))

-- Forma clausal:
-- ∀X.∀Y.∀Z.((R(X,Y) ∧ R(Y,Z)) ⇒ R(X,Z))
-- ∀X.∀Y.∀Z.(¬(R(X,Y) ∧ R(Y,Z)) ∨ R(X,Z))
-- ∀X.∀Y.∀Z.(¬R(X,Y) ∨ ¬R(Y,Z) ∨ R(X,Z))
-- {¬R(X3,Y3), ¬R(Y3,Z3), R(X3,Z3)}


-- R es vacía: ∀X.¬∃Y.R(X,Y)

-- Forma clausal (negada):
-- ¬∀X.¬∃Y.R(X,Y)
-- ∃X.¬¬∃Y.R(X,Y)
-- ∃X.∃Y.R(X,Y)
-- ∃Y.R(a,Y)
-- R(a,b)


-- Conjunto de cláusulas:
-- 1 {¬R(X1,X1)}
-- 2 {¬R(X2,Y2), R(Y2,X2)}
-- 3 {¬R(X3,Y3), ¬R(Y3,Z3), R(X3,Z3)}
-- 4 {R(a,b)}

-- MGU sobre las cláusulas 2 y 4:
-- { R(a,b) ≟ R(X2,Y2) }
-- Decompose ⇒ { a ≟ X2, b ≟ Y2 }
-- Swap ⇒ { X2 ≟ a, Y2 ≟ b }
-- Elim { X2 := a, Y2 := b } ⇒ {}

-- 5 {R(b,a)}

-- MGU sobre las cláusulas 3 y 5:
-- { R(b,a) ≟ R(Y3,Z3) }
-- Decompose ⇒ { b ≟ Y3, a ≟ Z3 }
-- Swap ⇒ { Y3 ≟ b, Z3 ≟ a }
-- Elim { Y3 := b, Z3 := a } ⇒ {}
-- MGU = { Y3 := b, Z3 := a }

-- 6 {¬R(X6,b), R(X6,a)}

-- MGU sobre las cláusulas 4 y 6:
-- { R(a,b) ≟ R(X6,b) }
-- Decompose ⇒ { a ≟ X6, b ≟ b }
-- Swap ⇒ { X6 ≟ a, b ≟ b }
-- Elim { X6 := a } ⇒ {b ≟ b}
-- Delete ⇒ {b ≟ b} ⇒ {}
-- MGU = { X6 := a }

-- 7 {¬R(a,a)}

-- MGU sobre las cláusulas 1 y 7:
-- { ¬R(a,a) ≟ ¬R(a,a) }
-- Delete ⇒ {}
-- MGU = {}

-- 8 {}

-- Por resolución entre las cláusulas 7 y 8 se obtiene la cláusula vacía, por lo que la fórmula es válida









