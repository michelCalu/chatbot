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
