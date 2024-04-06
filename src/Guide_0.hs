module Guide_0 (
valorAbsoluto,
bisiesto,
factorial,
divisores,
esPrimo,
cantDivisoresPrimos
) where

-- Ejercicio 1

-- :t null
-- null :: Foldable t => t a -> Bool
-- Dado un a de tipo plegable, devuelve True si contiene al menos un elemento

-- :t head
-- head :: GHC.Stack.Types.HasCallStack => [a] -> a
-- Dada una lista no-vacía devuelve el primer elemento

-- :t tail
-- tail :: GHC.Stack.Types.HasCallStack => [a] -> [a]
-- Dada una lista no-vacía devuelve la misma lista sin el primer elemento

-- :t init
-- init :: GHC.Stack.Types.HasCallStack => [a] -> [a]
-- Dada una lista no-vacía devuelve la misma lista sin el último elemento

-- :t last
-- last :: GHC.Stack.Types.HasCallStack => [a] -> a
-- Dada una lista no-vacía devuelve el último elemento

-- :t take
-- take :: Int -> [a] -> [a]
-- Dados un n y una lista devuelve los primeros n elementos

-- :t drop
-- drop :: Int -> [a] -> [a]
-- Dados un n y una lista devuelve la misma lista sin los primeros n elementos

-- :t (++)
-- (++) :: [a] -> [a] -> [a]
-- Dadas dos listas del mismo tipo las concatena generando una nueva lista

-- :t concat
-- concat :: Foldable t => t [a] -> [a]
-- Dada una lista de lista de elementos plegables del mismo tipo, devuelve una lista

-- :t (!!)
-- (!!) :: GHC.Stack.Types.HasCallStack => [a] -> Int -> a
-- Dada una lista y un n devuelve el elemento de la posición n

-- :t elem
-- elem :: (Foldable t, Eq a) => a -> t a -> Bool
-- Dados un elemento y una lista plegable del mismo tipo, devuelve True si elemento se encuentra en la lista

-- Ejercicio 2

-- a
valorAbsoluto :: Float -> Float
valorAbsoluto x = if x >= 0 then x else x * (-1)

-- b
bisiesto :: Int -> Bool
bisiesto x | mod x 4 == 0 && mod x 100 /= 0 = True
           | mod x 100 == 0 && mod x 400 == 0 = True
           | otherwise = False

-- c
factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

-- d
cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos x = length (filter esPrimo (divisores x))

esPrimo :: Int -> Bool
esPrimo x = x > 1 && length (divisores x) == 2

divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], mod n x == 0]