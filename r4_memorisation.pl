regle([autre,6],[
                [1, [_],0 , Reponse ]], _):-
                      nb_getval(depart,X),
                      X>1,
                      nb_setval(memory,0),
                      nb_getval(old_question,L_Mots),
                      writeln('Oui, j''en ai encore'),
                      Reponse = [],
                      produire_reponse(L_Mots,L_ligne_reponse),!,
                      ecrire_reponse(L_ligne_reponse),!.


regle([autre,6],[
                [1, [_],0 , Reponse ]], _):-
                      nb_getval(depart,X),
                      X<2,
                      Reponse = [['non, desole'],[X]].
