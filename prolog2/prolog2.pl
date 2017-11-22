knows_scheme(bob).
knows_scheme(alice).
knows_prolog(alice).
passes_240(X) :- knows_scheme(X), knows_prolog(X).

factorial(1,1) :- !.
factorial(N, F) :- N1 is N - 1, factorial(N1, F1), F is N * F1.

location(london, 51, 0).
location(phoenix, 33, 112).
location(tokyo, 35, -139).
location(rome, 41, -12).
location(madrid, 48, 3).
location(canberra, -35, -149).
location(johannesburg, -26, -28).

% execute on consulting
:- location(phoenix, Lat, Long), write('Phoenix Lat: '), write(Lat),
	                             write(' Long: '), write(Long), nl.

north_of(X,Y) :- 
	location(X, LatX, _LongX),
	location(Y, LatY, _LongY),
	LatX > LatY.
	
west_of(X,Y) :- 
	location(X, _LatX, LongX),
	location(Y, _LatY, LongY),
	LongX > LongY.
	
% math
double(X,Y) :- Y is 2 * X.
increment(X,Y) :- Y is X + 1.
less_than_square_root(X,Y) :- Y < sqrt(X).
tangent(X,Y) :- Y is tan(X).
divides(X,Y) :- 0 is X mod Y.

% family
father(bob, alice).
mother(sue, james).
mother(sue, alice).
mother(ann, sue).

dad(X,Y) :- father(X,Y).
parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
child(X,Y) :- father(Y,X).
child(X,Y) :- mother(Y,X).

ancestor(A,D) :- parent(A,D).
ancestor(A,D) :- parent(A,P), ancestor(P,D).


% graphs
% the list of edges in a directed graph: 
edge(a,b). 
edge(a,c). 
edge(b,d). 
edge(c,d). 
edge(c,f). 
edge(d,e). 
edge(f,g). 
edge(g, h). 
edge(i,j). 

connected(Node1, Node2) :- edge(Node1, Node2), !. 
connected(Node1, Node2) :- edge(Node1, NodeX), connected(NodeX, Node2). 

% lists & pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailList ]
pairparts([H | T], H, T).
starts_with_same_two([H, H | _T]).
at_least_two_in_list([_, _ | _]).
third_in_list([_,_,Third | _T], Third).

% return first thing in a list
first([H | _T], H).

% list predicate
islist([]).
islist([_H | T]) :- islist(T).

% find last element of a list
lastelement([X],X).
lastelement([_H|T], Last) :- lastelement(T,Last).

% firsttwo/3
firsttwo([H1, H2 | _T], H1, H2).
% firsttwo/2
firsttwo([H1, H2 | _T], [H1, H2]).

% sum first X elements
sum_first_x(_List, 0, 0) :- !.
sum_first_x([H | T], X, Sum) :-
	X1 is X - 1,
	sum_first_x(T, X1, SumTail),
	Sum is H + SumTail.

addhead(List, Element, [Element | List]).
doublehead([H | T], [H, H | T]).

% size of a list
listsize([], 0) :- !.
listsize([_H | T], S) :- listsize(T, SizeTail), S is SizeTail + 1.

% increment each member of the list
addonetoall([],[]) :- !.
addonetoall([H | T], [H1 | T1]) :- H1 is H + 1, addonetoall(T, T1).

% keep only multiples of 3
onlymults3([],[]) :- !.
onlymults3([H | T], [H | T1]) :- 0 is H mod 3, onlymults3(T, T1).
onlymults3([H | T], T1) :- X is H mod 3, X > 0, onlymults3(T, T1).

% remove every other element
remove_eo([], []) :- !.
remove_eo([X], [X]) :- !.
remove_eo([H1, _H2 | T], [H1 | T1]) :- remove_eo(T, T1).
remove_eo([H1, _H2 | T], [H1 | T1]) :- remove_eo(T, T1).



