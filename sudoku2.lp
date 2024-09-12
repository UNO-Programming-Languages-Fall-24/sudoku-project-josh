% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% initial(1,2,2).
% initial(2,4,4).
% initial(3,1,2).
% initial(4,3,1).

#const n=9.
#const m=3.

samesub(X, Y, X', Y') :- X = 1..n, Y = 1..n, X' = 1..n, Y' = 1..n, 1+(((X-1)/m)*m+(Y-1)/m) = 1+(((X'-1)/m)*m+(Y'-1)/m).

sudoku(X, Y, N) :- initial(X, Y, N).
subgrid(X, Y, G) :- X = 1..n, Y = 1..n, G = 1+(((X-1)/m)*m+(Y-1)/m).

{ sudoku(X,1..n, N) } = 1 :- X = 1..n, N = 1..n.
{ sudoku(1..n,Y, N) } = 1 :- Y = 1..n, N = 1..n.
:- sudoku(X, Y, N), sudoku(X, Y, N'), N!=N'.
:- sudoku(X, Y, N), sudoku(X', Y', N), (X, Y) != (X', Y'), samesub(X, Y, X', Y').

#show sudoku/3.
