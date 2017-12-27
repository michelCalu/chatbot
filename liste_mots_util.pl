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
mclef(attaque,10).
mclef(longueur,10).

%nez
mclef(nez,10).
mclef(aromes,10).
mclef(bouquet,10).
mclef(olfactives,10).

% questions région
mclef(appellation,10).
mclef(region,9).
mclef(provient,8).
mclef(origine,7).

% question prix
mclef(prix,10).
mclef(coute,10).
mclef(acheter,10).

%description (motcle[#parler, #decrivez, #presentez, #dire])
mclef(parler,10).
mclef(decrivez,10).
mclef(presentez,10).
mclef(dire,10).

mclef(conseillez,10).
mclef(avez,10).
mclef(auriez,10).
mclef(conseiller,10).

mclef(entre,10).

mclef(moins,10).
mclef(cher,9).
