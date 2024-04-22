module Guide_2 (
  intercambiar,
  espejar,
  asociarI,
  asociarD,
) where

-- Ejercicio 1

intercambiar :: (a,b) -> (b,a)
intercambiar (x,y) = (y,x) --{INT}

espejar :: Either a b -> Either b a
espejar (Left x) = Right x --{E1}
espejar (Right x) = Left x --{E2}

asociarI :: (a,(b,c)) -> ((a,b),c)
asociarI (x,(y,z)) = ((x,y),z) --{AI}

asociarD :: ((a,b),c) -> (a,(b,c))
asociarD ((x,y),z) = (x,(y,z)) --{AD}

-- flip :: (a -> b -> c) -> b -> a -> c
-- flip f x y = f y x {F}

-- curry :: ((a,b) -> c) -> a -> b -> c
-- curry f x y = f (x,y) {CU}

-- uncurry :: (a -> b -> c) -> (a,b) -> c
-- uncurry f (x,y) = f x y {UC}

-- const :: a -> b -> a
-- const x _ = x {CO}

-- id :: a -> a
-- id x = x {ID}

-- Extensionalidad para pares
-- Si p :: (a, b), entonces ∃x :: a. ∃y :: b. p = (x, y).
-- data Either a b = Left a | Right b

-- Extensionalidad para sumas
-- Si e :: Either a b, entonces:
-- o bien ∃x :: a. e = Left x
-- o bien ∃y :: b. e = Right b


-- i. ∀ p::(a,b) . intercambiar (intercambiar p) = p

-- intercambiar (intercambiar (x,y)) por {reemplazo}
-- intercambiar (y,x) por {INT}
-- (x,y) por {INT}
-- p {queda demostrada la igualdad}

-- ii. ∀ p::(a,(b,c)) . asociarD (asociarI p) = p

-- asociarD (asociarI (x,(y,z))) por {reemplazo}
-- asociarD ((x,y),z) {AI}
-- (x,(y,z)) {AD}
-- p {queda demostrada la igualdad}

-- iii. ∀ p::Either a b . espejar (espejar p) = p

-- Caso donde: p = Left x
-- espejar (espejar (Left x)) {reemplazo}
-- espejar (Right x) {E1}
-- Left x {E1}
-- p {queda demostrada la igualdad}

-- Caso donde: p = Right x
-- espejar (espejar (Right x)) {reemplazo}
-- espejar (Left x) {E2}
-- Right x {E2}
-- p {queda demostrada la igualdad}

-- iv. ∀ f::a->b->c . ∀ x::a . ∀ y::b . flip (flip f) x y = f x y

-- flip (flip f) x y
-- flip f y x por {F}
-- f x y {F}
-- f x y {queda demostrada la igualdad}

-- v. ∀ f::a->b->c . ∀ x::a . ∀ y::b . curry (uncurry f) x y = f x y

-- curry (uncurry f) x y
-- uncurry f (x,y) {CU}
-- f x y {UC}
-- f x y {queda demostrada la igualdad}

-- Ejercicio 2

-- i. flip . flip = id

-- ∀p :: (a, b). (flip . flip) p = id p
-- flip (flip p) {.}
-- flip (flip (x, y)) {reemplazo}
-- flip y x {F}
-- x y {reemplazo}
-- p {ID}
-- id p {queda demostrada la igualdad}

-- ii. ∀ f::(a,b)->c . uncurry (curry f) = f

-- uncurry (curry f) {CU}
-- uncurry (\x y -> f (x, y)) {UC}
-- (\(x', y') -> (\x y -> f (x, y))) x' y') {reemplazo}
-- (\(x', y') -> f (x', y')) {nu}
-- f {queda demostrada la igualdad}

-- iii. flip const = const id

-- ∀ x::a . ∀ y::b . flip const x y = const id x y
-- flip const x y {F}
-- const y x {CO}
-- ?

-- iv. ∀ f::a->b . ∀ g::b->c . ∀ h::c->d . ((h . g) . f) = (h . (g . f))
-- Sea la definición de la composición: (.) f g x = f (g x)

-- ((h . g) . f) x {.}
-- (h . g) (f x) {reemplazo}
-- h (g (f x)) {.}
-- (h . (g . f)) x {reemplazo}
-- (h . (g . f)) {queda demostrada la igualdad}

-- Ejercicio 3

-- Considerar las siguientes funciones

-- length :: [a] -> Int
-- length [] = 0 {L0}
-- length (x:xs) = 1 + length xs {L1}

-- duplicar :: [a] -> [a]
-- duplicar [] = [] {D0}
-- duplicar (x:xs) = x : x : duplicar xs {D1}

-- append :: [a] -> [a] -> [a]
-- append [] ys = ys {A0}
-- append (x:xs) ys = x : append xs ys {A1}

-- (++) :: [a] -> [a] -> [a]
-- xs ++ ys = foldr (:) ys xs {++}

-- ponerAlFinal :: a -> [a] -> [a]
-- ponerAlFinal x = foldr (:) (x:[]) {P0}

-- reverse :: [a] -> [a]
-- reverse = foldl (flip (:)) [] {R0}

-- Agregadas y utilizadas en demostraciones posteriores

-- map :: (a -> b) -> [a] -> [b]
-- map f = foldr ((:) . f) [] {M0}

-- filter :: (a -> Bool) -> [a] -> [a]
-- filter p = foldr (\x xs -> if p x then x : xs else xs) [] {F0}

-- elem :: Eq a => a -> [a] -> Bool
-- elem e = foldr (\x b -> b || x == e) False {E0}

-- head :: [a] -> a
-- head (x:_) = x {H0}

-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr f z [] = z {FR0}
-- foldr f z (x:xs) = f x (foldr f z xs) {FR1}

-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- foldl f z [] = z {FL0}
-- foldl f z (x:xs) = foldl f (f z x) xs {FL1}

-- (:) :: a -> [a] -> [a]
-- x : xs = foldr (:) [x] xs {:}


-- Demostrar las siguientes propiedades

-- i. ∀ xs::[a] . length (duplicar xs) = 2 * length xs

-- Predicado unario: P(xs) = length (duplicar xs) = 2 * length xs

-- Caso base: P([]) =
-- length (duplicar []) = 2 * length [] {D0}
-- length [] = 2 * length [] {L0}
-- 0 = 0 {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = length (duplicar xs) = 2 * length xs
-- Caso inductivo: P(x:xs) = ∀ x :: a . ∀ xs :: [a] . length (duplicar (x:xs)) = 2 * length (x:xs)

-- length (duplicar (x:xs)) = 2 * length (x:xs) {D1}
-- length (x : x : duplicar xs) = 2 * length (x:xs) {L1}
-- 1 + length (x : duplicar xs) = 2 * length (x:xs) {L1}
-- 2 + length (duplicar xs) = 2 * length (x:xs) {HI}
-- 2 + 2 * length xs = 2 * length (x:xs) {L1}
-- 2 + 2 * length xs = 2 * (1 + length xs) {aritmética}
-- 2 + 2 * length xs = 2 + 2 * length xs {queda demostrada la igualdad}

-- ii. ∀ xs::[a] . ∀ ys::[a] . length (append xs ys) = length xs + length ys

-- Predicado unario: P(xs) = ∀ ys::[a] . length (append xs ys) = length xs + length ys

-- Caso base: P([]) =
-- ∀ ys::[a] . length (append [] ys) = length [] + length ys {A0}
-- ∀ ys::[a] . length ys = length [] + length ys {L0}
-- ∀ ys::[a] . length ys = length ys {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ xs::[a] . ∀ ys::[a] . length (append xs ys) = length xs + length ys
-- Caso inductivo: P(x:xs) = ∀ x :: a . ∀ xs :: [a] . ∀ ys::[a] . length (append (x:xs) ys) = length (x:xs) + length ys

-- ∀ ys::[a] . length (append (x:xs) ys) = length (x:xs) + length ys {A1}
-- ∀ ys::[a] . length (x : append xs ys) = length (x:xs) + length ys {L1}
-- ∀ ys::[a] . 1 + length (append xs ys) = length (x:xs) + length ys {L1}
-- ∀ ys::[a] . 1 + length (append xs ys) = 1 + length xs + length ys {HI}
-- ∀ ys::[a] . length xs + length ys = length xs + length ys {queda demostrada la igualdad}

-- iii. ∀ xs::[a] . ∀ f::(a->b) . length (map f xs) = length xs

-- Predicado unario: P(xs) = ∀ f::(a->b) . length (map f xs) = length xs

-- Caso base: P([]) =
-- ∀ f::(a->b) . length (map f []) = length [] {M0}
-- ∀ f::(a->b) . length [] = length [] {L0}
-- 0 = 0 {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ xs::[a] . ∀ f::(a->b) . length (map f xs) = length xs
-- Caso inductivo: P(x:xs) = ∀ x :: a . ∀ xs :: [a] . ∀ f::(a->b) . length (map f (x:xs)) = length (x:xs)

-- ∀ f::(a->b) . length (map f (x:xs)) = length (x:xs) {M0}
-- ∀ f::(a->b) . length ((:) (f x) (map f xs)) = length (x:xs) {L1}
-- ∀ f::(a->b) . 1 + length (map f xs) = length (x:xs) {HI}
-- ∀ f::(a->b) . 1 + length xs = length (x:xs) {L1}
-- 1 + length xs = 1 + length xs {aritmética}
-- length xs = length xs {queda demostrada la igualdad}

-- iv. ∀ xs::[a] . ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True) (asumiendo Eq a)

-- Predicado unario: P(xs) = ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True)

-- Caso base: P([]) =
-- ∀ p::a->Bool . ∀ e::a . (elem e (filter p []) = True) ⇒ (elem e [] = True) {F0}
-- ∀ p::a->Bool . ∀ e::a . (elem e [] = True) ⇒ (elem e [] = True) {E0}
-- ∀ p::a->Bool . ∀ e::a . False ⇒ (elem e [] = True) {queda demostrada la implicación}

-- Hipótesis inductiva: P(xs) = ∀ xs::[a] . ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True)
-- Caso inductivo: P(x:xs) = ∀ x :: a . ∀ xs :: [a] . ∀ p::a->Bool . ∀ e::a . (elem e (filter p (x:xs)) = True) ⇒ (elem e (x:xs) = True)

-- ∀ p::a->Bool . ∀ e::a . (elem e (filter p (x:xs)) = True) ⇒ (elem e (x:xs) = True) {F0}
-- ∀ p::a->Bool . ∀ e::a . (elem e (if p x then x : filter p xs else filter p xs) = True) ⇒ (elem e (x:xs) = True) {abrimos en casos)

-- La función p aplicada a x puede devolver True o False, por lo que se deben considerar ambos casos:

-- Caso 1: p x = True
-- ∀ p::a->Bool . ∀ e::a . (elem e (x : filter p xs) = True) ⇒ (elem e (x:xs) = True) {E0}
-- ∀ p::a->Bool . ∀ e::a . (e == x || elem e (filter p xs) = True) ⇒ (elem e (x:xs) = True) {HI}
-- ∀ p::a->Bool . ∀ e::a . (e == x || elem e xs = True) ⇒ (elem e (x:xs) = True) {E0}
-- ∀ p::a->Bool . ∀ e::a . (e == x || elem e xs = True) ⇒ (e == x || elem e xs = True) {queda demostrada la implicación}

-- Caso 2: p x = False
-- ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True) {HI}
-- ∀ p::a->Bool . ∀ e::a . (elem e xs = True) ⇒ (elem e xs = True) {queda demostrada la implicación}

-- v. ∀ xs::[a] . ∀ x::a . length (ponerAlFinal x xs) = 1 + length xs

-- Predicado unario: P(xs) = ∀ x::a . length (ponerAlFinal x xs) = 1 + length xs

-- Caso base: P([]) =
-- ∀ x::a . length (ponerAlFinal x []) = 1 + length [] {P0}
-- ∀ x::a . length (foldr (:) (x:[]) []) = 1 + length [] {FR0}
-- ∀ x::a . length (x:[]) = 1 + length [] {L0}
-- ∀ x::a . 1 = 1 {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ y::a . length (ponerAlFinal y xs) = 1 + length xs
-- Caso inductivo: P(x:xs) = ∀ y :: a . length (ponerAlFinal y (x:xs)) = 1 + length (x:xs)

-- ∀ y::a . length (ponerAlFinal y (x:xs)) = 1 + length (x:xs) {P0}
-- ∀ y::a . length (foldr (:) (y:[]) (x:xs)) = 1 + length (x:xs) {FR1}
-- ∀ y::a . length (y : foldr (:) (y:[]) xs) = 1 + length (x:xs) {L1}
-- ∀ y::a . 1 + length (foldr (:) (y:[]) xs) = 1 + length (x:xs) {P0}
-- ∀ y::a . 1 + length (ponerAlFinal y xs) = 1 + length (x:xs) {HI}
-- 1 + 1 + length xs = 1 + length (x:xs) {L1}
-- 1 + 1 + length xs = 1 + 1 + length xs {aritmética}
-- 2 + length xs = 2 + length xs {aritmética}
-- length xs = length xs {queda demostrada la igualdad}

-- vi. ∀ xs::[a] . ∀ x::a . head (reverse (ponerAlFinal x xs)) = x

-- Predicado unario: P(xs) = ∀ x::a . head (reverse (ponerAlFinal x xs)) = x

-- Caso base: P([]) =
-- ∀ x::a . head (reverse (ponerAlFinal x [])) = x {P0}
-- ∀ x::a . head (reverse (foldr (:) (x:[]) [])) = x {FR0}
-- ∀ x::a . head (reverse (x:[])) = x {:}
-- ∀ x::a . head (reverse [x]) = x {R0}
-- ∀ x::a . head [x] = x {H0}
-- ∀ x::a . x = x {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ y::a . head (reverse (ponerAlFinal y xs)) = y
-- Caso inductivo: P(x:xs) = ∀ y :: a . head (reverse (ponerAlFinal y (x:xs)) = y

-- ∀ y::a . head (reverse (ponerAlFinal y (x:xs)) = y {P0}
-- ∀ y::a . head (reverse (foldr (:) (y:[]) (x:xs)) = y {FR1}
-- ∀ y::a . head (reverse (x : foldr (:) (y:[]) xs) = y {P0}
-- ∀ y::a . head (reverse (x : (ponerAlFinal y xs)) = y {R0}
-- ∀ y::a . head (foldl (flip (:)) [] (x : (ponerAlFinal y xs)) = y {FL1}
-- ∀ y::a . head (foldl (flip (:)) [] (ponerAlFinal y xs) ++ [x]) = y {R0}
-- ∀ y::a . head (reverse (ponerAlFinal y xs) ++ [x]) = y {H0}
-- ∀ y::a . head (reverse (ponerAlFinal y xs)) = y {HI}
-- y = y {queda demostrada la igualdad}

-- Ejercicio 4

-- i. reverse . reverse = id

-- Predicado unario: P(xs) = reverse . reverse xs = id xs

-- Caso base: P([]) =

-- ∀ xs::[a] . reverse . reverse [] = id [] {.}
-- ∀ xs::[a] . reverse (reverse []) = id [] {R0}
-- ∀ xs::[a] . reverse [] = id [] {R0}
-- ∀ xs::[a] . [] = id [] {ID}
-- ∀ xs::[a] . [] = [] {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = reverse . reverse xs = id xs
-- Caso inductivo: P(x:xs) = ∀ x :: a . ∀ xs :: [a] . reverse . reverse (x:xs) = id (x:xs)

-- ∀ x :: a . ∀ xs :: [a] . reverse . reverse (x:xs) = id (x:xs) {.}
-- ∀ x :: a . ∀ xs :: [a] . reverse (reverse (x:xs)) = id (x:xs) {ID}
-- ∀ x :: a . ∀ xs :: [a] . reverse (reverse (x:xs)) = x:xs {R0}
-- ∀ x :: a . ∀ xs :: [a] . reverse (foldl (flip (:)) [] (x:xs)) = x:xs {FL1}
-- ∀ x :: a . ∀ xs :: [a] . reverse (foldl (flip (:)) [x] xs) = x:xs {R0}
-- ∀ x :: a . ∀ xs :: [a] . reverse (reverse xs ++ [x]) = x:xs

-- ?

-- ii. append = (++)

-- Predicado unario: P(xs) = ∀ ys::[a] . append xs ys = xs ++ ys

-- Caso base: P([]) =

-- ∀ ys::[a] . append [] ys = [] ++ ys {A0}
-- ∀ ys::[a] . ys = [] ++ ys {++}
-- ∀ ys::[a] . ys = ys {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ ys::[a] . append xs ys = xs ++ ys
-- Caso inductivo: P(x:xs) = ∀ x :: a . ∀ ys::[a] . append (x:xs) ys = (x:xs) ++ ys

-- ∀ x :: a . ∀ ys::[a] . append (x:xs) ys = (x:xs) ++ ys {A1}
-- ∀ x :: a . ∀ ys::[a] . x : append xs ys = (x:xs) ++ ys {HI}
-- ∀ x :: a . ∀ ys::[a] . x : (xs ++ ys) = (x:xs) ++ ys {++}
-- ∀ x :: a . ∀ ys::[a] . [x] ++ (xs ++ ys) = (x:xs) ++ ys {++}
-- ∀ x :: a . ∀ ys::[a] . [x] ++ xs ++ ys = (x:xs) ++ ys {++}
-- ∀ x :: a . ∀ ys::[a] . [x] ++ xs ++ ys = [x] ++ xs ++ ys {queda demostrada la igualdad}












































