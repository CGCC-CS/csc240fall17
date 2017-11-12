father(jobal, padme).
father(anakin, luke).
father(anakin, leia).
father(han, ben).
mother(shmi, anakin).
mother(ruwee, padme).
mother(padme, luke).
mother(padme, leia).
mother(leia, ben).

alias(anakin,darthvader).
alias(darthvader,anakin).
alias(luke,lukeskywalker).
alias(lukeskywalker,luke).
alias(X,X).

same(X,X).

male(luke).
male(john).
male(bob).
male(mike).
female(sarah).
weather(tempe, summer, hot).
weather(tempe, winter, warm).
weather(tempe, fall, hot).
weather(newyork, summer, warm).
weather(seattle, summer, cool).
weather(buenasaires, winter, warm).
%weather(X, Y) :- weather(X, Z, Y). 

baseball(summer).
baseball(spring).
play(X) :- weather(X, Z, Y), baseball(Z), reasonable(Y).
reasonable(warm).
reasonable(hot).

ave_temp(berlin, 49).
ave_temp(karlsruhe, 60).
ave_temp(paris, 55).
ave_temp(belgrade, 52).
ave_temp(chicago, 50).
ave_temp(boston, 48).
ave_temp(johannesburg, 55).
ave_temp(phoenix, 80).
ave_temp(jerusalem, 61).
ave_temp_celsius(Location, C_temp) :- ave_temp(Location, F_temp), C_temp is round((F_temp - 32) * 5 / 9).


president(lincoln).
president(kennedy).
president(bush).
president(bob).
president(X) :- member(X,[washington, adams, jefferson]).

score(tb, 4).
score(bos, 1).
won(X) :- score(X, ScoreX), score(Y, ScoreY), X \= Y, ScoreX >= ScoreY.

happy(bob).
happy(alice).
talkative(bob).

annoying(jarjar).
annoying(X) :- happy(X), talkative(X).


% robot AI
badguy(darthvader).          % badguy/1
badguy(darthmaul).
badguy(kyloren).
badguy(batman, twoface).     % badguy/2
badguy(batman, joker).
badguy(superman, lexluthor).
fight(X) :- badguy(X).
fight(X) :- badguy(_Superhero, X).
% poor bob
fight(X) :- annoying(X).

%write output when file is consulted
:- badguy(superman, X), write(['Superman has defeated ', X]), nl.

% is_integer
is_integer(0) :- !.
is_integer(X) :- Y is X - 1, is_integer(Y).

% equation A + B = C
equation(A, B, C) :- 
%	same(Integer, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]),
%	member(A, Integer),
%	member(B, Integer),
    is_integer(A),
    is_integer(B),
	C is A + B.





