learn(Vin, Pred) :-
    print('que pouvez vous nous dire de ce vin:' ),
    lire_question(Input),
    list_to_phrase(Input, Contenu),
    add_fact(Pred, Vin, Contenu).

add_fact(Predicate,X, Y) :-
    Z=[[Y]],

    Fact =.. [Predicate, X, Z],
    assertz(Fact).

list_to_phrase(L,P):-
       atomic_list_concat(L,' ',P).
