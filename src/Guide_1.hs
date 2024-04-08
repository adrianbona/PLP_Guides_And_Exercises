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
sumasParcialesAux accu (x:[]) = [accu + x]
sumasParcialesAux accu (x:xs) = [accu + x] ++ sumasParcialesAux (accu + x) xs

-- sumasParciales con foldr
sumasParciales' :: (Foldable t, Num a) => t a -> [a]
sumasParciales' xs = foldr (\x accu -> (x : (map (+x) accu))) [] xs

-- sumasParciales con foldl
sumasParciales'' :: Num a => [a] -> [a]
sumasParciales'' xs = foldl (\accu x -> (x : (map (+x) accu))) [] (reverse xs)

-- sumaAlt :: Num a => [a] -> a
-- sumaAlt xs = foldr (-) 0 xs

-- sumaAltInvertida :: Num a => [a] -> a
-- sumaAltInvertida xs = foldl (flip (-)) 0 xs

-- --EJERCICIO 5

-- --i No es recursion estructural porque no se hace recursion en toda la lista sino sobre tail de xs

-- --ii Es recursion estructural porque cumple ambas condiciones, la reescribimos con foldr en xs

-- --EJERCICIO 6

-- recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
-- recr _ z [] = z
-- recr f z (x : xs) = f x xs (recr f z xs)

-- --a

-- sacarUna :: Eq a => a -> [a] -> [a]
-- sacarUna el list = recr(\x xs rec -> if el/=x then x:rec else xs) [] list

-- --b

-- --No es adecuado porque no permite "cortar la ejecucion", evitar el resultado de la recursion

-- --c

-- insertarOrdenado :: Ord a => a -> [a] -> [a]
-- insertarOrdenado el list = recr(\x xs rec -> if el>x then x:rec else el:x:xs) [] list

-- --EJERCICIO 8

-- --i

-- mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
-- mapPares f xs = map (uncurry f) xs
-- mapPares' f xs = foldr (\x accum -> uncurry f x : accum) [] xs

-- --ii

-- --armarPares :: [a] -> [b] -> [(a,b)]

-- --iii

-- --mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]