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














