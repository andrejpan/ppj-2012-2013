?- [list].

link(a,b).
link(a,c).
link(b,d).
link(c,d).
link(c,f).
link(d,e).
link(d,f).
link(f,a).

% path(X,Y): path between X and Y
path(X, X).

path(X, Y):-
  link(X, Z),
  path(Z, Y).
% does the loop, not effective solution

% path(X, Y, Route)
path(X, X, [X]).

path(X, Y, [X|Rest]):-
  link(X, Z),  
  path(Z, Y, Rest).

% ?-conc(P,_,_), path(a,Y,P)

% path1 is not working yet!!!
path1(X, X, [X]).

path1(X, Y, Route):-
  link(X, Z),  
  (
  member(X, Rest),
  Route = Rest
  )
  ;
  (
  Route = [X|Rest]
  ),
  path1(Z, Y, Rest).

