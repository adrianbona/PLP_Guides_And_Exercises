module Guide_2 (
  intercambiar,
  espejar,
  asociarI,
  asociarD,
  _zip,
  _zip',
  nub,
  union,
  intersect,
) where

-- Ejercicio 1

intercambiar :: (a,b) -> (b,a)
intercambiar (x,y) = (y,x) --{INT0}

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
-- const x _ = x {C0}

-- id :: a -> a
-- id x = x {ID}


-- Extensionalidad para PARES:
-- Si p :: (a, b), entonces ∃x :: a. ∃y :: b. p = (x, y).

-- Extensionalidad para SUMAS:
-- data Either a b = Left a | Right b
-- Si e :: Either a b, entonces
-- o bien ∃x :: a. e = Left x
-- o bien ∃y :: b. e = Right b


-- i. ∀ p::(a,b) . intercambiar (intercambiar p) = p

-- intercambiar (intercambiar p) = p {extensionalidad}
-- intercambiar (intercambiar (x,y)) = p {INT0}
-- intercambiar (y,x) = p {INT0}
-- (x,y) = p {extensionalidad}
-- p = p {queda demostrada la igualdad}

-- ii. ∀ p::(a,(b,c)) . asociarD (asociarI p) = p

-- asociarD (asociarI p) = p {extensionalidad}
-- asociarD (asociarI (x,(y,z))) = p {AI}
-- asociarD ((x,y),z) = p {AD}
-- (x,(y,z)) = p {extensionalidad}
-- p = p {queda demostrada la igualdad}

-- iii. ∀ p::Either a b . espejar (espejar p) = p

-- Si p::Either a b, entonces o bien ∃x :: a. e = Left x o bien ∃y :: b. e = Right b. Se consideran ambos casos.

-- Caso p = Left x
-- espejar (espejar (p)) = p {extensionalidad}
-- espejar (espejar (Left x)) = p {E1}
-- espejar (Right x) = p {E2}
-- Left x = p {extensionalidad}
-- p = p {queda demostrada la igualdad}

-- Caso p = Right x
-- espejar (espejar (p)) = p {extensionalidad}
-- espejar (espejar (Right x)) = p {E2}
-- espejar (Left x) = p {E1}
-- Right x = p {extensionalidad}
-- p = p {queda demostrada la igualdad}

-- iv. ∀ f::a->b->c . ∀ x::a . ∀ y::b . flip (flip f) x y = f x y

-- flip (flip f) x y = f x y {F}
-- flip f y x = f x y {F}
-- f x y = f x y {queda demostrada la igualdad}

-- v. ∀ f::a->b->c . ∀ x::a . ∀ y::b . curry (uncurry f) x y = f x y

-- curry (uncurry f) x y = f x y {CU}
-- uncurry f (x,y) = f x y {UC}
-- f x y = f x y {queda demostrada la igualdad}

-- Ejercicio 2

-- i. flip . flip = id

-- flip . flip = id {extensionalidad}
-- ∀ f::a->b->c . ∀ x::a . ∀ y::b (flip . flip) f x y = id f x y
-- (flip . flip) f x y = id f x y {.}
-- flip (flip f) x y = id f x y {F}
-- flip f y x = id f x y {F}
-- f x y = f x y {ID}
-- f = f {queda demostrada la igualdad}

-- ii. ∀ f::(a,b)->c . uncurry (curry f) = f

-- uncurry (curry f) = f {extensionalidad}
-- uncurry (curry f) (x,y) = f (x,y) {UC}
-- curry f x y = f (x,y) {CU}
-- f (x,y) = f (x,y) {queda demostrada la igualdad}

-- iii. flip const = const id

-- flip const = const id {extensionalidad}
-- ∀ x::a . ∀ y::b . flip const x y = const id x y
-- flip const x y = const id x y {F}
-- const y x = const id x y {C0}
-- y = const id x y {C0}
-- y = const id y {C0}
-- y = id y {ID}
-- y = y {queda demostrada la igualdad}

-- iv. ∀ f::a->b . ∀ g::b->c . ∀ h::c->d . ((h . g) . f) = (h . (g . f))
-- Sea la definición de la composición: (.) f g x = f (g x)

-- ((h . g) . f) = (h . (g . f)) {extensionalidad}
-- ∀ x::a . ((h . g) . f) x = (h . (g . f)) x
-- ((h . g) . f) x = (h . (g . f)) x {.}
-- (h . g) (f x) = (h . (g . f)) x {.}
-- h (g (f x)) = (h . (g . f)) x {.}
-- h ((g . f) x) = (h . (g . f)) x {.}
-- (h . (g . f)) x = (h . (g . f)) x {queda demostrada la igualdad}

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

-- Agregadas y utilizadas en demostraciones posteriores:

-- map :: (a -> b) -> [a] -> [b]
-- map f = foldr ((:) . f) [] {M0}

-- map :: (a -> b) -> [a] -> [b]
-- map _ [] = [] {MA0}
-- map f (x:xs) = f x : map f xs {MA1}

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

-- reverseFR :: [a] -> [a]
-- reverseFR = foldr (:) [] {RFR0}

-- i. ∀ xs::[a] . length (duplicar xs) = 2 * length xs

-- Predicado unario: P(xs) = length (duplicar xs) = 2 * length xs

-- Caso base: P([]) =
-- length (duplicar []) = 2 * length [] {D0}
-- length [] = 2 * length [] {L0}
-- 0 = 2 * 0 {aritmética}
-- 0 = 0 {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = length (duplicar xs) = 2 * length xs
-- Paso inductivo: P(x:xs) = length (duplicar (x:xs)) = 2 * length (x:xs)

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
-- ∀ ys::[a] . length ys = 0 + length ys {aritmética}
-- ∀ ys::[a] . length ys = length ys {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ ys::[a] . length (append xs ys) = length xs + length ys
-- Paso inductivo: P(x:xs) = ∀ ys::[a] . length (append (x:xs) ys) = length (x:xs) + length ys

-- ∀ ys::[a] . length (append (x:xs) ys) = length (x:xs) + length ys {A1}
-- ∀ ys::[a] . length (x : append xs ys) = length (x:xs) + length ys {L1}
-- ∀ ys::[a] . 1 + length (append xs ys) = length (x:xs) + length ys {L1}
-- ∀ ys::[a] . 1 + length (append xs ys) = 1 + length xs + length ys {HI}
-- ∀ ys::[a] . 1 + length xs + length ys = 1 + length xs + length ys {aritmética}
-- ∀ ys::[a] . length xs + length ys = length xs + length ys {queda demostrada la igualdad}

-- iii. ∀ xs::[a] . ∀ f::(a->b) . length (map f xs) = length xs

-- Predicado unario: P(xs) = ∀ f::(a->b) . length (map f xs) = length xs

-- Caso base: P([]) =
-- ∀ f::(a->b) . length (map f []) = length [] {MA0}
-- ∀ f::(a->b) . length [] = length [] {L0}
-- 0 = 0 {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ f::(a->b) . length (map f xs) = length xs
-- Paso inductivo: P(x:xs) = ∀ f::(a->b) . length (map f (x:xs)) = length (x:xs)

-- ∀ f::(a->b) . length (map f (x:xs)) = length (x:xs) {M0}
-- ∀ f::(a->b) . length ((f x) : (map f xs)) = length (x:xs) {L1}
-- ∀ f::(a->b) . 1 + length (map f xs) = length (x:xs) {HI}
-- 1 + length xs = length (x:xs) {L1}
-- 1 + length xs = 1 + length xs {aritmética}
-- length xs = length xs {queda demostrada la igualdad}

-- iv. ∀ xs::[a] . ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True) (asumiendo Eq a)

-- Predicado unario: P(xs) = ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True)

-- Caso base: P([]) =
-- ∀ p::a->Bool . ∀ e::a . (elem e (filter p []) = True) ⇒ (elem e [] = True) {F0}
-- ∀ p::a->Bool . ∀ e::a . (elem e (foldr (\x xs -> if p x then x : xs else xs) []) = True) ⇒ (elem e [] = True) {FR0}
-- ∀ p::a->Bool . ∀ e::a . (elem e []) = True ⇒ (elem e [] = True) {queda demostrada la implicación}

-- ∀ p::a->Bool . ∀ e::a . False ⇒ (elem e [] = True) {queda demostrada la implicación}

-- Hipótesis inductiva: P(xs) = ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True)
-- Paso inductivo: P(x:xs) = ∀ p::a->Bool . ∀ e::a . (elem e (filter p (x:xs)) = True) ⇒ (elem e (x:xs) = True)

-- ∀ p::a->Bool . ∀ e::a . (elem e (filter p (x:xs)) = True) ⇒ (elem e (x:xs) = True) {F0}
-- ∀ p::a->Bool . ∀ e::a . (elem e (if p x then x : filter p xs else filter p xs) = True) ⇒ (elem e (x:xs) = True) {abrimos en casos)

-- La función p aplicada a x puede devolver True o False, por lo que se deben considerar ambos casos:

-- Caso 1: p x = True
-- ∀ p::a->Bool . ∀ e::a . (elem e (x : filter p xs) = True) ⇒ (elem e (x:xs) = True) {E0}
-- ∀ p::a->Bool . ∀ e::a . (foldr (\x b -> b || x == e) False (x : filter p xs) = True) ⇒ (elem e (x:xs) = True) {FR1}
-- ∀ p::a->Bool . ∀ e::a . ((foldr (\x b -> b || x == e) False (filter p xs) || x == e) = True) ⇒ (elem e (x:xs) = True) {E0}
-- ∀ p::a->Bool . ∀ e::a . ((elem e (filter p xs) || x == e) = True) ⇒ (elem e (x:xs) = True) {E0}
-- ∀ p::a->Bool . ∀ e::a . ((elem e (filter p xs) || x == e) = True) ⇒ (foldr (\x b -> b || x == e) False (x:xs) = True) {FR1}
-- ∀ p::a->Bool . ∀ e::a . ((elem e (filter p xs) || x == e) = True) ⇒ ((foldr (\x b -> b || x == e) False (xs) || x == e) = True) {E0}
-- ∀ p::a->Bool . ∀ e::a . ((elem e (filter p xs) || x == e) = True) ⇒ ((elem e xs || x == e) = True) {HI}

-- La hipótesis inductiva demuestra una implicación más fuerte que la que se pide demostrar, por lo que queda demostrada la implicación

-- Caso 2: p x = False
-- ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e (x:xs) = True) {HI}
-- ∀ p::a->Bool . ∀ e::a . (elem e (filter p xs) = True) ⇒ (elem e xs = True) ⇒ (elem e (x:xs) = True) {HI}

-- Por hipótesis inductiva, si vale elem e xs también vale elem e (x:xs), por lo que queda demostrada la implicación

-- v. ∀ xs::[a] . ∀ x::a . length (ponerAlFinal x xs) = 1 + length xs

-- Predicado unario: P(xs) = ∀ x::a . length (ponerAlFinal x xs) = 1 + length xs

-- Caso base: P([]) =
-- ∀ x::a . length (ponerAlFinal x []) = 1 + length [] {P0}
-- ∀ x::a . length (foldr (:) (x:[]) []) = 1 + length [] {FR0}
-- ∀ x::a . length (x:[]) = 1 + length [] {L0}
-- ∀ x::a . 1 = 1 {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ y::a . length (ponerAlFinal y xs) = 1 + length xs
-- Paso inductivo: P(x:xs) = ∀ y :: a . length (ponerAlFinal y (x:xs)) = 1 + length (x:xs)

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

-- Hipótesis inductiva: P(xs) = ∀ y::a . head (reverse (ponerAlFinal y xs))) = y
-- Paso inductivo: P(x:xs) = ∀ y :: a . head (reverse (ponerAlFinal y (x:xs))) = y

-- ∀ y::a . head (reverse (ponerAlFinal y (x:xs))) = y {P0}
-- ∀ y::a . head (reverse (foldr (:) (y:[]) (x:xs))) = y {FR1}
-- ∀ y::a . head (reverse (x:(foldr (:) (y:[]) xs))) = y {P0}
-- ∀ y::a . head (reverse (x:(ponerAlFinal y xs))) = y {R0}
-- ∀ y::a . head (foldl (flip (:) [] (x : ponerAlFinal y xs)) = y {FL1}
-- ∀ y::a . head (foldl (flip (:) [x] (ponerAlFinal y xs)) = y {R0}

-- NO ALCANZA CON R0

-- ∀ y::a . head (reverse (ponerAlFinal y xs) ++ [x]) = y {H0}
-- ∀ y::a . head (reverse (ponerAlFinal y xs)) = y {HI}
-- ∀ y::a . y = y {queda demostrada la igualdad}

-- Ejercicio 4

-- i. reverse . reverse = id

-- Predicado unario: P(xs) = reverse . reverse xs = id xs

-- Caso base: P([]) =

-- reverse . reverse [] = id [] {.}
-- reverse (reverse []) = id [] {R0}
-- reverse [] = id [] {R0}
-- [] = id [] {ID}
-- [] = [] {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = reverse . reverse xs = id xs
-- Paso inductivo: P(x:xs) = reverse . reverse (x:xs) = id (x:xs)

-- Utilizamos un lema que reescribe reverse utilizando foldr

-- reverse . reverse (x:xs) = id (x:xs) {.}
-- reverse (reverse (x:xs)) = id (x:xs) {R0}
-- reverse (foldr (:) [] (x:xs)) = id (x:xs) {FR1}
-- reverse (x : foldr (:) [] xs) = id (x:xs) {R0}
-- reverse (x : reverse xs) = id (x:xs) {R0}
-- foldr (:) [] (x : reverse xs) = id (x:xs) {FR1}
-- x : foldr (:) [] (reverse xs) = id (x:xs) {R0}
-- x : reverse (reverse xs) = id (x:xs) {.}
-- x : (reverse . reverse xs) = id (x:xs) {HI}
-- x : id xs = id (x:xs) {ID}
-- x:xs = x:xs {queda demostrada la igualdad}

-- ii. append = (++)

-- Predicado unario: P(xs) = ∀ ys::[a] . append xs ys = xs ++ ys

-- Caso base: P([]) =

-- ∀ ys::[a] . append [] ys = [] ++ ys {A0}
-- ∀ ys::[a] . ys = [] ++ ys {++}
-- ∀ ys::[a] . ys = ys {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ ys::[a] . append xs ys = xs ++ ys
-- Paso inductivo: P(x:xs) = ∀ ys::[a] . append (x:xs) ys = (x:xs) ++ ys

-- ∀ ys::[a] . append (x:xs) ys = (x:xs) ++ ys {A1}
-- ∀ ys::[a] . x : append xs ys = (x:xs) ++ ys {HI}
-- ∀ ys::[a] . x : (xs ++ ys) = (x:xs) ++ ys {++}
-- ∀ ys::[a] . [x] ++ (xs ++ ys) = (x:xs) ++ ys {++}
-- ∀ ys::[a] . [x] ++ xs ++ ys = (x:xs) ++ ys {++}
-- ∀ ys::[a] . [x] ++ xs ++ ys = [x] ++ xs ++ ys {queda demostrada la igualdad}

-- iii. map id = id

-- Predicado unario: P(xs) = map id xs = id xs

-- Caso base: P([]) =

-- map id [] = id [] {M0}
-- [] = id [] {ID}
-- [] = [] {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = map id xs = id xs
-- Paso inductivo: P(x:xs) = map id (x:xs) = id (x:xs)

-- map id (x:xs) = id (x:xs) {M0}
-- foldr ((:) . id) [] (x:xs) = id (x:xs) {FR1}
-- x : (foldr (:) [] xs) = id (x:xs) {M0}
-- x : (map id xs) = id (x:xs) {HI}
-- x : (id xs) = x:xs {ID}
-- x:xs = x:xs {queda demostrada la igualdad}

-- iv. ∀ f::a->b . ∀ g::b->c . map (g . f) = map g . map f

-- Predicado unario: P(xs) = ∀ f::a->b . ∀ g::b->c . map (g . f) xs = map g . map f xs

-- Caso base: P([]) =

-- ∀ f::a->b . ∀ g::b->c . map (g . f) [] = map g . map f [] {M0}
-- ∀ f::a->b . ∀ g::b->c . map (g . f) [] = map g [] {M0}
-- ∀ f::a->b . ∀ g::b->c . [] = [] {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ f::a->b . ∀ g::b->c . map (g . f) xs = map g . map f xs
-- Paso inductivo: P(x:xs) = ∀ f::a->b . ∀ g::b->c . map (g . f) (x:xs) = map g . map f (x:xs)

-- ∀ f::a->b . ∀ g::b->c . map (g . f) (x:xs) = map g . map f (x:xs) {MA1}
-- ∀ f::a->b . ∀ g::b->c . (g . f) x : (map (g . f) xs) = map g . map f (x:xs) {HI}
-- ∀ f::a->b . ∀ g::b->c . (g . f) x : (map g . map f xs) = map g . map f (x:xs) {MA1}
-- ∀ f::a->b . ∀ g::b->c . (g . f) x : (map g . map f xs) = map g (f x : map f xs) {MA1}
-- ∀ f::a->b . ∀ g::b->c . (g . f) x : (map g . map f xs) = g (f x) : map g (map f xs) {.}
-- ∀ f::a->b . ∀ g::b->c . (g . f) x : (map g . map f xs) = (g . f) x : map g (map f xs) {.}
-- ∀ f::a->b . ∀ g::b->c . (g . f) x : (map g . map f xs) = (g . f) x : (map g . map f xs) {queda demostrada la igualdad}

-- v. ∀ f::a->b . ∀ p::b->Bool . filter (p . f) = filter p . map f

-- Predicado unario: P(xs) = ∀ f::a->b . ∀ p::b->Bool . filter (p . f) xs = filter p . map f xs

-- Caso base: P([]) =

-- ∀ f::a->b . ∀ p::b->Bool . filter (p . f) [] = filter p . map f [] {MA0}
-- ∀ f::a->b . ∀ p::b->Bool . filter (p . f) [] = filter p [] {F0}
-- [] = [] {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ f::a->b . ∀ p::b->Bool . filter (p . f) xs = filter p . map f xs
-- Paso inductivo: P(x:xs) = ∀ f::a->b . ∀ p::b->Bool . filter (p . f) (x:xs) = filter p . map f (x:xs)

-- ∀ f::a->b . ∀ p::b->Bool . filter (p . f) (x:xs) = filter p . map f (x:xs) {F0}
-- ∀ f::a->b . ∀ p::b->Bool . if (p . f) x then x : (filter (p . f) xs) else filter (p . f) xs = filter p . map f (x:xs)

-- La función p aplicada a f x puede devolver True o False, por lo que se deben considerar ambos casos:

-- Caso 1: (p . f) x = True

-- ∀ f::a->b . ∀ p::b->Bool . f x : (filter (p . f) xs) = filter p . map f (x:xs) {HI}
-- ∀ f::a->b . ∀ p::b->Bool . f x : (filter p . map f xs) = filter p . map f (x:xs) {MA1}
-- ∀ f::a->b . ∀ p::b->Bool . f x : (filter p . map f xs) = filter p . (f x : map f xs) {F0}
-- ∀ f::a->b . ∀ p::b->Bool . f x : (filter p . map f xs) = f x : filter p . map f xs {queda demostrada la igualdad}

-- Caso 2: (p . f) x = False

-- ∀ f::a->b . ∀ p::b->Bool . filter (p . f) xs = filter p . map f xs {HI}
-- ∀ f::a->b . ∀ p::b->Bool . filter p . map f xs = filter p . map f xs {queda demostrada la igualdad}

-- vi. ∀ f::a->b . ∀ e::a . ∀ xs::[xs] . (elem e xs = True) ⇒ (elem (f e) (map f xs) = True) (asumiendo Eq a y Eq b)

-- Predicado unario: P(xs) = ∀ f::a->b . ∀ e::a . (elem e xs = True) ⇒ (elem (f e) (map f xs) = True)

-- Caso base: P([]) =

-- ∀ f::a->b . ∀ e::a . (elem e [] = True) ⇒ (elem (f e) (map f []) = True) {E0}
-- ∀ f::a->b . ∀ e::a . False ⇒ (elem (f e) (map f []) = True) {queda demostrada la implicación}

-- Hipótesis inductiva: P(xs) = ∀ f::a->b . ∀ e::a . (elem e xs = True) ⇒ (elem (f e) (map f xs) = True)
-- Paso inductivo: P(x:xs) = ∀ f::a->b . ∀ e::a . (elem e (x:xs) = True) ⇒ (elem (f e) (map f (x:xs)) = True)

-- ∀ f::a->b . ∀ e::a . (elem e (x:xs) = True) ⇒ (elem (f e) (map f (x:xs)) = True) {E0}
-- ∀ f::a->b . ∀ e::a . (e == x || elem e xs = True) ⇒ (elem (f e) (map f (x:xs)) = True)

-- Partimos en dos casos: o bien e == x o en caso contrario e /= x

-- Caso 1: e == x

-- ∀ f::a->b . ∀ e::a . True ⇒ (elem (f e) (map f (x:xs)) = True) {MA1}
-- ∀ f::a->b . ∀ e::a . True ⇒ (elem (f e) (f x : map f xs) = True) {E0}
-- ∀ f::a->b . ∀ e::a . True ⇒ (foldr (\y b -> b || y == (f e)) False (f x : map f xs) {FR1}
-- ∀ f::a->b . ∀ e::a . True ⇒ (f x == (f e) || foldr (\y b -> b || y == (f e)) False (map f xs) {por CASO 1}
-- ∀ f::a->b . ∀ e::a . True ⇒ (True || elem (f e) (map f xs) = True) {lógica}
-- ∀ f::a->b . ∀ e::a . True ⇒ True = True {queda demostrada la igualdad}

-- Caso 2: e /= x

-- ∀ f::a->b . ∀ e::a . (elem e xs = True) ⇒ (elem (f e) (map f (x:xs)) = True) {HI}
-- ∀ f::a->b . ∀ e::a . (elem e xs = True) ⇒ (elem (f e) (map f xs) = True) ⇒ (elem (f e) (map f (x:xs)) = True) {queda demostrada la implicación}
-- Es decir, por hipótesis inductiva queda demostrada la implicación para cualquier e en xs. Luego se puede afirmar que
-- si elem (f e) (map f xs) = True para cualquier e en xs, entonces elem (f e) (map f (x:xs)) = True

-- Ejercicio 5

_zip :: [a] -> [b] -> [(a,b)]
_zip = foldr (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys)) (const []) --{Z0}

_zip' :: [a] -> [b] -> [(a,b)]
_zip' [] _ = [] --{Z'0}
_zip' (x:xs) ys = if null ys then [] else (x, head ys) : _zip' xs (tail ys) --{Z'1}

-- _zip = _zip'

-- Predicado unario: P(xs) = _zip xs ys = _zip' xs ys

-- Caso base: P([]) =

-- _zip [] ys = _zip' [] ys {Z0}
-- foldr (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys)) (const []) [] ys = _zip' [] ys {FR0}
-- const [] = _zip' [] ys {Z'0}
-- [] = [] {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = _zip xs ys = _zip' xs ys
-- Paso inductivo: P(x:xs) = ∀ ys::[b] . _zip (x:xs) ys = _zip' (x:xs) ys

-- ∀ ys::[b] . _zip (x:xs) ys = _zip' (x:xs) ys {Z0}
-- ∀ ys::[b] . foldr (\x rec ys -> if null ys then [] else (x, head ys) : rec (tail ys)) (const []) (x:xs) ys = _zip' (x:xs) ys

-- Partimos en dos casos: o bien ys es vacío o en caso contrario ys no es vacío

-- Caso 1: ys es vacío

-- foldr (\x rec [] -> if null [] then [] else (x, head []) : rec (tail [])) (const []) (x:xs) [] = _zip' (x:xs) [] {reescribimos}
-- foldr (\x rec [] -> []) (const []) (x:xs) [] = _zip' (x:xs) [] {FR1}
-- [] = _zip' (x:xs) [] {Z'1}
-- [] = [] {queda demostrada la igualdad}

-- Caso 2: ys no es vacío

-- foldr (\x' rec ys -> (x', head ys) : rec (tail ys)) (const []) (x:xs) ys = _zip' (x:xs) ys {FR1}
-- (x, head ys) : foldr (\x' rec ys -> (x', head ys) : rec (tail ys)) (const []) xs (tail ys) = _zip' (x:xs) ys {HI}
-- (x, head ys) : _zip' xs (tail ys) = _zip' (x:xs) ys {Z'1}
-- (x, head ys) : _zip' xs (tail ys) = (x, head ys) : _zip' xs (tail ys) {queda demostrada la igualdad}

-- Ejercicio 6

nub :: Eq a => [a] -> [a]
nub [] = [] -- {N0}
nub (x:xs) = x : nub (filter (\y -> x /= y) xs) --{N1}

union :: Eq a => [a] -> [a] -> [a]
union xs ys = nub (xs++ys) --{U0}

intersect :: Eq a => [a] -> [a] -> [a]
intersect xs ys = filter (\e -> elem e ys) xs --{I0}

-- i. Eq a => ∀ xs::[a] . ∀ e::a . elem e xs = elem e (nub xs)

-- Predicado unario: P(xs) = ∀ e::a . elem e xs = elem e (nub xs)

-- Caso base: P([]) =

-- ∀ e::a . elem e [] = elem e (nub []) {N0}
-- ∀ e::a . elem e [] = elem e [] {E0}
-- ∀ e::a . False = False {queda demostrada la igualdad}

-- Hipótesis inductiva: P(xs) = ∀ e::a . elem e xs = elem e (nub xs)
-- Paso inductivo: P(x:xs) = ∀ e::a . elem e (x:xs) = elem e (nub (x:xs))

-- ∀ e::a . elem e (x:xs) = elem e (nub (x:xs)) {E0}
-- ∀ e::a . foldr (\y b -> b || y == e) False (x:xs) = elem e (nub (x:xs)) {FR1}
-- ∀ e::a . (x == e || foldr (\y b -> b || y == e) False xs) = elem e (nub (x:xs)) {E0}
-- ∀ e::a . (x == e || elem e xs) = elem e (nub (x:xs)) {HI}
-- ∀ e::a . (x == e || elem e (nub xs)) = elem e (nub (x:xs)) {partimos en casos}

-- Caso 1: x == e

-- (True || elem e (nub xs)) = elem e (nub (x:xs)) {lógica}
-- True = elem e (nub (x:xs)) {N1}
-- True = elem e (x: nub (filter (\y -> x /= y) xs)) {E0}
-- True = foldr (\y b -> b || y == e) False (x: nub (filter (\y -> x /= y) xs)) {FR1}
-- True = (x == e || foldr (\y b -> b || y == e) False (nub (filter (\y -> x /= y) xs)) {CASO 1}
-- True = (True || foldr (\y b -> b || y == e) False (nub (filter (\y -> x /= y) xs)) {lógica}
-- True = True {queda demostrada la igualdad}

-- Caso 2: x /= e

-- (False || elem e (nub xs)) = elem e (nub (x:xs)) {lógica}
-- elem e (nub xs) = elem e (nub (x:xs)) {E0}
-- elem e (nub xs) = foldr (\y b -> b || y == e) False (nub (x:xs)) {N0}
-- elem e (nub xs) = foldr (\y b -> b || y == e) False (x: nub (filter (\y -> x /= y) xs)) {FR1}
-- elem e (nub xs) = (x == e || foldr (\y b -> b || y == e) False (nub (filter (\y -> x /= y) xs)) {CASO 2}
-- elem e (nub xs) = (False || foldr (\y b -> b || y == e) False (nub (filter (\y -> x /= y) xs)) {lógica}
-- elem e (nub xs) = foldr (\y b -> b || y == e) False (nub (filter (\y -> x /= y) xs) {E0}
-- elem e (nub xs) = elem e (nub (filter (\y -> x /= y) xs) {N1} //POLÉMICO
-- elem e (nub xs) = elem e (nub xs) {queda demostrada la igualdad}

-- ii. Eq a => ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (union xs ys) = (elem e xs) || (elem e ys)

-- Predicado unario: P(xs) = ∀ ys::[a] . ∀ e::a . elem e (union xs ys) = (elem e xs) || (elem e ys)

-- Caso base: P([]) =

-- ∀ ys::[a] . ∀ e::a . elem e (union [] ys) = (elem e []) || (elem e ys) {U0}
-- ∀ ys::[a] . ∀ e::a . elem e (nub ([] ++ ys)) = (elem e []) || (elem e ys) {++}
-- ∀ ys::[a] . ∀ e::a . elem e (nub ys) = (elem e []) || (elem e ys) {E0}
-- ∀ ys::[a] . ∀ e::a . elem e (nub ys) = False || (elem e ys) {lógica}
-- ∀ ys::[a] . ∀ e::a . elem e (nub ys) = elem e ys {LEMA_NUB}
-- ∀ ys::[a] . ∀ e::a . True {queda demostrada la igualdad}


-- Hipótesis inductiva: P(xs) = ∀ ys::[a] . ∀ e::a . elem e (union xs ys) = (elem e xs) || (elem e ys)
-- Paso inductivo: P(x:xs) = ∀ ys::[a] . ∀ e::a . elem e (union (x:xs) ys) = (elem e (x:xs)) || (elem e ys)

-- ∀ ys::[a] . ∀ e::a . elem e (union (x:xs) ys) = (elem e (x:xs)) || (elem e ys)

-- Lema Nub: ∀ ys::[a] . ∀ e::a . elem e (nub ys) = elem e ys

-- Predicado unario: P(ys) = ∀ e::a . elem e (nub ys) = elem e ys

-- Caso base: P([]) =

-- ∀ e::a . elem e (nub []) = elem e [] {N0}
-- ∀ e::a . elem e [] = elem e [] {E0}
-- ∀ e::a . False = False {queda demostrada la igualdad}

-- Hipótesis inductiva: P(ys) = ∀ e::a . elem e (nub ys) = elem e ys
-- Paso inductivo: P(y:ys) = ∀ e::a . elem e (nub (y:ys)) = elem e (y:ys)

-- ∀ e::a . elem e (nub (y:ys)) = elem e (y:ys) {N1}
-- ∀ e::a . elem e (y : nub (filter (\y' -> y /= y') ys)) = elem e (y:ys) {E0}
-- ∀ e::a . e == y || elem e (nub (filter (\y' -> y /= y') ys) = elem e (y:ys) {HI}

-- iii. Eq a => ∀ xs::[a] . ∀ ys::[a] . ∀ e::a . elem e (intersect xs ys) = (elem e xs) && (elem e ys)

-- Predicado unario: P(xs) = ∀ ys::[a] . ∀ e::a . elem e (intersect xs ys) = (elem e xs) && (elem e ys)

-- iv. Eq a => ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) = length xs + length ys


-- v. Eq a => ∀ xs::[a] . ∀ ys::[a] . length (union xs ys) ≤ length xs + length ys
























































































