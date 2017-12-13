/***********************************************/
% une seule règle 'motclef' par mot clef
%

mclef([bordeaux,5]).
mclef([rouge,3]).
mclef([promotion,1]).


remplace(vins,vin).
remplace(vni,vin).


regle([bordeaux,5],[
        	[1, [quel,bordeaux,conseillez,vous], 0, [je,vous,conseille,un,saint,emilion] ]
            [2, [quel,bordeaux,conseillez,vous], 0, [je,vous,conseille,un,saint,emilion] ],
            ]).
regle([rouge,5],[
        	[1, [quel,vin,rouge,avez,vous], 0, [je,vous,conseille,un,beaujolais] ]
            ]).
regle([promotion,5],[
        	[1, [quel,vin,est,en,promotion], 0, [au,revoir,!] ]
            ]).
regle([],[
            [1, [X], 0, [je,ne,peux,pas,repondre,a,cette,question] ]
            ]).


/********************************************************/
% structure de données d'un vin
%

vin([ nom([chateau,moulin,de,mallet]),[
      annee(2014),
      appellation(bordeaux),
      robe([grenat,aux,reflets,rubis]),
      prix(5.66),
      bouche([]),
      nez([parfume,de,fruits,rouges,cerise,mure]),
      description([un,vin,classique,polyvalent,bel,eventail,aromatique,et,tannins,fins])
      ]]).
/**********************************************************/


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
