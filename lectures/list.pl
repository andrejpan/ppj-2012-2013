% memeber(X, L): X is member of L
member1(X, [X|_]).

member1(X, [_|L]):-
  member1(X, L).

% conc(L1, L2, L3): L3 is concatenation of L1 and L2
conc([], L, L).

conc([X|L1], L2, [X|L3]):-
  conc(L1, L2, L3).

member2(X, L):-
  conc(_, [X|_], L).

% del(X, L, NewList)
del(X, [X|Tail], Tail).

del(X, [Y|Tail], [Y|NewList]):-
  del(X, Tail, NewList).

% insert(X, L, LongerList)
insert(X, List, LongerList):-
  del(X, LongerList, List).

member3(X, L):-
  del(X, L, _).

% sublist(List, Sublist)
sublist(S, L):-
  conc(_, L2, L),
  conc(S, _, L2).
