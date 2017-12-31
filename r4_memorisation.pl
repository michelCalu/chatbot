removehead([_|Tail], Tail).

regle([autre,6],[
                [1, [_],0 , Reponse ]], _):-
                      nb_getval(depart,X),
                      X>1,
                      nb_setval(memory,0),
                      nb_getval(old_question,L_Mots),
                      produire_reponse(L_Mots,L_ligne_reponse),!,
                      removehead(L_ligne_reponse,L_ligne_reponse2),
                      Reponse = [['oui, j''en ai encore']|L_ligne_reponse2].

regle([autre,6],[
                [1, [_],0 , Reponse ]], _):-
                      nb_getval(depart,X),
                      X<2,
                      Reponse = [['non, desole'],[X]].
