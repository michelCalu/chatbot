:- discontiguous nom/2.
:- discontiguous mclef/2.
:- discontiguous prix/2.
:- discontiguous bouche/2.
:- discontiguous nez/2.
:- discontiguous description/2.

/***********************************************/
% une seule règle 'motclef' par mot clef
%
%
mclef([bordeaux,5]).
mclef([rouge,3]).
mclef([promotion,1]).


remplace(vins,vin).
remplace(vni,vin).


regle([bordeaux,5],[
        	[1, [quel,bordeaux,conseillez,vous], 0, [je,vous,conseille,un,saint,emilion] ],
            [2, [quel,bordeaux,conseillez,vous], 0, [je,vous,conseille,un,saint,emilion] ]
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

/**********************************************************************/
% Exemples M. jaquet (13 dec.)
%
% Mots-cle:
nom(beaumes_de_venise_2015,'Beaumes-de-Venise 2015').
nom(les_chaboeufs_2013,'Nuits-Saint-Georges 1er Cru 2013, Les Chaboeufs').

prix(beaumes_de_venise_2015, 12.34).
prix(les_chaboeufs_2013, 42.35).

bouche(beaumes_de_venise_2015,
  [ [ 'les aromes de fraise, de violette cotoient les nuances' ],
    [ 'de baies de genevrier, de sureau et une delicate touche' ],
    [ 'de fleur d\'oranger. Cette intensite se poursuit en' ],
    [ 'bouche avec des saveurs juteuses, racees et tres elegantes', '.' ]
  ]).
nez(beaumes_de_venise_2015,
    [ [ nez, intensement, parfume, '.' ]
]).
description(beaumes_de_venise_2015,
    [ [ 'vignoble situe au sud-est des Dentelles de Montmirail', '.' ],
      [ 'grand vin', '.' ]
]).

mclef(bouche,10).
mclef(nez,10).
mclef(prix,10).
mclef(vin,5).
mclef(vins,5).

% ----------------------------------------------------------------%
% Règles de réproduire_reponse
%
%
regle_rep(bouche,1,
  [ que, donne, le, Vin, en, bouche ],
  Rep ) :-

     bouche(Vin,Rep).

% ----------------------------------------------------------------%
% Règles de réproduire_reponse
%
% 
regle_rep(vins,2,
  [ auriezvous, des, vins, entre, X, et, Y, eur ],
  Rep) :-
        lvins_prix_min_max(X,Y,Lvins),
        rep_lvins_min_max(Lvins,Rep).

lvins_prix_min_max(Min,Max,Lvins) :-
      findall( (Vin,P) , prix_vin_min_max(Vin,P,Min,Max), Lvins ).

prix_vin_min_max(Vin,P,Min,Max) :-
      prix(Vin,P),
      Min =< P, P =< Max.

rep_lvins_min_max([], [[ non, '.' ]]).
rep_lvins_min_max([H|T], [ [ oui, '.', je, dispose, de ] | L]) :-
   rep_litems_vin_min_max([H|T],L).

rep_litems_vin_min_max([],[]) :- !.
rep_litems_vin_min_max([(V,P)|L], [Irep|Ll]) :-
   nom(V,Appellation),
   Irep = [ '- ', Appellation, '(', P, ' EUR )' ],
   rep_litems_vin_min_max(L,Ll).
