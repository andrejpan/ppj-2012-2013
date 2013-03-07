% see(Block,X,Y)
see(a,2,5).
see(d,5,5).
see(e,5,2).

% on(Block, BlockOrTable).
on(a,b).
on(b,c).
on(c,table).
on(d,table).
on(e,table).

%z(Block, Z): z-coord. of Block
%not working well, no idea yet, why...
%z(B,0):-
%  on(B,table).
%
%z(B,Z):-
%  on(B,BO),
%  z(B0,Z0),
%  Z is Z0 + 1.  

z1(B,0):-
  on(B,table).

z1(B,Z0+1):-
  on(B, B0),
  z1(B0,Z0).

z2(B,0):-
  on(B,table).

z2(B, Z0 + height(B)):-
  on(B,B0),
  z2(B0, Z0).

% xy(Block,X,Y): X,Y coordinates of Block
xy(B,X,Y):
  see(B,X,Y).

xy(B,X,Y):-
  on(B0,B),
  xy(B0,X,Y).	

% B above B1 in the same stack
above(B,B1):-
  on(B,B1).

above(B,B1):-
  on(B,B2),
  above(B2,B1).
