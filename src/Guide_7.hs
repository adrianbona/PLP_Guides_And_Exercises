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










