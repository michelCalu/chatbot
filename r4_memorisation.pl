:- multifile regle/3.

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

% questions relatives à un vin déjà cité (mot clé : davantage)
%
% Pouvez-vous m'en dire davantage ?
% Pouvez-vous m'en dire davantage sur le [vin] ?

% cas sans vin dans la question
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin_cite(ID_Vin),
                      nom(ID_Vin, Nom_Vin),
                      get_propriete_non_citee([Propriete]),
                      produire_reponse([Propriete|Nom_Vin], Reponse).

% cas avec un vin dans la question
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID_Vin),
                      nom(ID_Vin, Nom_Vin),
                      mod_vin_cite(ID_Vin, rien),
                      get_propriete_non_citee([Propriete]),
                      produire_reponse([Propriete|Nom_Vin], Reponse).

% cas où toutes les propriétés ont été citées
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin_cite(ID_Vin),
                      nom(ID_Vin, Nom_Vin),
                      get_propriete_non_citee([]),
                      reset_vin_cite(),
                      Reponse = [['vous savez tout au sujet du'|Nom_Vin]].

% cas où il n'y a pas de vin en mémoire
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      pas_de_vin_cite(),
                      Reponse = [['je ne vois pas de quel vin vous parlez']].
