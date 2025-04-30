% Facts

% Gender
male(ahmad).
male(ali).
male(bilal).
male(kashif).
male(faraz).

female(sara).
female(zainab).
female(hina).
female(nadia).
female(ayesha).

% Marriages (ahmad has 2 wives)
wife(sara, ahmad).
wife(zainab, ahmad).

% Parent-child relationships
father(ahmad, ali).
father(ahmad, hina).
father(ahmad, bilal).
father(ahmad, nadia).
father(ahmad, kashif).

mother(sara, ali).
mother(sara, hina).

mother(zainab, bilal).
mother(zainab, nadia).
mother(zainab, kashif).

% Rules

parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X).

sister(X, Y) :-
    sibling(X, Y),
    female(X).

% children
child(X, Y) :- parent(Y, X).

% husband
husband(X, Y) :- wife(Y, X).

% wives of a man
wives(X, Y) :- wife(Y, X).

% --- PRINT PREDICATES FOR OUTPUT ---

% Print wives of Ahmad
print_wives :-
    wives(ahmad, W),
    write('Ahmad ki biwi: '), write(W), nl,
    fail.
print_wives.

% Print children of Ahmad
print_children :-
    child(C, ahmad),
    write('Ahmad ka bacha: '), write(C), nl,
    fail.
print_children.

% Print all siblings
print_siblings :-
    sibling(X, Y),
    write(X), write(' aur '), write(Y), write(' behn/bhai hain.'), nl,
    fail.
print_siblings.

% Print brothers of Bilal
print_brothers_of_bilal :-
    brother(X, bilal),
    write(X), write(' is brother of bilal'), nl,
    fail.
print_brothers_of_bilal.

% Main entry point
main :-
    print_wives,
    nl,
    print_children,
    nl,
    print_siblings,
    nl,
    print_brothers_of_bilal.

:- initialization(main).
