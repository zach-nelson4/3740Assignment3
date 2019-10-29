% Programming Languages Assignment 4
% Zachary Nelson
% April 1st 2019
 
% Question 1

%This states that the empty set is equal to the empty set
equal([],[]).
%By comparing the tails of the two lists, you can eventually tell if they are equal
equal([H|T],[H|T1]) :- equal(T,T1).


% Question 2

%This states that an empty list has a height of 0
height([], 0) .

%This states that the height is the height of the head or the height of the tail + 1. 
height([_,[H|T]],D) :- height(H,D1), height(T,D2), D is (max(D1, D2) + 1) .

% Question 3

%This states that the sum of the empty list is 0, as there is nothing to add to it.
sum([], 0).

%This states how the sum is the sum of the nodes on the head, or the sum of the nodes on the tail.
sum([H|T],S) :- sum(H,S1), sum(T,S2), (S is H + S1 ; S is H + S2) .