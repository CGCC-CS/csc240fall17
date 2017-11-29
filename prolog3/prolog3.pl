flip_three([H1, H2, H3 | T], [H3, H2, H1 | T]) :- !.
flip_three(X, X).

% myreverse(X,Y) :- reverse(X,Y).
myreverse([],[]) :- !.
%myreverse([H | T], [T1 | H]) :- myreverse(T,T1).
%myreverse([H | T], [T1 | [H]]) :- myreverse(T,T1).
myreverse([H | T], Result) :- myreverse(T,T1), append(T1,[H],Result).

change(H, Q, D, N, P) :- 
	member(N, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
	member(D, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]),
	member(Q, [0, 1, 2, 3, 4]),
	member(H, [0, 1, 2]),
	S is ( (H * 50) + (Q * 25) + (D * 10) + (N * 5) ),
    S =< 100,
	P is 100 - S.

weather(phoenix, summer, hot).
weather(phoenix, winter, warm).
weather(wellington, summer, hot).
weather(wellington, winter, cold).
weather(toronto, summer, warm).
weather(toronto, winter, cold).

%warm_blooded(dinosaur).
warm_blooded(cat).
warm_blooded(dog).     
warm_blooded(chicken). 
%four_legs(lizard).
four_legs(cat).
four_legs(dog).
two_legs(chicken).
mammal0(M) :- warm_blooded(M), four_legs(M).
mammal1(M) :- !, warm_blooded(M), four_legs(M).
mammal1(dinosaur).
mammal2(M) :- warm_blooded(M), !, four_legs(M).
mammal2(dinosaur).
mammal2a(M) :- four_legs(M), !, warm_blooded(M).
mammal3(M) :- warm_blooded(M), four_legs(M), !.


get_digit(X) :- 
	repeat,
	write('Enter a digit:'), 
	get0(X1), 
	X1 > 41, 
	X1 < 58, 
	X is X1 - 48,
	!.
