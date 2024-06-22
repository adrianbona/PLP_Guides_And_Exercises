module Guide_8 (
) where

-- Ejercicio 1

-- padre(juan, carlos).
-- padre(juan, luis).
-- padre(carlos, daniel).
-- padre(carlos, diego).
-- padre(luis, pablo).
-- padre(luis, manuel).
-- padre(luis, ramiro).
-- abuelo(X,Y) :- padre(X,Z), padre(Z,Y).

-- i. Resultado de la consulta abuelo(X, manuel).

-- abuelo(X,manuel)
-- padre(X,Z), padre(Z,manuel)
-- padre(X,luis), padre(luis,manuel)
-- X = juan


-- ii. Definir el predicado hijo/2, hermano/2 y descendiente/2.

-- hijo(X, Y) :- padre(Y, X).
-- hermano(X,Y) :- padre(Z,X), padre(Z,Y), X \= Y.

-- % Una persona Y es un descendiente de X si X es el padre de Y.
-- descendiente(X,Y) :- padre(X,Y).

-- % Una persona Y es un descendiente de X si X es el padre de Z y Z es un descendiente de Y.
-- descendiente(X,Y) :- padre(X,Z), descendiente(Z,Y).


-- iv. Nietos de juan.

-- ?- abuelo(juan, X) .
-- X = daniel ;
-- X = diego ;
-- X = pablo ;
-- X = manuel ;
-- X = ramiro.


-- v. Todos los hermanos de Pablo.

-- ?- hermano(pablo, X) .
-- X = manuel ;
-- X = ramiro.