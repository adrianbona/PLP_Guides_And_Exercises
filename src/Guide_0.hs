module Guide_0 (
valorAbsoluto,
bisiesto,
factorial,
divisores,
esPrimo,
cantDivisoresPrimos,
inverso,
aEntero,
limpiar,
limpiarB,
difPromedio,
promedio,
todosIguales,
AB(Empty, Bin),
vacioAB,
negacionAB,
productoAB
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

-- d [cantDivisoresPrimos x | x <- [1..10]]
cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos x = length (filter esPrimo (divisores x))

-- [esPrimo x | x <- [1..10]]
esPrimo :: Int -> Bool
esPrimo x = x > 1 && length (divisores x) == 2

-- [divisores  x | x <- [1..10]]
divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], mod n x == 0]

-- Ejercicio 3

-- data Maybe a = Nothing | Just a
-- data Either a b = Left a | Right b

-- a [inverso x | x <- [0..10]]
inverso :: Float -> Maybe Float
inverso 0 = Nothing
inverso x = Just (1/x)

-- b [aEntero  Left x | x <- [0..10]]
aEntero :: Either Int Bool -> Int
aEntero (Left x) = x
aEntero (Right x) = if x then 1 else 0

-- Ejercicio 4

-- a
limpiar :: String -> String -> String
limpiar _ [] = []
limpiar s1 (x:xs) = if elem x s1 then limpiar s1 xs else (x:(limpiar s1 xs))

limpiarB :: String -> String -> String
limpiarB s1 s2 = filter(\s -> not (elem s s1)) s2

-- b
difPromedio :: [Float] -> [Float]
difPromedio xs = map (\x -> x - average) xs where average = promedio xs

promedio :: [Float] -> Float
promedio [] = 0
promedio xs = sum xs / fromIntegral (length xs)

-- c
todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales (_:[]) = True
todosIguales (x:xs) = x == head xs && todosIguales xs

-- Ejercicio 5

data AB a = Empty | Bin (AB a) a (AB a)

-- a
vacioAB :: AB a -> Bool
vacioAB Empty = True
vacioAB (Bin _ _ _) = False

-- b
negacionAB :: AB Bool -> AB Bool
negacionAB Empty = Empty
negacionAB (Bin left root right) = Bin (negacionAB left) (not root) (negacionAB right)

-- c
productoAB :: AB Int -> Int
productoAB Empty = 1
productoAB (Bin left root right) = (productoAB left) * root * (productoAB right)
