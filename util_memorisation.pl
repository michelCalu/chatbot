partie_liste(Liste, Newliste) :-
  length(Liste,Nb),
  calcule(Nb,Mi,Lg),
  choix(Liste,Mi,Lg,Newliste).

% 2 est le nombre d'items affichés simultanément
calcule(Nb,Mi,Lg) :-
   affichage(Lignes),
   nb_getval(depart,Mi),
   (Mi+Lignes-1)>=Nb,
   Lg is (Nb-Mi+1),
   nb_setval(depart,1).

calcule(Nb,Mi,Lg) :-
   affichage(Lignes),
   nb_getval(depart,Mi),
   (Mi+Lignes-1)<Nb,
   Lg is Lignes,
   X is (Mi+Lignes),
   nb_setval(depart,X).

% -------------------------------------------------------------------------
% Si memory est à 1, on mémorise la question dans old_question
% Si memory est à 0, on vient de la règle "autre", et on ne doit rien faire

memorise(Liste) :-
   nb_getval(memory,A),
   A>0,
   nb_setval(old_question,Liste).

memorise(_).

% reset_debut
% si mot clé autre, ou si on est appelé depuis la regle "autre", on ne fait rien.
% Sinon on reset le depart à 1
% pour stopper la mémorisation du point de début de l'affichage d'une liste.
%

reset_debut(Liste) :-
    member([autre,6],Liste),!,
    writeln(Pas_reset).

reset_debut(_) :-
    nb_getval(memory,X),
    X<1.

reset_debut(_) :-
    nb_setval(depart,1),
    writeln(reset).

% -------------------------------------------------------------------------
% modifie vin_cite en retirant la propriété citée
% ID_vin = identifiant vin
% Propriete = propriété citée (dans [bouche,nez,region,prix,description])
mod_vin_cite(ID_Vin, Propriete_Citee) :-
  nb_getval(vin_cite, vin_prop(ID_Vin, Proprietes)),
  delete(Proprietes, Propriete_Citee, Proprietes_maj),
  nb_setval(vin_cite, vin_prop(ID_Vin, Proprietes_maj)).

% modifie vin_cite en remettant la liste au départ et en retirant la propriété citée
mod_vin_cite(ID_Vin, Propriete_Citee) :-
  not(nb_getval(vin_cite, vin_prop(ID_Vin, _))),
  delete([bouche,nez,region,prix,description], Propriete_Citee, Proprietes),
  nb_setval(vin_cite, vin_prop(ID_Vin, Proprietes)).

% récupère une propriete non citée ou une liste vide si plus rien
get_propriete_non_citee([Propriete]) :-
  nb_getval(vin_cite, vin_prop(_, [Propriete|_])).

get_propriete_non_citee([]) :-
  nb_getval(vin_cite, vin_prop(_, [])).

% récupère l'ID du vin cité
get_vin_cite(ID_Vin) :-
  nb_getval(vin_cite, vin_prop(ID_Vin, _)).

% remet à zéro la variable globale vin_cite
reset_vin_cite() :-
  nb_setval(vin_cite, vin_prop(empty,[])).

% test si il y un vin cité valide
pas_de_vin_cite() :-
  nb_getval(vin_cite, vin_prop(empty, _)).
