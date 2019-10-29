%Programming Languages Assignment 3
%Zachary Nelson
%March 14th 2019

%Defining Males
male(bill).
male(john).
male(frank).
male(joe).
male(larrie).
male(philip).
male(kevin).
male(chris).
male(danny).

%Defining Females
female(anne).
female(dorothy).
female(sharon).
female(rochelle).
female(danelle).
female(marg).
female(connie).
female(corrie).

%Defining Parents
parent(bill,john).
parent(bill,frank).                                                             
parent(bill,joe).
parent(anne,john).
parent(anne,frank).
parent(anne,joe).
parent(john,larrie).
parent(john,sharon).
parent(john,philip).
parent(john,kevin).
parent(dorothy,larrie).
parent(dorothy,sharon).
parent(dorothy,philip).
parent(dorothy,kevin).
parent(larrie,connie).
parent(larrie,corrie).
parent(larrie,chris).
parent(marg,connie).
parent(marg,corrie).
parent(marg,chris).
parent(danny,rochelle).
parent(danny,danelle).
parent(sharon,rochelle).
parent(sharon,danelle).

%Defining father and mother predicates
father(X,Y) :- parent(X,Y) , male(X).
mother(X,Y) :- parent(X,Y) , female(X).

%Defining son and daughter predicates
son(X,Y) :- parent(Y,X) , male(X).
daughter(X,Y) :- parent(Y,X) , female(X).

%Defining brother and sister predicates
brother(X,Y) :- parent(Z,X) , son(Y,Z) , X \= Y.
sister(X,Y) :- parent(Z,X) , daughter(Y,Z) , X \= Y.

%Defining grandmother and grandfather predicates
grandfather(X,Y) :- parent(Z,Y) , father(X,Z).
grandmother(X,Y) :- parent(Z,Y) , mother(X,Z).

%Defining grandson and granddaughter predicates
grandson(X,Y) :- parent(Y,Z) , parent(Z,X), male(X).
granddaughter(X,Y) :- parent(Y,Z) , parent(Z,X), female(X).

%Defining uncle and aunt predicates
uncle(X,Y) :- parent(Z,Y), brother(Z,X).
aunt(X,Y) :- parent(Z,Y), sister(Z,X).

%Defining nephew predicate
nephew(X,Y) :- brother(Z,Y), son(X,Z).
nephew(X,Y) :- sister(Z,Y), son(X,Z).

%Defining niece predicate
niece(X,Y) :- brother(Z,Y), daughter(X,Z).
niece(X,Y) :- sister(Z,Y), daughter(X,Z).

%Defining cousin predicate
cousin(X,Y) :- uncle(Z,Y), son(Z,X).
cousin(X,Y) :- aunt(Z,Y), son(Z,X).
cousin(X,Y) :- uncle(Z,Y), daughter(Z,X).
cousin(X,Y) :- aunt(Z,Y), daughter(Z,X).

%Defining ancestor predicate
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y) , ancestor(X,Z).

%Defining descendant predicate
descendant(X,Y) :- son(X,Y).
descendant(X,Y) :- daughter(X,Y).
descendant(X,Y) :- son(X,Z) , descendant(Z,Y).
descendant(X,Y) :- daughter(X,Z) , descendant(Z,Y).

