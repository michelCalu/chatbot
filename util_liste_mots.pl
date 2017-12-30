% simplify(+List,-Result)
%   implements non-overlapping simplification
%   simplifies List into Result

simplify(List,Result) :- sr(List,Result,X,Y), !,
                         simplify(X,Y).
simplify([W|Words],[W|NewWords]) :- simplify(Words,NewWords).
simplify([],[]).

% simplification rules

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

/***********************************************/
% transformations fautes d'orthographe, typo, pluriel...
remplace(vins,vin).
remplace(vni,vin).
% TO DO
%************************************************/

% Mots-cle:
% 1 seul motclef(mot, poids) par mot à reconnaitre
mclef(bonjour,1).
mclef(fin,1).
mclef(bouche,10).
mclef(nez,10).
mclef(region,9).
mclef(prix,10).
mclef(description,9). % pondération moindre, permet de gérer les cas parler moi du nez de ...
mclef(entre,10).
mclef(moins,8).
mclef(plus,8).
mclef(cher,9).
mclef(plat,8).
mclef(accompagner,8).
mclef(autre,6).

%------------------------------------------------------------------------
%  Post : Resultat contient une sous liste de Liste
%  composée de Lg éléments d'index Base, Base+1...
%  Le premier élément est d'indice 1
%  Si Lg est trop grand, le dernier élément sera renvoyé plusieurs fois
%  Si base est trop grand, on prend le dernier élément
%  choix ([a,b,c,d,e],2,3) retourne b,c,d
%  ----------------------------------------------------------------------

choix(_,_,0,_).
choix(Liste,Base,Lg,Resultat) :-
    length(Liste,Lgliste),
    Mi is min(Base,Lgliste), %si base>longueur liste, on prend la longueur
    nth1(Mi,Liste,X),
    Newlg is Lg-1,
    Newmi is Mi+1,
    choix(Liste,Newmi,Newlg,Newresultat),
    append(Newresultat,[X],Resultat).

% identifie une sous liste dans une liste
prefix(X, L) :- append(X, _, L).
suffix(X, L) :- append(_, X, L).
sublist(X, L) :- suffix(S, L), prefix(X, S).

/***************************************************************************/
% is_number(X)
%     return true if X is an integer, or a list of 1 integer, else false.
%
is_number(X):-
      is_list(X),
      nth0(0,X,ValueX),
      number(ValueX).
is_number(X):-
      number(X).
