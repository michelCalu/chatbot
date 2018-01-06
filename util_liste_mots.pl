/* --------------------------------------------------------------------- */
/*                                                                       */
/*                       UTILITAIRES MOTS-CLE                            */
/*                        ET LISTES DE MOTS                              */
/*                                                                       */
/* --------------------------------------------------------------------- */

/***********************************************/
% simplifie une liste de mots pour identifier les régles applicables
% format :
%        simplify(+List,-Result)
%        in : List est une liste de mot
%        out : Result est le résultat de l'application des régles de simplifaction
%              sur chaque élément de List, Result est également une liste de mots
%

simplify(List,Result) :- sr(List,Result,X,Y), !,
                         simplify(X,Y).
simplify([W|Words],[W|NewWords]) :- simplify(Words,NewWords).
simplify([],[]).

/***********************************************/
% règles de simplification
% format :
%         sr([Element|Reste],[ElementSimple|ResteSimple],Reste,ResteSimple)
%         in : Element est le mot à remplacer
%         out : ElementSimple est l'équivalent normalisé

sr([attaque|X],[bouche|Y],X,Y).
sr([longueur|X],[bouche|Y],X,Y).

sr([aromes|X],[nez|Y],X,Y).
sr([bouquet|X],[nez|Y],X,Y).
sr([olfactives|X],[nez|Y],X,Y).

sr([appellation|X],[region|Y],X,Y).
sr([origine|X],[region|Y],X,Y).
sr([provient|X],[region|Y],X,Y).

sr([conseillez|X],[region|Y],X,Y).
sr([avez|X],[region|Y],X,Y).
sr([auriez|X],[region|Y],X,Y).
sr([conseiller|X],[region|Y],X,Y).

sr([coute|X],[prix|Y],X,Y).
sr([acheter|X],[prix|Y],X,Y).

sr([decrivez|X],[description|Y],X,Y).
sr([parler|X],[description|Y],X,Y).
sr([presentez|X],[description|Y],X,Y).
sr([dire|X],[description|Y],X,Y).

sr([onereux|X],[cher|Y],X,Y).

sr([fourchette,de|X],[entre|Y],X,Y).

sr([met|X],[plat|Y],X,Y).
sr([mets|X],[plat|Y],X,Y).
sr([plats|X],[plat|Y],X,Y).
sr([preparation|X],[plat|Y],X,Y).
sr([preparations|X],[plat|Y],X,Y).

sr([aller|X],[accompagner|Y],X,Y).
sr([irait|X],[accompagner|Y],X,Y).
sr([cuisiner|X],[accompagner|Y],X,Y).
sr([accompagne|X],[accompagner|Y],X,Y).

sr([autres|X],[autre|Y],X,Y).
sr([dautre|X],[autre|Y],X,Y).
sr([dautres|X],[autre|Y],X,Y).

/***********************************************/
% Mots-clé avec pondérations
% format :
%         mclef(Mot, Poids)
%         nb : 1 seul motclef(mot, poids) par mot à reconnaitre

mclef(bonjour,2).
mclef(fin,2).
mclef(bouche,10).
mclef(nez,10).
mclef(region,4).
mclef(prix,7).
mclef(description,9).
mclef(entre,10).
mclef(moins,8).
mclef(plus,8).
mclef(cher,9).
mclef(plat,9).
mclef(accompagner,8).
mclef(autre,6).
mclef(davantage,5).

/***********************************************/
% identifie une sous liste dans une liste
% format : sublist(Sublist, List)
% source : Learn Prolog Now !, chap. 6

prefix(X, L) :- append(X, _, L).
suffix(X, L) :- append(_, X, L).
sublist(X, L) :- suffix(S, L), prefix(X, S).

/************************************************/
% vérifie que X est un nombre ou une liste dont le premier élément est un nombre
% format : is_number(ElementExaminé)

is_number(X):-
      is_list(X),
      nth0(0,X,ValueX),
      number(ValueX).
is_number(X):-
      number(X).
