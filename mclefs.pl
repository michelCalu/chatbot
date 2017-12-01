/***********************************************/
% une seule règle 'motclef' par mot clef
%


mclef([bordeaux,5]).
mclef([rouge,3]).
mclef([promotion,1]).

/**********************************************/

%associe appellation à l'origine
origine([[madiran, vieilles, vignes, 2006],[bordeaux]]) .

% associe un identi􏰁ant de vin Id avec son appellation A ;
nom(1,[madiran,vieilles,vignes,2006]).

% donne le prix P du vin identi􏰁é par Id ;
prix(1,8.2).

% décrit dans T l'impression en bouche de Id
bouche(1,[]).

% décrit dans T le nez de Id
nez(1,[]).

% décrit dans T le nez de Id
description(1,[un,vin,riche,en,aromes]).
