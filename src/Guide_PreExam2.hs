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


--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44--44


--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55--55