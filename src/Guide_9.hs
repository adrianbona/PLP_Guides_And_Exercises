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


-- Ejercicio 8

-- a) #curry, cuyo objeto receptor es un bloque de dos parámetros,
-- y su resultado es un bloque similar al original pero currificado.

-- BlockClosure << curry
--   ^ [ :x | [ :y | self value: x value: y ] ] .


-- b) #flip, que al enviarse a un bloque de dos parámetros,
-- devuelve un bloque similar al original, pero con los parámetros en el orden inverso.

-- BlockClosure << flip
--   ^ [ :x :y | self value: y value: x ] .


-- c) #timesRepeat:, cuyo objeto receptor es un número natural y
-- recibe como colaborador un bloque, el cual se evaluará tantas veces como el número lo indique.

-- Integer << timesRepeat: aBlock
--   1 to: self do: [ aBlock value ].


-- Ejercicio 9

-- Agregar a la clase BlockClosure el método de clase generarBloqueInfinito que devuelve un bloque b1 tal que:
-- b1 value devuelve un arreglo de 2 elementos #(1 b2),
-- b2 value devuelve un arreglo de 2 elementos #(2 b3),
-- ...,
-- bi value devuelve un arreglo de 2 elementos #(i bi+1)

-- BlockClosure class << generarBloqueInfinito
--   ^ [ :x | #(x (self value: x + 1)) ] .


-- Ejercicio 10

-- i. Todo objeto es instancia de alguna clase y a su vez, estas son objetos.

-- [Verdadero]


-- ii. Cuando un mensaje es enviado a un objeto, el método asociado en la clase del receptor es ejecutado.

-- [Falso] El método asociado en la clase del receptor es ejecutado si el objeto entiende el mensaje, de lo
-- contrario se busca en la jerarquía de clases para encontrar la implementación del método correspondiente.


-- iii. Al mandar un mensaje a una clase, por ejemplo Object new, se busca en esa clase el método correspondiente.
-- A este método lo clasificamos como método de instancia.

-- [Falso] Al mandar un mensaje a una clase se busca el método de clase correspondiente.


-- iv. Una Variable de instancia es una variable compartida por todas las instancias vivas de una clase, en caso
-- de ser modificada por alguna de ellas, la variable cambia.

-- [Falso] Una Variable de instancia es una variable que pertenece a una instancia de una clase, por lo que no es
-- compartida por todas las instancias vivas de una clase.


-- v. Las Variables de clase son accesibles por el objeto clase, pero al mismo tiempo también son accesibles y
-- compartidas por todas las instancias de la clase; es decir, si una instacia modifica el valor de dicha variable,
-- dicho cambio afecta a todas las instancias.

-- [Falso] Las Variables de clase son accesibles por el objeto clase pero no significa que los valores sean compartidos.
-- Si una instancia modifica el valor de una variable de clase, el cambio no afecta a las demás instancias.


-- vi. Al ver el código de un método, podemos determinar a qué objeto representará la pseudo-variable self.

-- [Verdadero] Representará al objeto que recibe el mensaje.


-- vii. Al ver el código de un método, podemos determinar a qué objeto representará la pseudo-variable super.

-- [Verdadero] Representará a la superclase de la clase que implementa el método.


-- viii. Un Método de clase puede acceder a las variables de clase pero no a las de instancia, y por otro lado,
-- siempre devuelven un objeto instancia de la clase receptora.

-- [Falso] Un Método de clase puede acceder a las variables de clase y no a las de instancia, pero no siempre devuelven
-- un objeto instancia de la clase receptora.


-- ix. Los métodos y variables de clase son los métodos y variables de instancia del objeto clase.

-- [Falso] Los métodos y variables de clase son los métodos y variables de instancia del objeto clase.


-- Ejercicio 11

-- Suponiendo que anObject es una instancia de la clase OneClass que tiene definido el método de instancia
-- aMessage. Al ejecutar la siguiente expresión: anObject aMessage...

-- i. ¿A qué objeto queda ligada (hace referencia) la pseudo-variable self en el contexto de ejecución del método que es invocado?

-- El objeto anObject recibe el mensaje aMessage. En la definición del método de la instancia aMessage, self hace referencia a anObject.


-- ii. ¿A qué objeto queda ligada la pseudo-variable super en el contexto de ejecución del método que es invocado?

-- La pseudo-variable super quedará ligada a la superclase de OneClass.


-- iii. ¿Es cierto que super == self? ¿Es cierto en cualquier contexto de ejecución?

-- No es cierto que super == self. En cualquier contexto de ejecución super hace referencia a la superclase de la clase
-- que implementa el método, mientras que self hace referencia al objeto que recibe el mensaje.


-- Ejercicio 12

-- Se cuenta con la clase Figura, que tiene los métodos perimetro y lados.

-- sumarTodos es un método de la clase Collection, que suma todos los elementos de la colección receptora.
-- El método lados debe devolver un Bag (subclase de Collection) con las longitudes de los lados de la figura.

-- Figura tiene dos subclases: Cuadrado y Círculo. Cuadrado tiene una variable de instancia lado, que representa
-- la longitud del lado del cuadrado modelado; Círculo tiene una variable de instancia radio, que representa
-- el radio del círculo modelado.

-- Se pide que las clases Cuadrado y Círculo tengan definidos su método perímetro. Implementar los métodos
-- que sean necesarios para ello, respetando el modelo (incompleto) recién presentado.

-- Observaciones: el perímetro de un círculo se obtiene calculando: 2 · π · radio, y el del cuadrado: 4 · lado.
-- Consideramos que un círculo no tiene lados. Aproximar π por 3,14.

-- Object subclass: #Figura
--   instanceVariableNames: ''.

-- Figura >> perimetro
--   ^((self lados) sumarTodos).

-- Figura >> lados
--   self subclassResponsibility.

-- Figura subclass: #Cuadrado
--   instanceVariableNames: 'lado'.

-- Cuadrado >> lados
--   ^Bag with: (4 * lado).

-- Cuadrado >> perimetro
--   ^4 * lado.

-- Figura subclass: #Circulo
--   instanceVariableNames: 'radio'.

-- Circulo >> lados
--   ^Bag new. "Los círculos no tienen lados, devolvemos un Bag vacío"

-- Circulo >> perimetro
--   ^2 * 3.14 * radio.










