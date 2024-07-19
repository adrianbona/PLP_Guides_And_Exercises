module Guide_1 (
  max2,
  max2Curry,
  normaVectorial,
  normaVectorialCurry,
  subtract',
  predecesor,
  curry',
  uncurry',
  suma,
  suma',
  elemo,
  elemo',
  filtra,
  filtra',
  mapea,
  mapea',
  mejorSegun,
  mejorSegun',
  sumasParciales,
  sumasParciales',
  sumasParciales'',
  sumaAlt,
  sumaAltInvertida,
  insertarEnTodasLasPosiciones,
  permutaciones,
  elementosEnPosicionesPares,
  partes,
  prefijos,
  sublistas,
  entrelazar,
  entrelazar',
  recr,
  sacarUna,
  insertarOrdenado,
  genLista,
  desdeHasta,
  mapPares,
  mapPares',
  armarPares,
  mapDoble,
  sumaMat,
  trasponer,
  generate,
  generateFrom,
  generateBase,
  factoriales,
  iterateN,
  generateFrom',
  potencia,
  Polinomio(..),
  evaluar,
  esNil,
  altura,
  cantNodos,
  mejorSegunAB,
  esABB,
  ramas,
  cantHojas,
  espejo,
  AIH(..),
  alturaAIH,
  tamañoAIH,
  RoseTree(..),
  hojasRT,
  distanciasRT,
  alturaRT,
  AT(..),
  foldAT,
  preorder,
  mapAT,
  nivel,
) where

import Guide_0 (AB(Empty, Bin))

-- Ejercicio 1

max2 :: Ord a => (a, a) -> a
max2 (x, y) = if x >= y then x else y

max2Curry :: Ord a => a -> a -> a
max2Curry = \x -> \y -> max2 (x,y)

normaVectorial :: Floating a => (a, a) -> a
normaVectorial (x, y) = sqrt (x*x + y*y)

normaVectorialCurry :: Floating a => a -> a -> a
normaVectorialCurry = \x -> \y -> normaVectorial (x,y)

subtract' :: Integer -> Integer -> Integer
subtract' = flip (-)

predecesor :: Integer -> Integer
predecesor = subtract 1

-- Ejercicio 2

-- Dada una función de dos argumentos, devuelve su equivalente currificada

curry' :: ((a, b) -> t) -> a -> b -> t
curry' f = \x -> \y -> f (x,y)

-- Dada una función currificada de dos argumentos, devuelve su equivalente no currificada

uncurry' :: (t1 -> t2 -> t3) -> (t1, t2) -> t3
uncurry' f = \(x,y) -> f x y

-- Ejercicio 3

-- Redefinir usando foldr

-- SUM

suma :: [Int] -> Int
suma [] = 0
suma (x:xs) = x + suma xs

-- SUM con foldr

suma' :: (Foldable t, Num b) => t b -> b
suma' xs = foldr (+) 0 xs

-- ELEM

elemo :: (Eq a) => a -> [a] -> Bool
elemo _ [] = False
elemo a xs = a == head xs || elemo a (tail xs)

-- ELEM con foldr

elemo' :: (Foldable t, Eq a) => a -> t a -> Bool
elemo' a b = foldr (\x y -> (x == a || y)) False b

-- FILTER

filtra :: (a -> Bool) -> [a] -> [a]
filtra _ [] = []
filtra f (x:xs) = if f x then x : filtra f xs else filtra f xs

-- FILTER con foldr

filtra' :: Foldable t => (a -> Bool) -> t a -> [a]
filtra' f xs = foldr (\x accum -> if f x then x : accum else accum) [] xs

-- MAP

mapea :: (a -> b) -> [a] -> [b]
mapea _ [] = []
mapea f (x:xs) = f x : mapea f xs

-- MAP con foldr

mapea' :: Foldable t1 => (t2 -> a) -> t1 t2 -> [a]
mapea' f xs = foldr (\x accum -> f x : accum) [] xs

-- Devuelve el máximo elemento de la lista según una función de comparación

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun _ [] = error "Empty list"
mejorSegun _ (x:[]) = x
mejorSegun f (x:y:ys) = if f x y then mejorSegun f (x:ys) else mejorSegun f (y:ys)

-- mejorSegun con foldr1

mejorSegun' :: Foldable t1 => (t2 -> t2 -> Bool) -> t1 t2 -> t2
mejorSegun' f xs = foldr1 (\x y -> if f x y then x else y) xs

-- Devuelve otra de la misma longitud, que tiene en cada posición la suma parcial
-- de los elementos de la lista original desde la cabeza hasta la posición actual

sumasParciales :: Num a => [a] -> [a]
sumasParciales xs = sumasParcialesAux 0 xs

sumasParcialesAux :: Num a => a -> [a] -> [a]
sumasParcialesAux _ [] = []
sumasParcialesAux accu (x:xs) = [accu + x] ++ sumasParcialesAux (accu + x) xs

-- sumasParciales con foldr

sumasParciales' :: (Foldable t, Num a) => t a -> [a]
sumasParciales' xs = foldr (\x accu -> (x : (map (+x) accu))) [] xs

-- sumasParciales con foldl

sumasParciales'' :: Num a => [a] -> [a]
sumasParciales'' xs = foldl (\accu x -> (x : (map (+x) accu))) [] (reverse xs)

-- Realiza la suma alternada de los elementos de una lista

sumaAlt :: Num a => [a] -> a
sumaAlt xs = foldr (-) 0 xs

-- Suma alternada utilizando foldl

sumaAltInvertida :: Num a => [a] -> a
sumaAltInvertida xs = foldl (flip (-)) 0 xs

-- Ejercicio 4

 -- i) Dada una lista devuelve todas sus permutaciones

insertarEnTodasLasPosiciones :: a -> [a] -> [[a]]
insertarEnTodasLasPosiciones el xs = [take x xs ++ [el] ++ drop x xs | x <- [0..length xs]]

permutaciones :: [a] -> [[a]]
permutaciones xs = foldr (\x accu -> concatMap (insertarEnTodasLasPosiciones x) accu) [[]] xs

-- ii) Dada una lista devuelve el conjunto de partes de la misma

--partes [5, 1, 2] → [[], [5], [1], [2], [5, 1], [5, 2], [1, 2], [5, 1, 2]]

partes :: [a] -> [[a]]
partes xs = foldr (\x accu -> accu ++ map (x:) accu) [[]] xs

-- iii) Dada una lista, devuelve todos sus prefijos

--prefijos [5, 1, 2] → [[], [5], [5, 1], [5, 1, 2]]

prefijos :: [a] -> [[a]]
prefijos xs = [take x xs | x <- [0..length xs]]

-- iv) Dada una lista, devuelve todas las listas de elementos que aparecen consecutivos en la lista original

--sublistas [5, 1, 2] → [[], [5], [1], [2], [5, 1], [1, 2], [5, 1, 2]]

sublistas :: [a] -> [[a]]
sublistas xs = foldl (\accu x -> accu ++ map(\y -> y ++ [x]) accu) [[]] xs

-- Ejercicio 5

-- i No es recursión estructural porque no se hace recursión en toda la lista sino sobre tail de xs
elementosEnPosicionesPares :: [a] -> [a]
elementosEnPosicionesPares [] = []
elementosEnPosicionesPares (x:xs) = if null xs then [x] else x : elementosEnPosicionesPares (tail xs)

-- ii Es recursión estructural porque cumple ambas condiciones, la reescribimos con foldr en xs.

entrelazar :: [a] -> [a] -> [a]
entrelazar [] = id
entrelazar (x:xs) = \ys -> if null ys then x : entrelazar xs [] else x : head ys : entrelazar xs (tail ys)

entrelazar' :: [a] -> [a] -> [a]
entrelazar' xs ys = (foldr (\x acu -> \t -> if null t then x : acu t else x : head t : acu (tail t)) id xs) ys

-- Ejercicio 6

-- Recursión primitiva sobre listas
recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

-- a) Dados un elemento y una lista devuelve el resultado de eliminar de la lista la primera aparición del elemento

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna el list = recr(\x xs rec -> if el /= x then x:rec else xs) [] list

-- b) Foldr no es adecuado porque no permite "cortar la ejecucion" y así evitar el resultado de la recursion

-- c) Inserta un elemento en una lista ordenada (de manera creciente), de manera que se preserva el ordenamiento

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado el list = recr(\x xs rec -> if el > x then x:rec else el:x:xs) [] list

-- Ejercicio 7

-- i

-- Genera una lista de una cantidad dada de elementos, a partir de un elemento inicial y de una función de incremento
-- Dicha función de incremento, dado un elemento de la lista, devuelve el elemento siguiente.

genLista :: a -> (a -> a) -> Integer -> [a]
genLista ini f n = foldl (\accu _ -> accu ++ [f (accu !! (length accu - 1))]) [ini] [1..n]

-- ii

-- Definir la función que dado un par de números devuelve una lista de números consecutivos desde el primero hasta el segundo

desdeHasta :: Integer -> Integer -> [Integer]
desdeHasta x y = genLista x (+1) (y - x)

-- Ejercicio 8

-- i

-- Versión de map que toma una función currificada de dos argumentos y una lista de pares
-- de valores, y devuelve la lista de aplicaciones de la función a cada par

mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
mapPares f xs = map (uncurry f) xs

-- Versión con foldr
mapPares' :: Foldable t => (a -> b -> c) -> t (a, b) -> [c]
mapPares' f xs = foldr (\x accum -> uncurry f x : accum) [] xs

-- ii

-- Dadas dos listas arma una lista de pares que contiene, en cada posición, el elemento
-- correspondiente a esa posición en cada una de las listas (similar a ENTRELAZAR)

armarPares :: [a] -> [b] -> [(a, b)]
armarPares xs ys = (foldr (\x acu -> \t -> if null t then acu [] else (x, head t) : acu (tail t)) (const []) xs) ys

--iii

-- Toma una función currificada de dos argumentos y dos listas (de igual longitud), y devuelve
-- una lista de aplicaciones de la función a cada elemento correspondiente de las dos listas

mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f xs ys = (foldr (\x acu -> \t -> f x (head t) : acu (tail t)) (const []) xs) ys

-- Ejercicio 9

-- i

-- Escribir la función sumaMat, que representa la suma de matrices, usando zipWith

-- sumaMat [[1,2,3],[4,5,6],[7,8,9]] [[1,2,3],[4,5,6],[7,8,9]]
-- [[2,4,6],[8,10,12],[14,16,18]]

sumaMat :: Num a => [[a]] -> [[a]] -> [[a]]
sumaMat xs ys = zipWith (zipWith (+)) xs ys

-- ii

-- Escribir la función trasponer que dada una matriz devuelva su traspuesta

-- trasponer [[1,2,3],[4,5,6]]
-- [[1,4],[2,5],[3,6]]

trasponer :: [[a]] -> [[a]]
trasponer xs = foldr (\x accu -> zipWith (:) x accu) (replicate (length (head xs)) []) xs

-- Ejercicio 10

generate :: ([a] -> Bool) -> ([a] -> a) -> [a]
generate stop next = generateFrom stop next []

generateFrom :: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a]
generateFrom stop next xs | stop xs = init xs
                          | otherwise = generateFrom stop next (xs ++ [next xs])

-- i

-- Usando generate, definir generateBase similar a generate pero con un caso base para el elemento inicial
-- y una función que calcula el siguiente elemento en base a el último elemento

generateBase :: ([a] -> Bool) -> a -> (a -> a) -> [a]
generateBase stop base next = generate stop (\xs -> if null xs then base else next (last xs))

-- ii

-- Dado un entero n genera la lista de los primeros n factoriales

-- factoriales 10
-- [1,1,2,6,24,120,720,5040,40320,362880]

factoriales :: Int -> [Int]
factoriales n = generate (\xs -> length xs == n + 1) (\x -> if null x then 1 else (last x) * (length x))

-- iii

-- Toma un entero n, una función f y un elemento inicial x, y devuelve la lista
-- [x, f x, f (f x), ..., f ( ...(f x) ...)] de longitud n

-- iterateN 5 (+1) 0
-- [0,1,2,3,4]

iterateN :: Int -> (a -> a) -> a -> [a]
iterateN n f x = generateBase (\xs -> length xs > n) x f

-- iv

-- Redefinir generateFrom usando iterate y takeWhile

generateFrom' :: ([a] -> Bool) -> ([a] -> a) -> [a] -> [a]
generateFrom' stop next xs = generateFrom stop next xs

-- Ejercicio 11

-- i

-- Definir y dar el tipo del esquema de recursión foldNat sobre los naturales. Utilizar el tipo Integer de Haskell

foldNat :: (Integer -> b -> b) -> b -> Integer -> b
foldNat _ z 0 = z
foldNat f z n = f n (foldNat f z (n - 1))

-- ii

-- Utilizando foldNat definir la función potencia

-- potencia 2 5
-- 32

potencia :: Integer -> Integer -> Integer
potencia x y = foldNat (\_ accu -> x * accu) 1 y

-- Ejercicio 12

-- Definir el esquema de recursión

data Polinomio a = X --CASO BASE
                 | Cte a -- CASO BASE
                 | Suma (Polinomio a) (Polinomio a) -- Caso Recursivo
                 | Prod (Polinomio a) (Polinomio a) -- Caso Recursivo

foldPolinomio :: (a -> b) -> b -> (b -> b -> b) -> (b -> b -> b) -> Polinomio a -> b
foldPolinomio _ z _ _ X = z
foldPolinomio f _ _ _ (Cte x) = f x
foldPolinomio f z s p (Suma x y) = s (foldPolinomio f z s p x) (foldPolinomio f z s p y)
foldPolinomio f z s p (Prod x y) = p (foldPolinomio f z s p x) (foldPolinomio f z s p y)

-- Usar el esquema para escribir la función evaluar

-- evaluar 2 (Suma (Cte 3) (Prod X (Cte 2)))
-- 7

evaluar :: Num a => a -> Polinomio a -> a
evaluar x = foldPolinomio id x (+) (*)

-- Ejercicio 13

-- data AB a = Empty | Bin (AB a) a (AB a)

-- i

-- Usando recursión explícita, definir los esquemas de recursión estructural

foldAB :: (b -> a -> b -> b) -> b -> AB a -> b
foldAB _ z Empty = z
foldAB f z (Bin izq root der) = f (foldAB f z izq) root (foldAB f z der)

-- Usando recursión explícita, definir los esquemas de recursión primitiva

recAB :: (AB a -> b -> a -> b -> b) -> b -> AB a -> b
recAB _ z Empty = z
recAB f z (Bin izq root der) = f (Bin izq root der) (recAB f z izq) root (recAB f z der)

-- ii

-- Definir las funciones esNil, altura y cantNodos

esNil :: AB a -> Bool
esNil = foldAB (\_ _ _ -> False) True

altura :: AB a -> Int
altura = foldAB (\izq _ der -> 1 + max izq der) 0

cantNodos :: AB a -> Int
cantNodos = foldAB (\izq _ der -> 1 + izq + der) 0

-- iii

-- Definir la función mejorSegún análoga a la del ejercicio 3, para árboles

mejorSegunAB :: (a -> a -> Bool) -> AB a -> a
mejorSegunAB _ Empty = error "Empty tree"
mejorSegunAB f (Bin izq root der) = foldAB (\izq' root' der' -> mejorSegunEntreTres f izq' root' der') root (Bin izq root der)

mejorSegunEntreTres :: (a -> a -> Bool) -> a -> a -> a -> a
mejorSegunEntreTres f izq root der = if f root izq && f root der then root else if f izq der then izq else der

-- iv

-- Chequea si un árbol es un árbol binario de búsqueda

esABB :: AB Int -> Bool
esABB ab = recAB (\tree izq _ der -> izq && der && esABBAux tree) True ab

esABBAux :: AB Int -> Bool
esABBAux Empty = True
esABBAux (Bin Empty _ Empty) = True
esABBAux (Bin Empty root (Bin _ subroot _)) = root < subroot
esABBAux (Bin (Bin _ subroot _) root Empty) = root > subroot
esABBAux (Bin (Bin _ subrootleft _) root (Bin _ subrootright _)) = root > subrootleft && root < subrootright

-- Ejercicio 14

-- i

ramas :: AB a -> [[a]]
ramas tree = foldAB (\izq root der -> if null izq && null der then [[root]] else map (root:) (izq ++ der)) [] tree

cantHojas :: AB a -> Int
cantHojas tree = foldAB (\izq _ der -> if izq == 0 && der == 0 then 1 else izq + der) 0 tree

espejo :: AB a -> AB a
espejo tree = foldAB (\izq root der -> Bin der root izq) Empty tree

-- ii ?

-- mismaEstructura :: AB a -> AB b -> Bool

-- Ejercicio 15

data AIH a = Hoja a | Bin' (AIH a) (AIH a)

-- a

foldAIH :: (b -> b -> b) -> (a -> b) -> AIH a -> b
foldAIH _ fHoja (Hoja x) = fHoja x
foldAIH fArbol fHoja (Bin' izq der) = fArbol (foldAIH fArbol fHoja izq) (foldAIH fArbol fHoja der)

-- b

-- alturaAIH (Bin' (Bin' (Guide_1.Hoja 4) (Guide_1.Hoja 5)) (Bin' (Guide_1.Hoja 1) (Bin' (Guide_1.Hoja 2) (Guide_1.Hoja 3))))
-- 4

alturaAIH :: AIH a -> Int
alturaAIH = foldAIH (\izq der -> 1 + max izq der) (\_ -> 1)

-- tamañoAIH (Bin' (Bin' (Guide_1.Hoja 4) (Guide_1.Hoja 5)) (Bin' (Guide_1.Hoja 1) (Bin' (Guide_1.Hoja 2) (Guide_1.Hoja 3))))
-- 5

tamañoAIH :: AIH a -> Int
tamañoAIH = foldAIH (+) (\_ -> 1)

-- c ?

-- Definir la lista (infinita) de todos los AIH cuyas hojas tienen tipo unit

-- Ejercicio 16

-- i

-- Árboles no vacíos, con una cantidad indeterminada de hijos para cada nodo

data RoseTree a = RoseTree a [RoseTree a]

-- ii

foldRT :: (a -> [b] -> b) -> RoseTree a -> b
foldRT f (RoseTree root children) = f root (map (foldRT f) children)

-- iii

-- a

-- Devuelve una lista con sus hojas ordenadas de izquierda a derecha según el orden en que aparecen en el árbol

-- hojasRT RoseTree 1 [RoseTree 2 [RoseTree 3 []], RoseTree 4 [RoseTree 6 []], RoseTree 5 []]
-- [3,6,5]

hojasRT :: RoseTree a -> [a]
hojasRT rt = foldRT (\root children -> if null children then [root] else concat children) rt

-- b

-- Dado un RoseTree, devuelva las distancias de su raíz a cada una de sus hojas

-- distanciasRT RoseTree 1 [RoseTree 2 [RoseTree 3 []], RoseTree 4 [RoseTree 6 []], RoseTree 5 []]
-- [2,2,1]

distanciasRT :: RoseTree a -> [Int]
distanciasRT rt = foldRT (\_ children -> if null children then [1] else map (+1) (concat children)) rt

-- c

-- Devuelve la altura de un RoseTree (la cantidad de nodos de la rama más larga

-- alturaRT RoseTree 1 [RoseTree 2 [RoseTree 3 []], RoseTree 4 [RoseTree 6 []], RoseTree 5 []]
-- 3

alturaRT :: RoseTree a -> Int
alturaRT rt = foldRT (\_ children -> if null children then 1 else 1 + maximum children) rt


-- Ejercicio de Parcial

data AT a = NilT | Tri a (AT a) (AT a) (AT a)

-- at1 = Tri 1 (Tri 2 NilT NilT NilT) (Tri 3 (Tri 4 NilT NilT NilT) NilT NilT) (Tri 5 NilT NilT NilT)

-- a) Dar el tipo y definir la función foldAT que implementa el esquema de recursión estructural

foldAT :: (a -> b -> b -> b -> b) -> b -> AT a -> b
foldAT _ z NilT = z
foldAT f z (Tri root izq med der) = f root (foldAT f z izq) (foldAT f z med) (foldAT f z der)

-- b) Definir la función preorder :: AT a -> [a], que lista los nodos de un árbol ternario en el orden
-- en que aparecen: primero la raíz, despuás los nodos del subárbol izquierdo, luego los del medio y
-- finalmente los del derecho.

-- preorder at1
-- [1, 2, 3, 4, 5].

preorder :: AT a -> [a]
preorder = foldAT (\root izq med der -> [root] ++ izq ++ med ++ der) []

-- c) Definir la función mapAT :: (a -> b) -> AT a -> AT b, que aplica una función a todos los nodos de un árbol ternario

mapAT :: (a -> b) -> AT a -> AT b
mapAT _ NilT = NilT
mapAT f (Tri root izq med der) = Tri (f root) (mapAT f izq) (mapAT f med) (mapAT f der)

-- d) Definir la función nivel :: AT a -> Int -> [a], que devuelve la lista de nodos del nivel correspondiente
-- del árbol, siendo 0 el nivel de la raíz.

-- nivel at1 1
-- [2, 3, 5].

nivel :: AT a -> Int -> [a]
nivel aTri n = foldAT (\root izq med der level ->
                        if level == 0
                        then [root]
                        else if level > 0
                             then izq (level - 1) ++ med (level - 1) ++ der (level - 1)
                             else []) (const []) aTri n


-- Ejercicio 17

-- [x | x<-[1..3], y<-[x..3]]
-- [1,1,1,2,2,3]

-- [x | x<-[1..3], y<-[x..3], (x+y) `mod` 3 == 0]
-- [1,3]

-- Lista de valores de x tal x pertenece a [1..3] y y pertenece a [x..3] y la suma de x e y es divisible por 3.









