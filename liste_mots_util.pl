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

/***********************************************/
% transformations fautes d'orthographe, typo, pluriel...
remplace(vins,vin).
remplace(vni,vin).
% TO DO
%************************************************/

% Mots-cle:
% 1 seul motclef(mot, poids) par mot à reconnaitre
mclef(bonjour,1).


%bouche
mclef(bouche,10).
%mclef(attaque,10).
%mclef(longueur,10).

%nez
mclef(nez,10).
%mclef(aromes,10).
%mclef(bouquet,10).
%mclef(olfactives,10).

% questions région
%mclef(appellation,10).
mclef(region,9).
%mclef(provient,8).
%mclef(origine,7).

% question prix
mclef(prix,10).
%mclef(coute,10).
%mclef(acheter,10).

%description (motcle[#parler, #decrivez, #presentez, #dire])
%mclef(parler,10).
mclef(description,9). % pondération moindre, permet de gérer les cas parler moi du nez de ...
%mclef(presentez,10).
%mclef(dire,10).

%mclef(conseillez,10).
%mclef(avez,10).
%mclef(auriez,10).
%mclef(conseiller,10).

mclef(entre,10).

mclef(moins,10).
mclef(cher,9).
