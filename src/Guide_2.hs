module Guide_2 () where

-- Ejercicio 1

intercambiar :: (a,b) -> (b,a)
intercambiar (x,y) = (y,x) --{I}

espejar :: Either a b -> Either b a
espejar (Left x) = Right x --{E1}
espejar (Right x) = Left x --{E2}

asociarI :: (a,(b,c)) -> ((a,b),c)
asociarI (x,(y,z)) = ((x,y),z) --{AI}

asociarD :: ((a,b),c) -> (a,(b,c))
asociarD ((x,y),z) = (x,(y,z)) --{AD}

flip :: (a -> b -> c) -> b -> a -> c
flip f x y = f y x --{F}

curry :: ((a,b) -> c) -> a -> b -> c
curry f x y = f (x,y) --{C}

uncurry :: (a -> b -> c) -> (a,b) -> c
uncurry f (x,y) = f x y --{UC}

-- Extensionalidad para pares
-- Si p :: (a, b), entonces ∃x :: a. ∃y :: b. p = (x, y).
-- data Either a b = Left a | Right b

-- Extensionalidad para sumas
-- Si e :: Either a b, entonces:
-- o bien ∃x :: a. e = Left x
-- o bien ∃y :: b. e = Right b


-- i. ∀ p::(a,b) . intercambiar (intercambiar p) = p

-- intercambiar (intercambiar (x,y)) por {reemplazo}
-- intercambiar (y,x) por {I}
-- (x,y) por {I}
-- p {queda demostrada la igualdad}

-- ii. ∀ p::(a,(b,c)) . asociarD (asociarI p) = p

-- asociarD (asociarI (x,(y,z))) por {reemplazo}
-- asociarD ((x,y),z) por {AI}
-- (x,(y,z)) por {AD}
-- p {queda demostrada la igualdad}

-- iii. ∀ p::Either a b . espejar (espejar p) = p

-- Caso donde: p = Left x
-- espejar (espejar (Left x)) por {reemplazo}
-- espejar (Right x) por {E1}
-- Left x por {E1}
-- p {queda demostrada la igualdad}

-- Caso donde: p = Right x
-- espejar (espejar (Right x)) por {reemplazo}
-- espejar (Left x) por {E2}
-- Right x por {E2}
-- p {queda demostrada la igualdad}

-- iv. ∀ f::a->b->c . ∀ x::a . ∀ y::b . flip (flip f) x y = f x y

-- flip (flip f) x y
-- flip f y x por {F}
-- f x y {F}
-- f x y {queda demostrada la igualdad}

-- v. ∀ f::a->b->c . ∀ x::a . ∀ y::b . curry (uncurry f) x y = f x y

-- curry (uncurry f) x y
-- uncurry f (x,y) {C}
-- f x y {U}
-- f x y {queda demostrada la igualdad}