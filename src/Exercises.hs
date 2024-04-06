module Exercises (suma) where

suma :: [Int] -> Int
suma [] = 0
suma (x:xs) = x + suma xs

suma' xs = foldr (+) 0 xs

elemo :: Int -> [Int] -> Bool
elemo a [] = False
elemo a (x:xs) = a == x || elemo a xs

elemo' a b = foldr (\x y -> (x == a || y)) False b

filtra :: (Int -> Bool) -> [Int] -> [Int]
filtra _ [] = []
filtra f (x:xs) = if f x then x : filtra f xs else filtra f xs

filtra' f xs = foldr (\x accum -> if f x then x : accum else accum) [] xs

mapea :: (a -> b) -> [a] -> [b]
mapea _ [] = []
mapea f (x:xs) = f x : mapea f xs

mapea' f xs = foldr (\x accum -> f x : accum) [] xs

mejorSegun :: (a -> a -> Bool) -> [a] -> a
mejorSegun f (x:[]) = x
mejorSegun f (x:y:ys) = if f x y then mejorSegun f (x:ys) else mejorSegun f (y:ys)

mejorSegun' f xs = foldr1 (\x y -> if f x y then x else y) xs

--Version con funcion auxiliar
sumasParciales :: Num a => [a] -> [a]
sumasParciales xs = sumasParcialesAux 0 xs

sumasParcialesAux :: Num a => a -> [a] -> [a]
sumasParcialesAux accu (x:[]) = [accu + x]
sumasParcialesAux accu (x:xs) = [accu + x] ++ sumasParcialesAux (accu + x) xs

--Version con foldl
sumasParciales' xs = tail (foldl (\accu x -> accu ++ [x + (last accu)]) [0] xs)

--Version con foldr
sumasParciales'' xs = foldr (\x accu -> (x : (map (+x) accu))) [] xs

sumaAlt :: Num a => [a] -> a
sumaAlt xs = foldr (-) 0 xs

sumaAltInvertida :: Num a => [a] -> a
sumaAltInvertida xs = foldl (flip (-)) 0 xs

--EJERCICIO 5

--i No es recursion estructural porque no se hace recursion en toda la lista sino sobre tail de xs

--ii Es recursion estructural porque cumple ambas condiciones, la reescribimos con foldr en xs

--EJERCICIO 6

recr :: (a -> [a] -> b -> b) -> b -> [a] -> b
recr _ z [] = z
recr f z (x : xs) = f x xs (recr f z xs)

--a

sacarUna :: Eq a => a -> [a] -> [a]
sacarUna el list = recr(\x xs rec -> if el/=x then x:rec else xs) [] list

--b

--No es adecuado porque no permite "cortar la ejecucion", evitar el resultado de la recursion

--c

insertarOrdenado :: Ord a => a -> [a] -> [a]
insertarOrdenado el list = recr(\x xs rec -> if el>x then x:rec else el:x:xs) [] list

--EJERCICIO 8

--i

mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
mapPares f xs = map (uncurry f) xs
mapPares' f xs = foldr (\x accum -> uncurry f x : accum) [] xs

--ii

--armarPares :: [a] -> [b] -> [(a,b)]

--iii

--mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]