% -------------------------------------------------------------------------
% init liste_memo avec Liste moins les 3 premiers éléments qui sont renvoyer
set_liste_memo(Liste, Liste) :-
  length(Liste, L),
  L =< 3,
  nb_setval(liste_memo, []).

set_liste_memo([A,B,C|Rest], [A,B,C]) :-
  nb_setval(liste_memo, Rest).

% récupère les 3 premiers éléments de la liste en mémo et met à jour
get_three_elem_memo(Liste) :-
  nb_getval(liste_memo, Liste),
  length(Liste, L),
  L =< 3,
  nb_setval(liste_memo, []).

get_three_elem_memo([A,B,C]) :-
  nb_getval(liste_memo, [A,B,C|Rest]),
  nb_setval(liste_memo, Rest).

% -------------------------------------------------------------------------
% modifie vin_memo en retirant la propriété citée
% ID_vin = identifiant vin
% Propriete = propriété citée (dans [bouche,nez,region,prix,description])
set_vin_memo(ID_Vin, Propriete_Citee) :-
  nb_getval(vin_memo, vin_prop(ID_Vin, Proprietes)),
  delete(Proprietes, Propriete_Citee, Proprietes_maj),
  nb_setval(vin_memo, vin_prop(ID_Vin, Proprietes_maj)).

% modifie vin_memo en remettant la liste au départ et en retirant la propriété citée
set_vin_memo(ID_Vin, Propriete_Citee) :-
  not(nb_getval(vin_memo, vin_prop(ID_Vin, _))),
  delete([bouche,nez,region,prix,description], Propriete_Citee, Proprietes),
  nb_setval(vin_memo, vin_prop(ID_Vin, Proprietes)).

% récupère une propriete non citée ou une liste vide si plus rien
get_propriete_non_citee([Propriete]) :-
  nb_getval(vin_memo, vin_prop(_, [Propriete|_])).

get_propriete_non_citee([]) :-
  nb_getval(vin_memo, vin_prop(_, [])).

% récupère l'ID du vin cité
get_vin_memo(ID_Vin) :-
  nb_getval(vin_memo, vin_prop(ID_Vin, _)).

% remet à zéro la variable globale vin_memo
reset_vin_memo() :-
  nb_setval(vin_memo, vin_prop(empty,[])).

% test si il y un vin cité valide
pas_de_vin_memo() :-
  nb_getval(vin_memo, vin_prop(empty, _)).
