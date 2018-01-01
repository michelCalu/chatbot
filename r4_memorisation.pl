:- multifile regle/3.

% questions relatives à une liste mémorisée (mot clé : autre)
%
% En avez-vous d'autres ?

regle([autre,6],[
                [1, [_],0 , Reponse ]], _):-
                      get_three_elem_memo(LVins),
                      rep_lvins(LVins, Reponse).

% questions relatives à un vin déjà cité (mot clé : davantage)
%
% Pouvez-vous m'en dire davantage ?
% Pouvez-vous m'en dire davantage sur le [vin] ?

% cas sans vin dans la question
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin_memo(ID_Vin),
                      nom(ID_Vin, Nom_Vin),
                      get_propriete_non_citee([Propriete]),
                      produire_reponse([Propriete|Nom_Vin], Reponse).

% cas avec un vin dans la question
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID_Vin),
                      nom(ID_Vin, Nom_Vin),
                      set_vin_memo(ID_Vin, rien),
                      get_propriete_non_citee([Propriete]),
                      produire_reponse([Propriete|Nom_Vin], Reponse).

% cas où toutes les propriétés ont été citées
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin_memo(ID_Vin),
                      nom(ID_Vin, Nom_Vin),
                      get_propriete_non_citee([]),
                      reset_vin_memo(),
                      Reponse = [['vous savez tout au sujet du'|Nom_Vin]].

% cas où il n'y a pas de vin en mémoire
regle([davantage,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      pas_de_vin_memo(),
                      Reponse = [['je ne vois pas de quel vin vous parlez']].
