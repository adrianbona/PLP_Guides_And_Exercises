module Guide_Solved (
  Punto,
  puntosDelPlano,
  Arbol(..),
  foldAB,
  hojas,
  espejo,
  ramas,
  foldr2,
  Matriz,
  col,
  productoEntreMatrices,
) where

-- Ejercicio 1

-- Contenga todos los puntos del cuadrante superior derecho del plano

type Punto = (Int,Int)

puntosDelPlano :: [Punto]
puntosDelPlano = [(x,y) | k <- [0..10], x <- [0..k], y <- [0..k], x + y == k]

-- Ejercicio 2

data Arbol a = Hoja a | Bin (Arbol a) a (Arbol a)

-- i

-- Esquema de recursión estructural: fHoja -> fBin -> Arbol -> Resultado
foldAB :: (a -> b) -> (b -> a -> b -> b) -> Arbol a -> b
foldAB f _ (Hoja n) = f n
foldAB f g (Bin t1 n t2) = g (foldAB f g t1) n (foldAB f g t2)

-- ii

-- Devuelve todas las hojas de un árbol
-- hojas (Guide_Solved.Bin (Hoja 2) 1 (Guide_Solved.Bin (Hoja 4) 3 (Hoja 5)))
-- [2,1,4,3,5]

hojas :: Arbol a -> [a]
hojas tree = foldAB (\x -> [x]) (\t1 n t2 -> t1 ++ [n] ++ t2) tree

-- iii

-- Devuelve el árbol que resulte de invertir en todos los niveles el subárbol izquierdo por el derecho
-- espejo (Guide_Solved.Bin (Hoja 3) 5 (Guide_Solved.Bin (Hoja 7) 8 (Hoja 1)))
-- Bin (Bin (Hoja 1) 8 (Hoja 7)) 5 (Hoja 3)


espejo :: Arbol a -> Arbol a
espejo tree = foldAB (\n -> Hoja n) (\t1 n t2 -> Bin t2 n t1) tree

-- iv

-- Devuelve la lista de ramas de un árbol
-- ramas (Guide_Solved.Bin (Hoja 3) 5 (Guide_Solved.Bin (Hoja 7) 8 (Guide_Solved.Bin (Hoja 2) 1 (Hoja 4))))
-- [[5,3],[5,8,7],[5,8,1,2],[5,8,1,4]]

ramas :: Arbol a -> [[a]]
ramas tree = foldAB (\r -> [[r]]) (\t1 r t2 ->  (map (r:) t1) ++ (map (r:) t2)) tree

-- Ejercicio 4

-- i

-- Similar a foldr, pero trabaja sobre dos listas en lugar de una
-- foldr2 (\x y b -> (x,y):b) [] [1,2,3] ["a","b","c"]
-- [(1,"a"),(2,"b"),(3,"c")]

foldr2:: (a -> b -> c -> c) -> c -> [a] -> [b] -> c
foldr2 _ _ [] (_:_) = error "Lists should have the same length"
foldr2 _ _ (_:_) [] = error "Lists should have the same length"
foldr2 _ z [] [] = z
foldr2 f z (x:xs) (y:ys) = f x y (foldr2 f z xs ys)

-- ii

-- Utilizando foldr2 y listas por comprensión, y sin utilizar recursión explícita,
-- definir el operador que toma dos matrices y devuelve el producto entre ellas

-- productoEntreMatrices [[1,2],[4,5],[7,8]] [[1,2,3],[4,5,6]]
-- [[9,12,15],[24,33,42],[39,54,69]]

type Matriz a = [[a]]

col :: Int -> Matriz a -> [a]
col i = map (!!i)

fila :: Int -> Matriz a -> [a]
fila i = (!!i)

multiplicarFilaPorColumna :: Num a => [a] -> [a] -> a
multiplicarFilaPorColumna xs ys = foldr2 (\x y z -> x * y + z) 0 xs ys

productoEntreMatrices :: Num a => Matriz a -> Matriz a -> Matriz a
productoEntreMatrices m1 m2 = [[multiplicarFilaPorColumna (fila j m1) (col i m2) | i <- [0.. length (head m2) - 1]] | j <- [0.. length m1 - 1]]