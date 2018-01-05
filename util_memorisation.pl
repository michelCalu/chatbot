/* --------------------------------------------------------------------- */
/*                                                                       */
/*                      UTILITAIRES MEMORISATION                         */
/*                                                                       */
/* --------------------------------------------------------------------- */

/***************************************************************************/
% initialiste la variable globale liste_memo avec une liste et renvoie 3 éléments
% format :
%        set_liste_memo([A,B,C|Rest], [A,B,C])
%        in : [A,B,C|Rest] est une liste d'éléments (typiquement des identifiants
%             de vins)
%        out : [A,B,C] est une liste d'éléments
%        effect : la liste Rest est affecté à la variable gloable liste_memo

% cas ou Liste est de taille inférieur à 3
set_liste_memo(Liste, Liste) :-
  length(Liste, L),
  L =< 3,
  nb_setval(liste_memo, []).

% cas général
set_liste_memo([A,B,C|Rest], [A,B,C]) :-
  nb_setval(liste_memo, Rest).

/***************************************************************************/
% récupère les 3 premiers éléments de la liste en mémo et met à jour
% format :
%         get_three_elem_memo(Liste)
%         out : Liste est la liste des 3 premiers éléments de la liste dans la
%               variable globale liste_memo
%         effect : les trois premiers éléments de la liste contenue dans liste_memo
%                  sont supprimés

% cas où la taille de la liste en mémoire est inférieur à 3
get_three_elem_memo(Liste) :-
  nb_getval(liste_memo, Liste),
  length(Liste, L),
  L =< 3,
  nb_setval(liste_memo, []).

% cas général
get_three_elem_memo([A,B,C]) :-
  nb_getval(liste_memo, [A,B,C|Rest]),
  nb_setval(liste_memo, Rest).

/***************************************************************************/
% remet la variable globale liste_memo à zéro (liste vide)
reset_liste_memo() :-
  nb_setval(liste_memo, []).

/***************************************************************************/
% modifie la variable globale vin_memo en retirant la propriété donnée
% format :
%         set_vin_memo(ID_Vin, Propriete_Citee)
%         in : ID_vin est un identifiant de vin, Propriete_Citee est une propriété
%              de ce vin (représenté par une constante)
%         precondition : ID_Vin est égal à l'identifiant dans la variable globale
%                        vin_memo
%         effect : Propriete_Citee est supprimé (s'il y était) de la liste des
%                  propriétés dans la variable globale vin_memo

set_vin_memo(ID_Vin, Propriete_Citee) :-
  nb_getval(vin_memo, vin_prop(ID_Vin, Proprietes)),
  delete(Proprietes, Propriete_Citee, Proprietes_maj),
  nb_setval(vin_memo, vin_prop(ID_Vin, Proprietes_maj)).

/***************************************************************************/
% modifie la variable globale vin_memo en retirant la propriété donnée
% format :
%         set_vin_memo(ID_Vin, Propriete_Citee)
%         in : ID_vin est un identifiant de vin, Propriete_Citee est une propriété
%              de ce vin (représenté par une constante)
%         precondition : ID_Vin n'est pas égal à l'identifiant dans la variable
%                        globale vin_memo
%         effect : la variable globale vin_memo est mise à jour avec ID_Vin
%                  et la liste des propriétés [bouche,nez,region,prix,description]
%                  moins Propriete_Citee (s'il y était)

set_vin_memo(ID_Vin, Propriete_Citee) :-
  not(nb_getval(vin_memo, vin_prop(ID_Vin, _))),
  delete([bouche,nez,region,prix,description], Propriete_Citee, Proprietes),
  nb_setval(vin_memo, vin_prop(ID_Vin, Proprietes)).

/***************************************************************************/
% récupère une propriete non citée (ou une liste vide si plus rien) dans la
% variable globale vin_memo
get_propriete_non_citee([Propriete]) :-
  nb_getval(vin_memo, vin_prop(_, [Propriete|_])).

get_propriete_non_citee([]) :-
  nb_getval(vin_memo, vin_prop(_, [])).

/***************************************************************************/
% récupère l'ID du vin dans la variable globale vin_memo
get_vin_memo(ID_Vin) :-
  nb_getval(vin_memo, vin_prop(ID_Vin, _)).

/***************************************************************************/
% remet à zéro la variable globale vin_memo
reset_vin_memo() :-
  nb_setval(vin_memo, vin_prop(empty,[])).

/***************************************************************************/
% teste si il y un vin valide dans la variable globale vin_memo
pas_de_vin_memo() :-
  nb_getval(vin_memo, vin_prop(empty, _)).
