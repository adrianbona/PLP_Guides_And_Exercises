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


-- Ejercicio 4

-- %juntar(?Lista1,?Lista2,?Lista3)
-- juntar([], L, L).
-- juntar([X|L1], L2, [X|L3]) :- juntar(L1, L2, L3).


-- Ejercicio 5


-- i. Definir el predicado last(?L, ?U), donde U es el último elemento de la lista L

-- Versión sin append
-- last([X], X).
-- last([_|L], X) :- last(L, X).

-- Versión con append
-- %last(?L, ?U)
-- last(L, U) :- append(_, [U], L).


-- ii. Definir el predicado reverse(+L, -L1), donde L1 contiene los mismos elementos que L, pero en orden invers

-- %reverse(+L, -L1)
-- reverse([], []).
-- reverse([X|L], L1) :- reverse(L, L2), append(L2, [X], L1).

-- Árbol de búsqueda para "reverse([a,b,c], [c,b,a])."

-- Call: (12) reverse([a, b, c], [c, b, a])
-- Exit: (12) reverse([a, b, c], [c, b, a])

-- Call: (13) reverse([b, c], _10420)
-- Exit: (13) reverse([b, c], [c, b])
-- Exit: (13) append([c, b], [a], [c, b, a])
-- Call: (13) append([c, b], [a], [c, b, a])

-- Call: (14) reverse([c], _11232)
-- Exit: (14) reverse([c], [c])
-- Call: (14) append([c], [b], _10420)
-- Exit: (14) append([c], [b], [c, b])
-- Call: (14) append([b], [a], [b, a])
-- Exit: (14) append([b], [a], [b, a])

-- Call: (15) reverse([], _12044)
-- Exit: (15) reverse([], [])
-- Call: (15) append([], [c], _11232)
-- Exit: (15) append([], [c], [c])
-- Call: (15) append([], [b], _17190)
-- Exit: (15) append([], [b], [b])
-- Call: (15) append([], [a], [a])
-- Exit: (15) append([], [a], [a])


-- iii. Definir el predicado prefijo(?P, +L), donde P es prefijo de la lista L.

-- Versión sin append:
-- %prefijo(?P, +L)
-- prefijo([], _).
-- prefijo([X|P], [X|L]) :- prefijo(P, L).

-- Versión con append:
-- %prefijo(?P, +L)
-- prefijo(P, L) :- append(P, _, L).


-- iv. Definir el predicado sufijo(?S, +L), donde S es sufijo de la lista L.

-- %sufijo(?S, +L)
-- sufijo(S, L) :- append(_, S, L).


-- v. Definir el predicado sublista(?S, +L), donde S es sublista de la lista L.

-- %sublista(?S, +L)
-- sublista(S, L) :- prefijo(P, L), sufijo(S, P).


-- vi. Definir pertenece(?X, +L), que es verdadero sii el elemento X se encuentra en la lista L.

-- Versión sin append:
-- %pertenece(?X, +L)
-- pertenece(X, [X|_]).
-- pertenece(X, [_|L]) :- pertenece(X, L).

-- Versión con append:
-- %pertenece(?X, +L)
-- pertenece(X, L) :- append(_, [X|_], L).


-- Ejercicio 6

-- Definir el predicado aplanar(+Xs, -Ys), que es verdadero sii Ys contiene los elementos
-- de todos los niveles de Xs, en el mismo orden de aparición

-- %aplanar(+Xs, -Ys)
-- aplanar([], []).
-- aplanar([Z|Xs], Ys) :- aplanar(Z, Zs), aplanar(Xs, Xss), append(Zs, Xss, Ys).
-- aplanar([X|Xs], Ys) :- not(aplanar(X, _)), aplanar(Xs, Xss), append([X], Xss, Ys).


-- Ejercicio 7

-- i. Definir el predicado palindromo(+L, ?L1), donde L1 es un palíndromo de L cuya primera mitad es L.

-- %palindromo(+L, ?L1)
-- palindromo(L, L1) :- reverse(L, LReverse), append(L,LReverse,L1) .

-- ii. Definir el predicado iesimo(?I, +L, ?X), donde X es el elemento en la posición I de la lista L.

-- %iesimo(?I, +L, ?X)
-- iesimo(I, L, X) :- append(L1, [X|_], L), length(L1, I).



