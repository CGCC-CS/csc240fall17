father(jobal, padme).
father(anakin, luke).
father(anakin, leia).
father(han, ben).
mother(shmi, anakin).
mother(ruwee, padme).
mother(padme, luke).
mother(padme, leia).
mother(leia, ben).
alias(darthvader,anakin).
alias(luke,lukeskywalker).
alias(X,Y) :- alias(Y,X).

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
weather(City, Temp) :- weather(City, _Season, Temp).

avg_temp(berlin, 49).
avg_temp(karlsruhe, 60).
avg_temp(paris, 55).
avg_temp(belgrade, 52).
avg_temp(chicago, 50).
avg_temp(boston, 48).
avg_temp(johannesburg, 55).
avg_temp(phoenix, 80).
avg_temp(jerusalem, 61).

avg_temp_celsius(Location, C_temp) :-
	avg_temp(Location, F_temp),
	C_temp is round((F_temp - 32) * 5 / 9).


baseball(summer).
baseball(spring).
reasonable(warm).
reasonable(hot).
play(City) :- weather(City, Season, Temp), 
	baseball(Season), 
	reasonable(Temp).

president(lincoln).
president(kennedy).
president(bush).
president(X) :- member(X,[washington, adams, jefferson]).

score(spurs, 97).
score(mavericks, 91).
won(X) :- score(X, ScoreX), score(_Y, ScoreY), ScoreX > ScoreY.
beatthespread(X) :- score(X, ScoreX), score(_Y, ScoreY), 
	AdjScoreX is ScoreX - 6, AdjScoreX >= ScoreY.

happy(bob).
happy(alice).
talkative(bob).
annoying(jarjar).
annoying(X) :- talkative(X), happy(X).

% Robot AI
badguy(darthvader).       % badguy/1
badguy(darthmaul).
badguy(kyloren).
badguy(batman, twoface).  % badguy/2
badguy(batman, joker).
badguy(superman, lexluthor).
fight(X) :- badguy(X).
fight(X) :- badguy(_, X).
% poor bob & alice!
fight(X) :- annoying(X).
fight(alice).

%write outupt when file is consulted!
:- badguy(superman, X), write('Superman has defeated '), write(X), nl.
%:- badguy(wonderwoman, X), write('Superman has defeated '), write(X), nl.


% equation A + B = C
equation(A, B, C) :- 
	same(Integer, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]),
	member(A, Integer), 
	member(B, Integer), 
	C is A + B.


is_integer(0) :- !.
is_integer(X) :- Y is X - 1, is_integer(Y).

