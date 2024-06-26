module Guide_9 (
) where

-- Ejercicio 1

-- a. 10 numberOfDigitsInBase: 2

-- 10 es objeto receptor
-- numberOfDigitsInBase es mensaje
-- 2 es colaborador


-- b. 10 factorial

-- 10 es objeto receptor
-- factorial es mensaje


-- c. (20 + 3) * 5

-- 20 es objeto receptor
-- + es mensaje
-- 3 es colaborador
-- (20 + 3) es objeto receptor
-- * es mensaje
-- 5 es colaborador


-- d. 20 + (3 * 5)

-- 20 es objeto receptor
-- + es mensaje
-- el resultado de (3 * 5) es colaborador
-- 3 es objeto receptor
-- * es mensaje
-- 5 es colaborador


-- e. December first, 1985

-- Pharo no entiende el mensaje December, por lo que no se puede ejecutar


-- f. 1 = 2 ifTrue: [ 'what!?' ]

-- 1 es objeto receptor
-- = es mensaje
-- 2 es colaborador

-- el resultado de (1 = 2) es objeto receptor
-- ifTrue: es mensaje
-- [ 'what!?' ] es colaborador

-- g. 1@1 insideTriangle: 0@0 with: 2@0 with: 0@2.

-- 1@1 es objeto receptor
-- insideTriangle:with:with: es mensaje
-- 0@0, 2@0 y 0@2 son colaboradores


-- h. 'Hello World' indexOf: $o startingAt: 6

-- 'Hello World' es objeto receptor
-- indexOf:startingAt: es mensaje
-- $o y 6 son colaboradores


-- i. (OrderedCollection with: 1) add: 25; add: 35; yourself.

-- OrderedCollection with: 1 es objeto receptor
-- add: es mensaje
-- 25 es colaborador
-- add: es mensaje
-- 35 es colaborador
-- yourself es mensaje


-- j. Object subclass: #SnakesAndLadders instanceVariableNames: 'players squares turn die over' classVariableNames: '' poolDictionaries: '' category: 'SnakesAndLadders'

-- Object es objeto receptor (en este claso una clase)
-- subclass:instanceVariableNames:classVariableNames:poolDictionaries:category: es mensaje
-- #SnakesAndLadders, 'players squares turn die over', '', '', 'SnakesAndLadders' son colaboradores


-- Ejercicio 3

-- Mostrar expresiones válidas de Smallktalk que contengan los siguientes conceptos:

-- a) Objeto
-- 10


-- b) Mensaje unario
-- 10 factorial


-- c) Mensaje binario
-- 10 + 5


-- d) Mensaje keyword
-- 10 factorial printString


-- e) Colaborador
-- 10 + 5


-- f) Variable local
-- | x | x := 10


-- g) Asignación
-- x := 10


-- h) Símbolo
-- #hola


-- i) Carácter
-- $a


-- j) Array
-- #(1 2 3)


-- Ejercicio 4

-- Indicar el valor que devuelve cada una de las siguientes expresiones:

-- a) [:x | x + 1] value: 2
-- 3


-- b) [|x| x := 10. x + 12] value
-- 22


-- c) [:x :y | |z| z := x + y] value: 1 value: 2
-- 3


-- d) [:x :y | x + 1] value: 1
-- Exception: ArgumentsCountMismatch


-- e) [:x | [:y | x + 1]] value: 2
-- [:y | x + 1]


-- f) [[:x | x + 1]] value
-- [:x | x + 1]


-- g) [:x :y :z | x + y + z] valueWithArguments: #(1 2 3)
-- 6


-- h) [ |z| z := 10. [:x | x + z]] value value: 10
-- 20


-- ¿Cuál es la diferencia entre [|x y z| x + 1] y [:x :y :z| x + 1]?
-- En el primer caso hay tres variables locales, en el segundo caso hay tres argumentos


-- Ejercicio 5

-- Integer factorialsList
--   | list |
--   list := OrderedCollection with: 1.
--   2 to: self do: [:aNumber | list add: (list last) * aNumber ].
--   ^ list

-- a) factorialList: 10
-- el mensaje no tiene objeto receptor


-- b) Integer factorialsList: 10
-- la clase no entiende el mensaje


-- c) 3 factorialsList.
-- #(1 2 6 24)


-- d) 5 factorialsList at: 4
-- 24

-- e) 5 factorialsList at: 6
-- Exception: SubscriptOutOfBounds


-- Ejercicio 6

-- Mostrar un ejemplo por cada mensaje:

-- a) #collect:
-- #(1 2 3 4) collect: [:x | x + 1]
-- #(2 3 4 5)

-- b) #select:
-- #(1 2 3 4) select: [:x | x > 2]
-- #(3 4)

-- c) #inject: into: (how each element of the collection should be combined with the current accumulation to produce a new accumulation value)
-- "(#(1 2 3) inject: OrderedCollection new into: [ :a :e | a add: (e + 1). a ])
-- #(2 3 4)"

-- d) #reduce: (o #fold:)
-- #(1 2 3 4) reduce: [:x :y | x + y]
-- 10

-- e) #reduceRight: (it works like reduce but starts from the right like foldr in Haskell)
-- #(1 2 3 4) reduceRight: [:x :y | x - y]
-- -2

-- f) #do:
-- | accumulator | accumulator := 0. #(1 2 3 4) do: [:x | accumulator := accumulator + x]
-- 10


-- Ejercicio 7

-- SomeClass << foo: x
--  | aBlock z |
--  z := 10.
--  aBlock := [ x > 5 ifTrue: [ z := z + x. ^0 ] ifFalse: [ z := z = x. 5 ] ].
--  y := aBlock value.
--  y := y + z.
--  ^y.

-- a) obj foo: 4.
-- Instance of False did not understand #+

-- b) Message selector: #foo: argument: 5.
-- Es la instancia del mensaje foo con el argumento 5

-- c) obj foo: 10. (Ayuda: el resultado no es 20).
-- 0 (el resultado es 0 porque el bloque retorna 0 si x > 5 y no continúa con el resto de las instrucciones)