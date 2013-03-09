% code for swi prolog
% database is inside famrel.pl, you can see relationship tree inside famrel_graph.gif
:- [ famrel ].

% X is mother of Y
mother(X,Y):-
  female(X),
  parent(X,Y).

% X is grandparent of Y
grandparent(X,Y):-
  parent(X,Z),
  parent(Z,Y).

% X is brother of Y
brother(X,Y):-
  male(X),
  parent(Z,X),
  parent(Z,Y),
  X \== Y.

% X is aunt of Y
aunt(X,Y):-
  female(X),
  parent(Z,X),
  parent(Z,X1),
  parent(X1,Y),
  X1 \== X.

% X is cousin of Y
cousin(X,Y):-
  parent(Z,S1),
  parent(Z,S2),
  parent(S1,X),
  parent(S2,Y),
  S1 \== S2.

% X is ancestor of Y
ancestor(X,Y):-
  parent(X,Y).

% X is ancestor of Y
ancestor(X,Y):-
  parent(X,Z),
  ancestor(Z,Y).

% X is descendant of Y
descendant(X,Y):-
  parent(Y,X).

descendant(X,Y):-
  parent(Y,Z),
  descendant(X,Z).

% X is connecter with Y(ancestor or descendant)
connected(X,Y):-
  parent(X,Y)
  ;
  parent(Y,X).

connected(X,Y):-
  parent(X,Z),
  connected(Z,Y)
  ;
  parent(Z,X),
  connected(Z,Y).

% X is connecter with Y(ancestor or descendant)
% with stack limitation 
connected(X,Y,_):-
  parent(X,Y)
  ;
  parent(Y,X).

connected(X,Y,N):-
  parent(X,Z),
  N1 is N-1,
  N1 >= 0,
  connected(Z,Y,N1)
  ;
  parent(Z,X),
  N1 is N-1,
  N1 >= 0,
  connected(Z,Y,N1).

% X is connecter with Y(ancestor or descendant)
% with stack limitation and path 
connected(X,Y,_,W):-
  parent(X,Y),
  W = parent(X,Y)
  ;
  parent(Y,X),
  W = child(X,Y).

connected(X,Y,N,W):-
  parent(X,Z),
  N1 is N-1,
  N1 >= 0,
  connected(Z,Y,N1,W1),
  W = parent(X,W1)
  ;
  parent(Z,X),
  N1 is N-1,
  N1 >= 0,
  connected(Z,Y,N1,W1),
  W = child(X,W1).

