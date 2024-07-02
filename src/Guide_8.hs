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


-- Ejercicio 8

-- Definir los predicados usando member/2 y/o append/3 según corresponda.

-- i. interseccion(+L1, +L2, -L3), tal que L3 es la intersección sin repeticiones
-- de las listas L1 y L2, respetando en L3 el orden en que aparecen los elementos en L.

-- %interseccion(+L1, +L2, -L3)
-- interseccion([], _, []).
-- interseccion([X|L1], L2, L3) :- not(member(X, L2)), interseccion(L1, L2, L3).
-- interseccion([X|L1], L2, [X|L3]) :- member(X, L2), borrar(L1, X, L1SinX), interseccion(L1SinX, L2, L3).

-- %partir(+N, +L, -L1, -L2)
-- partir(0, L, [], L).
-- partir(N, [H|T], [H|L1], L2) :- N > 0, N1 is N - 1, partir(N1, T, L1, L2).

-- For the predicate partir/4, all parameters (N, L, L1, and L2) are reversible. Each parameter can be deduced if the
-- others are known, as evidenced by the logical structure of the predicate and successful test queries with various
-- combinations of bound and unbound parameters.


-- ii. borrar(+ListaOriginal, +X, -ListaSinXs), que elimina todas las ocurrencias de X de la lista ListaOriginal.

-- %borrar(+ListaOriginal, +X, -ListaSinXs)
-- borrar([], _, []).
-- borrar([X|T], X, L) :- borrar(T, X, L).
-- borrar([H|T], X, [H|L]) :- X \= H, borrar(X, T, L).


-- iii. sacarDuplicados(+L1, -L2), que saca todos los elementos duplicados de la lista L1.

-- %sacarDuplicados(+L1, -L2)
-- sacarDuplicados([], []).
-- sacarDuplicados([H|T], L) :- member(H, T), sacarDuplicados(T, L).
-- sacarDuplicados([H|T], [H|L]) :- not(member(H, T)), sacarDuplicados(T, L).

-- %cantApariciones(+X, +L, -N)
-- cantApariciones(_, [], 0).
-- cantApariciones(X, [X|T], N) :- cantApariciones(X, T, M), N is M + 1.
-- cantApariciones(X, [H|T], N) :- X \= H, cantApariciones(X, T, N).


-- iv. permutación(+L1, ?L2), que tiene éxito cuando L2 es permutación de L1.

-- %permutacion(+L1, ?L2)
-- permutacion([], []).
-- permutacion([X|Xs], Ys) :-
--   borrar(Xs, X, XsSinX),
--   borrar(Ys, X, YsSinX),
--   length([X|Xs], Xn),
--   length(Ys, Yn),
--   Xn = Yn,
--   permutacion(XsSinX, YsSinX).


-- v. reparto(+L, +N, -LListas) que tenga éxito si LListas es una lista de N listas
-- (N ≥ 1) tales que al concatenarlas se obtiene la lista L.

-- %reparto(+L, +N, -LListas)
-- reparto(L, 1, [L]).
-- reparto(L, N, [L1|LListas]) :- N > 1, N1 is N - 1, append(L1, L2, L), reparto(L2, N1, LListas).


-- vi. repartoSinVacías(+L, -LListas) similar al anterior, pero ninguna de las listas en LListas puede ser vacía.

-- %repartoSinVacias(+L, -LListas)
-- repartoSinVacias(L, LListas) :- length(L, N), between(1,N,M), reparto(L, M, LListas), not(member([], LListas)).


-- Ejercicio 9

-- elementosTomadosEnOrden(+L,+N,-Elementos), que tenga éxito si L es una lista, N ≥ 0 y Elementos es una lista de
-- N elementos de L, preservando el orden en que aparecen en la lista original.

-- %elementosTomadosEnOrden(+L, +N,-Elementos)
-- elementosTomadosEnOrden(L, N, Elementos) :- length(L, M), between(0, M, N), tomar(L, N, Elementos).

-- %tomar(+L, +N, -Elementos)
-- tomar(_, 0, []).
-- tomar(Xs, 1, [X]) :- pertenece(X, Xs).
-- tomar(Xs, N, [X,Y|Resto]) :-
--   N > 1,
--   N1 is N - 1,
--   pertenece(X, Xs),
--   pertenece(Y, Xs),
--   iesimo(Ix, Xs, X),
--   iesimo(Iy, Xs, Y),
--   Ix < Iy,
--   tomar(Xs, N1, [Y|Resto]).


-- Ejercicio 10

-- %desde(+X, -Y)
-- desde(X, X).
-- desde(X, Y) :- N is X + 1, desde(N, Y).


-- %desde2(+X, ?Y)
-- desde2(X, X).
-- desde2(X, Y) :- var(Y), N is X + 1, desde2(N, Y). % Y no está instanciada
-- desde2(X, Y) :- nonvar(Y), X < Y.                 % Y está instanciada


-- %pmq(+X, -Y)
-- pmq(X, Y) :- between(0, X, Y), Y mod 2 =:= 0.


-- Ejercicio 11

-- % intercalar(+L1, +L2, -L3)
-- intercalar([], [], []).
-- intercalar([], L2, L2).
-- intercalar(L1, [], L1).
-- intercalar([X|L1], [Y|L2], [X,Y|L3]) :- intercalar(L1, L2, L3).

-- Es reversible en todos los parámetros. Si se conoce L1 y L2, se puede deducir L3 y viceversa.


-- Ejercicio 12

-- Un árbol binario se representa en Prolog con:
-- nil, si el árbol es vacío
-- bin(izq, v, der), árbol con nodo valor v, hijo izquierdo izq y hijo derecho der.

-- i. vacio(+A), que tenga éxito si A es un árbol binario vacío.

-- %vacio(+A)
-- vacio(nil).

-- ii. raiz(+A, -V), que tenga éxito si V es la raíz del árbol A.

-- %raiz(+A, -V)
-- raiz(bin(_, V, _), V).

-- iii. altura(+A, -N), que tenga éxito si N es la altura del árbol A.

-- %altura(+A, -N)
-- altura(nil, 0).
-- altura(bin(Izq, _, Der), N) :- altura(Izq, Ni), altura(Der, Nd), N is max(Ni, Nd) + 1.

-- iv. cantidadNodos(+A, -N), que tenga éxito si N es la cantidad de nodos del árbol A.

-- %cantidadNodos(+A, -N)
-- cantidadNodos(nil, 0).
-- cantidadNodos(bin(Izq, _, Der), N) :- cantidadNodos(Izq, Ni), cantidadNodos(Der, Nd), N is Ni + Nd + 1.


-- Ejercicio 13

-- i. inorder(+AB, -Lista), que tenga éxito si AB es un árbol binario y Lista es la lista de los nodos de AB en recorrido inorder.

-- %inorder(+AB, -Lista)
-- inorder(nil, []).
-- inorder(bin(Izq, V, Der), Lista) :- inorder(Izq, L1), inorder(Der, L2), append(L1, [V|L2], Lista).


-- ii. arbolConNodos(+Lista, -AB), que tenga éxito si AB es un árbol binario con los nodos de Lista.

-- %arbolConNodos(+Lista, -AB)
-- arbolConNodos([], nil).
-- arbolConNodos(Lista, bin(Izq, V, Der)) :- partir(_, Lista, L1, [V|L2]), arbolConNodos(L1, Izq), arbolConNodos(L2, Der).

-- %arbolConNodosInorder(+Lista, -AB)
-- arbolConNodosInorder([], nil).
-- arbolConNodosInorder(Lista, bin(Izq, V, Der)) :- append(L1, [V|L2], Lista), arbolConNodosInorder(L1, Izq), arbolConNodosInorder(L2, Der).


-- iii. aBB(+T), que tenga éxito si T es un árbol binario de búsqueda.

-- %aBB(+T)
-- aBB(nil).
-- aBB(bin(nil, _, nil)).
-- aBB(bin(Izq, V, nil)) :- aBB(Izq), raiz(Izq, Vi), Vi < V.
-- aBB(bin(nil, V, Der)) :- aBB(Der), raiz(Der, Vi), V < Vi.
-- aBB(bin(Izq, V, Der)) :- aBB(Izq), aBB(Der), raiz(Izq, Vi1), raiz(Der, Vi2), Vi1 < V, V < Vi2.


-- iv. aBBInsertar(+X, +T1, -T2), que tenga éxito si T2 es el árbbol binario de búsqueda que resulta de insertar X en T1.

-- %aBBInsertar(+X, +T1, -T2)
-- aBBInsertar(X, nil, bin(nil, X, nil)).
-- aBBInsertar(X, bin(Izq, V, Der), bin(Izq, V, Der)) :- X = V.
-- aBBInsertar(X, bin(Izq1, V, Der), bin(Izq2, V, Der)) :- X < V, aBBInsertar(X, Izq1, Izq2).
-- aBBInsertar(X, bin(Izq, V, Der1), bin(Izq, V, Der2)) :- X > V, aBBInsertar(X, Der1, Der2).

-- Estamos considerando que las variables X y V están instanciadas, es decir que en términos de la reversibilidad de los
-- predicados, ni X ni T1 pueden ser deducidos si T2 es conocido. Por lo tanto, el predicado es reversible solo en T2.


-- Ejercicio 14

-- Definir coprimos(-X, -Y), que tenga éxito si X e Y son coprimos, es decir, si no tienen divisores comunes mayores a 1.

-- %coprimos(-X, -Y)
-- coprimos(X, Y) :- generarPares(X, Y), 1 is gcd(X, Y).

-- %generarPares(-X, -Y)
-- generarPares(X, Y) :- desde2(1, Z), Z1 is Z - 1, between(1, Z1, X), Y is Z - X.


-- Ejercicio 15

-- i. Definir el predicado cuadradoSemiLatino(+N, -XS) que tenga éxito si XS es una matriz cuadrada de NxN compuesta por
-- números naturales incluyendo el 0, tal todas las filas suman lo mismo. Devolver las matrices XS de manera ordenada.

-- %cuadradoSemiLatino(+N, -XS)
-- cuadradoSemiLatino(N, XS) :- N > 1, length(XS, N), desde2(0, L), columnaSemiLatina(N, L, XS).

-- %columnaSemiLatina(+N, +L, -XS)
-- columnaSemiLatina(_, _, []).
-- columnaSemiLatina(N, L, [X|XS]) :- length(X, N), filaSemiLatina(N, L, X), columnaSemiLatina(N, L, XS).

-- %filaSemiLatina(+N, +L, -F)
-- filaSemiLatina(N, L, F) :- length(F, N), filaSuma(F, L).

-- %filaSuma(?XS, +N)
-- filaSuma([X], X).
-- filaSuma([X|XS], N) :- between(0, N, X), Z is N-X, filaSuma(XS, Z).


-- ii. Definir el predicado cuadradoMagico(+N, -XS) que instancia XS con cuadrados cuyas filas y columnas suman todas un mismo valor.

-- %cuadradoMagico(+N, -XS)
-- cuadradoMagico(N, XS) :-
--   N > 1,
--   generarCuadrado(N, XS),  % Generate
--   esCuadradoMagico(N, XS). % Test

-- %esCuadradoMagico(+N, +XS)
-- esCuadradoMagico(N, XS) :-
--   nth1(1, XS, PrimeraFila),
--   sum_list(PrimeraFila, Referencia),
--   forall(between(1, N, Fila), sumarFila(Fila, XS, Referencia)),
--   forall(between(1, N, Columna), sumarColumna(Columna, XS, Referencia)).

-- %sumarFila(+F, +XS, -SFila)
-- sumarFila(F, XS, SFila) :- nth1(F, XS, Fila), sum_list(Fila, SFila).

-- %sumarColumna(+C, +XS, -SColumna)
-- sumarColumna(C, XS, SColumna) :- maplist(nth1(C), XS, Columna), sum_list(Columna, SColumna).

-- %generarCuadrado(+N, -XS)
-- generarCuadrado(N, XS) :- length(XS, N), desde2(1, L), generarColumna(N, L, XS).

-- %generarColumna(+N, +L, -XS)
-- generarColumna(_, _, []).
-- generarColumna(N, L, [X|XS]) :- length(X, N), generarFila(N, L, X), generarColumna(N, L, XS).

-- %generarFila(+N, +L, -F)
-- generarFila(_, _, []).
-- generarFila(N, L, [F|FS]) :- between(0, L, F), Fila is N-1, generarFila(Fila, L, FS).


-- Ejercicio 16

-- tri(A, B, C) denotará un triángulo con lados de longitud A, B y C
-- tri(A, B, C) :- A > 0, B > 0, C > 0.


-- i. esTriangulo(+T), que tenga éxito si es un triángulo válido.

-- %esTriangulo(+T)
-- esTriangulo(tri(A, B, C)) :- A + B > C, A + C > B, B + C > A.


-- ii. perimetro(?T, ?P), que es verdad si P es el perímetro del triángulo válido T.

-- %perimetro(?T, ?P)
-- perimetro(tri(A, B, C), P) :- ground(tri(A, B, C)), esTriangulo(tri(A, B, C)), P is A + B + C.
-- perimetro(tri(A, B, C), P) :- not(ground(tri(A, B, C))), generarTriplas(A, B, C), esTriangulo(tri(A, B, C)), P is A + B + C.

-- %generarTriplas(-A, -B, -C)
-- generarTriplas(A, B, C) :- desde2(3, P), between(0, P, A), S is P - A, between(0, S, B), C is S - B.


-- iii. triangulo(-T), que genera triángulos válidos, sin repetirlos.

-- %triangulo(-T)
-- triangulo(T) :- perimetro(T, _).


-- Ejercicio 17

-- frutal(frutilla).
-- frutal(banana).
-- frutal(manzana).
-- cremoso(banana).
-- cremoso(americana).
-- cremoso(frutilla).
-- cremoso(dulceDeLeche).

-- leGusta1(X) :- frutal(X), cremoso(X).
-- cucurucho1(X,Y) :- leGusta1(X), leGusta1(Y).

-- leGusta2(X) :- frutal(X), cremoso(X).
-- cucurucho2(X,Y) :- leGusta2(X), !, leGusta2(Y).

-- leGusta3(X) :- frutal(X), cremoso(X).
-- cucurucho3(X,Y) :- leGusta3(X), leGusta3(Y), !.


-- i. Escribir el árbol de búsqueda para la consulta cucurucho1(X,Y).

-- cucurucho1(X,Y).
-- leGusta1(X), leGusta1(Y).
-- frutal(X), cremoso(X), leGusta1(Y).
-- frutal(frutilla), cremoso(frutilla), leGusta1(Y). { X := frutilla }
-- frutal(frutilla), cremoso(frutilla), frutal(Y), cremoso(Y).
-- frutal(frutilla), cremoso(frutilla), frutal(frutilla), cremoso(frutilla). { Y := frutilla }
-- { X := frutilla, Y := frutilla }
-- frutal(frutilla), cremoso(frutilla), frutal(Y), cremoso(Y).
-- frutal(frutilla), cremoso(frutilla), frutal(banana), cremoso(banana). { Y := banana }
-- { X := frutilla, Y := banana }
-- frutal(X), cremoso(X), leGusta1(Y).
-- frutal(banana), cremoso(banana), leGusta1(Y). { X := banana }
-- frutal(banana), cremoso(banana), frutal(Y), cremoso(Y).
-- frutal(banana), cremoso(banana), frutal(frutilla), cremoso(frutilla). { Y := frutilla }
-- { X := banana, Y := frutilla }
-- frutal(banana), cremoso(banana), frutal(Y), cremoso(Y).
-- frutal(banana), cremoso(banana), frutal(banana), cremoso(banana). { Y := banana }
-- { X := banana, Y := banana }


-- ii. Cuando se utiliza cucurucho2/2 no se realiza backtracking en la primer aparición de leGusta2/1. En cambio, cuando
-- se utiliza cucurucho3/2, no se realiza backtracking cuando se llega al primer resultado exitoso del predicado completo.


-- Ejercicio 19

-- Definir el predicado corteMasParejo(+L, -L1, -L2), que dada una lista L de números naturales, realice el corte
-- en las listas L1 y L2 de manera que la diferencia entre la suma de los elementos de L1 y L2 sea la mínima posible.

-- %corteMasParejo(+L, -L1, -L2)
-- corteMasParejo(L, L1, L2) :- unCorte(L, L1, L2, D), forall((unCorte(L, _, _, D1), D1 < D), D1 = D).

-- %unCorte(+L, -L1, -L2, -D)
-- unCorte(L, L1, L2, D) :- append(L1, L2, L), sum_list(L1, S1), sum_list(L2, S2), D is abs(S1 - S2).


-- Ejercicio 20

-- Dado un predicado unario P sobre números naturales, definir un predicado que determine el mínimo X tal que P(X) es verdadero.

-- %minimoTalQueP(-X)
-- minimoTalQueP(X) :- desde2(0, X), unTalP(X), !.


-- Ejercicio 21

-- Suponiendo la existencia de perteneceConjunto/2 y dado el siguiente predicado:
-- natural(cero).
-- natural(suc(X)) :- natural(X).

-- i. Definir el predicado conjuntoDeNaturales(X) que sea verdadero cuando todos los elementos de X son números naturales.

-- %conjuntoDeNaturales(+X)
-- conjuntoDeNaturales(X) :- forall(perteneceConjunto(E, X), natural(E)).

-- iii. ¿Por qué no funciona: conjuntoDeNaturalesMalo(X) :- not( (not(natural(E)), pertenece(E,X)) ).?

-- La expresión se puede leer como: "No es verdad que exista un elemento E tal que E no sea un número natural y E
-- pertenezca al conjunto X." conjuntoDeNaturalesMalo(X) es verdadero si no hay ningún elemento en el conjunto X que no
-- sea un número natural.


-- Ejercicio 23

-- esNodo(+G, ?X), que dado un grafo G, tiene éxito si X es un nodo de G.
-- esArista(+G, ?X, ?Y), que dado un grafo G, tiene éxito si hay una arista entre X e Y.

-- Ambos predicados pueden utilizarse para enumerar todos los nodos y aristas de un grafo, respectivamente.

-- i. Implementar el predicado caminoSimple(+G, +D, +H, ?L), que tenga éxito si L es un camino simple entre D y H en
-- el grafo G. Un camino simple es un camino en el que no se repiten nodos.

-- %caminoSimple(+G, +D, +H, ?L)
-- caminoSimple(G, D, H, L) :- camino(G, D, H, L), sinRepetidos(L).

-- %camino(+G, +D, +H, ?L)
-- camino(_, D, D, [D]).
-- camino(G, D, H, [D|L]) :- esNodo(G, D), esArista(G, D, X), camino(G, X, H, L).

-- %sinRepetidos(+L)
-- sinRepetidos([]).
-- sinRepetidos([_]).
-- sinRepetidos([X,Y|L]) :- not(member(X, [Y|L])), sinRepetidos([Y|L]).


-- ii. Implementar el predicado caminoHamiltoniano(+G, ?L), que tenga éxito si L es un camino hamiltoniano en el grafo G.

-- %caminoHamiltoniano(+G, ?L)
-- caminoHamiltoniano(G, L) :-
--   esNodo(G, D),
--   esNodo(G, H),
--   D \= H,
--   caminoSimple(G, D, H, L),
--   sinRepetidos(L),
--   not((esNodo(G, N), not(member(N, L)))).


-- Ejercicio de Parcial

-- i. Definir el predicado matrices(+LS, -L) que es verdadero si L es una matriz cuadrada formada por listas de LS.

-- %matrices(+LS, -L)
-- matrices(FS, L) :-
--   generarMatrices(FS, L), % Generate
--   esMatrizCuadrada(L).    % Test

-- %generarMatrices(+FS, -L)
-- generarMatrices(FS, L) :-
--   length(FS, N),
--   between(1, N, M),
--   tomadosDesordenados(FS, M, L).

-- %tomadosDesordenados(+L, +N, -Elementos)
-- tomadosDesordenados(_, 0, []).
-- tomadosDesordenados(Xs, 1, [X]) :- pertenece(X, Xs).
-- tomadosDesordenados(Xs, N, [X|Resto]) :-
--   N > 1,
--   N1 is N - 1,
--   pertenece(X, Xs),
--   borrar(Xs, X, XsSinX),
--   tomadosDesordenados(XsSinX, N1, Resto).

-- %esMatrizCuadrada(+L)
-- esMatrizCuadrada(L) :- length(L, N), N > 1, forall(member(F, L), length(F, N)).

-- ii. Definir el predicado diagonal(+M, -D) que tenga éxito si D es la diagonal de la matriz M.

-- %diagonal(+M, -D)
-- diagonal(M, D) :- length(M, N), extraerDiagonales(M, N, Ds), sum_list(Ds, D).

-- %extraerDiagonales(+M, +N, -Ds)
-- extraerDiagonales(M, 1, [D]) :- nth1(1, M, F), nth1(1, F, D).
-- extraerDiagonales(M, N, [D|Ds]) :- nth1(N, M, F), nth1(N, F, D), N1 is N - 1, extraerDiagonales(M, N1, Ds).

-- iii. Definir el predicado matrizConDiagonalMayor(+LS, -M) que es verdaderos cuando M es una matriz cuadrada
-- que aparece en LS y cuyos elementos de la diagonal suman la mayor cantidad posible.

-- %matrizConDiagonalMayor(+LS, -M)
-- matrizConDiagonalMayor(LS, M) :-
--   pertenece(M, LS),
--   diagonal(M, D),
--   forall((pertenece(M1, LS), M1 \= M), (diagonal(M1, D1), D1 =< D)).