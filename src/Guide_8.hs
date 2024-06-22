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


-- Ejercicio 2

-- vecino(X, Y, [X|[Y|Ls]]).
-- vecino(X, Y, [W|Ls]) :- vecino(X, Y, Ls).


-- i. Mostrar el árbol de búsqueda en Prolog para resolver "vecino(5,Y,[5,6,5,3])"

-- ?- vecino(5, Y, [5,6,5,3]) .

-- Call: (12) vecino(5, Y, [5, 6, 5, 3]) ?
-- Exit: (12) vecino(5, 6, [5, 6, 5, 3]) ?
---- Y = 6 ;

-- Redo: (12) vecino(5, Y, [5, 6, 5, 3]) ?
-- Exit: (12) vecino(5, 3, [5, 6, 5, 3]) ?
-- Fail: (12) vecino(5, Y, [5, 6, 5, 3]) ?

-- Call: (13) vecino(5, Y, [6, 5, 3]) ?
-- Exit: (13) vecino(5, 3, [6, 5, 3]) ?
-- Fail: (13) vecino(5, Y, [6, 5, 3]) ?

-- Call: (14) vecino(5, Y, [5, 3]) ?
-- Exit: (14) vecino(5, 3, [5, 3]) ?
---- Y = 3 ;

-- Redo: (14) vecino(5, Y, [5, 3]) ?
-- Fail: (14) vecino(5, Y, [5, 3]) ?

-- Call: (15) vecino(5, Y, [3]) ?
-- Fail: (15) vecino(5, Y, [3]) ?

-- Call: (16) vecino(5, Y, []) ?
-- Fail: (16) vecino(5, Y, []) ?

---- false.


-- ii. Si se invierte el orden de las reglas, ¿los resultados son los mismos? ¿Y el orden de los resultados?

-- La forma de resolver la consulta es diferente aunque los resultados serán los mismos pero en un orden distinto.
-- Prolog resuelve primero la regla recursiva. De esa manera el único resultado es Y = 3. Luego, al hacer redo,
-- por fail en la regla base, utiliza la segunda regla y se obtiene Y = 6.

-- Ejercicio 3

-- natural(0).
-- natural(suc(X)) :- natural(X).

-- menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).
-- menorOIgual(X,X) :- natural(X).

-- i. Explicar la consulta "menorOIgual(0,X)"

-- Unifica con la primer aparición de la regla menorOIgual(X, suc(Y)) y se llama recursivamente con menorOIgual(0, Y).
-- El problema es que no termina de unificar con una regla base, por lo que entra en un loop infinito.

-- iii. Corregir la definición de menorOIgual/2.

-- menorOIgual(X, X) :- natural(X).
-- menorOIgual(X, suc(Y)) :- menorOIgual(X, Y).

