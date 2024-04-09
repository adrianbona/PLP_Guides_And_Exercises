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
  elementosEnPosicionesPares,
  entrelazar,
  entrelazar',
  recr,
  sacarUna,
  insertarOrdenado,
  mapPares,
  mapPares',
  armarPares,
  mapDoble,
) where

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

-- Ejercicio 8

-- atcliente@correoargentino.com.ar

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