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

#const n=4.
#const m=2.

row(1..n).
col(1..n).
subgrid(1..n).

% adj(C1, C2) :- C1 = 1..c, C2 = 1..c, |C1-C2| = 1.

% getsub(X1, Y1) :- X1 = 1..n, Y1= 1..n, 1+(((X1-1)/n)*n+(Y1-1)/n).

% samesub(X, Y, X', Y') :- X = 1..n, Y = 1..n, X' = 1..n, Y' = 1..n, (Y  / m) + (X / m) * m = (Y'  / m) + (X' / m) * m.
% samesub(X, Y, X', Y') :- X = 1..n, Y = 1..n, X' = 1..n, Y' = 1..n, 1+(((X-1)/m)*m+(Y-1)/m) = 1+(((X'-1)/m)*m+(Y'-1)/m).


% getsub(X, Y) :- (1+(((X-1)/n)*n+(Y-1)/n)).

sudoku(X, Y, N) :- initial(X, Y, N).

{ sudoku(X, Y, N) : row(X), col(Y), X = 1..4, Y = 1..4, N = 1..4}.
:- { sudoku(X, Y, N) } != n*n.
:- sudoku(X, Y, N), sudoku(X, Y', N), Y!=Y'.
:- sudoku(X, Y, N), sudoku(X', Y, N), X!=X'.
:- sudoku(X, Y, N), sudoku(X, Y, N'), N!=N'.
% :- sudoku(X, Y, N), sudoku(X', Y', N), (X, Y) != (X', Y'), 1+(((X-1)/n)*n+(Y-1)/n) != 1+(((X'-1)/n)*n+(Y'-1)/n).
% :- sudoku(X, Y, N), sudoku(X', Y, N), 1+(((X-1)/n)*n+(Y-1)/n) != 1+(((X'-1)/n)*n+(Y-1)/n).
% :- sudoku(X, Y, N), sudoku(X, Y', N), 1+(((X-1)/n)*n+(Y-1)/n) != 1+(((X-1)/n)*n+(Y'-1)/n).

% :- sudoku(X, Y, N), sudoku(X', Y', N), getsub(X, Y) != getsub(X', Y').

% quadrant 1
% :- sudoku(X, Y, N), sudoku(X', Y', N'), X <= 2, Y <= 2, X' <= 2, Y' <= 2, N!=N'.

#show sudoku/3.
