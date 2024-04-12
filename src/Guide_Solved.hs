module Guide_Solved (
  Punto,
  puntosDelPlano,
  Arbol(..),
  foldAB,
  hojas,
  espejo,
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