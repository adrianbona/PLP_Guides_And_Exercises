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

-- Demostrar las siguientes propiedades

-- i. ∀ xs::[a] . length (duplicar xs) = 2 * length xs

-- Predicado unario: P(xs) = ∀ xs::[a] . length (duplicar xs) = 2 * length xs

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