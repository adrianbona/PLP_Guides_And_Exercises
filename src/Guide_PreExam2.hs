module Guide_PreExam2 (
) where

--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11--11

-- Object subclass: #Robot
--   instanceVariableNames: 'x y b'

-- Robot >> initWith: aBlock
--   b := aBlock.
--   x := 0.
--   y := 0.
--   ^ self.

-- Robot class >> newWith: aBlock
--   | r |
--   r := self new.
--   ^ r initWith: aBlock.

-- Robot >> avanzar
--   | res |
--   res := b value: x value: y.
--   x := res at: 1.
--   y := res at: 2.
--   ^ self.

-- Robot subclass: #Drone
--   instanceVariableNames: 'z'

-- Drone >> init
--   z := 0.
--   ^ self.

-- Drone class >> newWith: aBlock
--   | d |
--   d := super newWith: aBlock.
--   ^ d init.

-- Drone >> avanzar
--   | res |
--   super avanzar.
--   z < 10 ifTrue: [z := z + 1].
--   ^ self.

--  Indicar qué mensajes se envían a qué objetos, con qué colabradores y cuál es el resultado de cada colaboración al
-- ejecutar la siguiente línea de código: "aDrone avanzar."


-- Mensaje      | Objeto | Colaboradores | Resultado
-- ------------ | ------ | ------------- | ---------
-- avanzar      | aDrone | ø             | aDrone
-- avanzar      | aDrone | ø             | aDrone
-- value:value: | aBlock | x y           | #(1 1)
-- at:          | res    | 1             | 1
-- at:          | res    | 2             | 1
-- <            | 0      | 10            | true
-- ifTrue:      | true   | block         | ø
-- value:       | block  | ø             | 1
-- +            | 0      | 1             | 1



--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22--22


--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33--33

-- Convertir las siguientes fórmulas a Forma Clausal:


-- ∀C.(camino(C) ⇔ (∃A.∃B.comunica(A,B,C)))

-- ∀C.(camino(C) ⇔ (∃A.∃B.comunica(A,B,C)))
-- ∀C.((camino(C) ⇒ (∃A.∃B.comunica(A,B,C))) ∧ (∃A.∃B.comunica(A,B,C) ⇒ camino(C)))
-- ∀C.((¬camino(C) ∨ (∃A.∃B.comunica(A,B,C))) ∧ (¬∃A.∃B.comunica(A,B,C) ∨ camino(C)))
-- ∀C.((¬camino(C) ∨ (∃A.∃B.comunica(A,B,C))) ∧ (∀A.¬∃B.comunica(A,B,C) ∨ camino(C)))
-- ∀C.((¬camino(C) ∨ (∃A.∃B.comunica(A,B,C))) ∧ (∀A.∀B.¬comunica(A,B,C) ∨ camino(C)))
-- ∀C.∃A.∃B.(¬camino(C) ∨ comunica(A,B,C)) ∧ ∀C.∀A.∀B.(¬comunica(A,B,C) ∨ camino(C))
-- ∀C.∃A.(¬camino(C) ∨ comunica(A,f(C),C)) ∧ ∀C.∀A.∀B.(¬comunica(A,B,C) ∨ camino(C))
-- ∀C.(¬camino(C) ∨ comunica(g(C),f(C),C)) ∧ ∀C.∀A.∀B.(¬comunica(A,B,C) ∨ camino(C))
-- {{¬camino(C1), comunica(g(C1),f(C1),C1)}, {¬comunica(A2,B2,C2), camino(C2)}}


-- ∀X.∀Y.∃C.comunica(X,Y,C)

-- ∀X.∀Y.∃C.comunica(X,Y,C)
-- ∀X.∀Y.comunica(X,Y,f(X,Y))
-- {{comunica(X3,Y3,h(X3,Y3))}}


-- ∀X.∀Y.∀C.(comunica(X,Y,C) ⇒ conduceA(Y,C))

-- ∀X.∀Y.∀C.(comunica(X,Y,C) ⇒ conduceA(Y,C))
-- ∀X.∀Y.∀C.(¬comunica(X,Y,C) ∨ conduceA(Y,C))
-- {{¬comunica(X4,Y4,C4), conduceA(Y4,C4)}}


-- ∀X.∀Y.∀C.((conduceA(X,C) ∧ ∃D.comunica(X,Y,D)) ⇒ conduceA(Y,C))

-- ∀X.∀Y.∀C.((conduceA(X,C) ∧ ∃D.comunica(X,Y,D)) ⇒ conduceA(Y,C))
-- ∀X.∀Y.∀C.(¬(conduceA(X,C) ∧ ∃D.comunica(X,Y,D)) ∨ conduceA(Y,C))
-- ∀X.∀Y.∀C.(¬conduceA(X,C) ∨ ¬∃D.comunica(X,Y,D) ∨ conduceA(Y,C))
-- ∀X.∀Y.∀C.(¬conduceA(X,C) ∨ ∀D.¬comunica(X,Y,D) ∨ conduceA(Y,C))
-- ∀X.∀Y.∀C.∀D.(¬conduceA(X,C) ∨ ¬comunica(X,Y,D) ∨ conduceA(Y,C))
-- {{¬conduceA(X5,C5), ¬comunica(X5,Y5,D5), conduceA(Y5,C5)}}


-- Utilizar el método de resolución para probar que todos los caminos conducen a Roma. Es decir: ∀C.(camino(C) ⇒ conduceA(Roma,C))

-- ¬∀C.(camino(C) ⇒ conduceA(Roma,C))
-- ¬∀C.(¬camino(C) ∨ conduceA(Roma,C))
-- ∃C.¬(¬camino(C) ∨ conduceA(Roma,C))
-- ∃C.(camino(C) ∧ ¬conduceA(Roma,C))
-- camino(c) ∧ ¬conduceA(Roma,c))
-- {{camino(c)}, {¬conduceA(Roma,c)}}


-- Cláusulas:

-- 1 {¬camino(C1), comunica(g(C1),f(C1),C1)}  // Definición
-- 2 {¬comunica(A2,B2,C2), camino(C2)}  // Definición
-- 3 {comunica(X3,Y3,h(X3,Y3))}  // Definición
-- 4 {¬comunica(X4,Y4,C4), conduceA(Y4,C4)}  // Definición
-- 5 {¬conduceA(X5,C5), ¬comunica(X5,Y5,D5), conduceA(Y5,C5)} // Definición
-- 6 {camino(c)} // Definición
-- 7 {¬conduceA(Roma,c)}  // Objetivo

-- Resolución:

-- MGU sobre las cláusulas 7 y 5:
-- { conduceA(Roma,c) ≟ conduceA(Y5,C5) }
-- Decompose ⇒ { Roma ≟ Y5, c ≟ C5 }
-- Swap ⇒ { Y5 ≟ Roma, C5 ≟ c }
-- MGU = { Y5 := Roma, C5 := c }

-- 8 { ¬conduceA(X5,c), ¬comunica(X5,Roma,D5) }














