:- discontiguous nom/2.
:- discontiguous mclef/2.
:- discontiguous prix/2.
:- discontiguous bouche/2.
:- discontiguous nez/2.
:- discontiguous description/2.



/***********************************************/
% transformations fautes d'orthographe, typo, pluriel...
remplace(vins,vin).
remplace(vni,vin).
% TO DO
%************************************************/

% Mots-cle:
% 1 seul motclef(mot, poids) par mot à reconnaitre

mclef(bouche,10).
mclef(lattaque,10).
mclef(longueur,10).
mclef(bonjour,1).
mclef(fin,1).

nom(beaumes_de_venise_2015,[beaumes,de,venise]).


notfound(X,
         [ [ 'je n ai pas la reponse' ],
    [ 'a cette question' ]
  ]).


bouche(beaumes_de_venise_2015,
  [ [ 'blablabl  aaaiiiiiiaa' ],
    [ 'blablablaaaaa blablablaaaaa' ],
    [ 'blablablaaaaa.' ]
  ]).


nom(beaujolais_nouveau,[beaujolais,nouveau]).
nom(chiroubles,[chiroubles]).
nom(saint_amour,[saint,amour]).
nom(florilege_pauillac,[florilege,pauillac]).

region(beaujolais_nouveau,beaujolais).
region(chiroubles,beaujolais).
region(saint_amour,beaujolais).
region(florilege_pauillac,bordeaux).

annee(beaujolais_nouveau,2013).
annee(chiroubles,2013).
annee(saint_amour,2014).
annee(florilege_pauillac,2011).

couleur(beaujolais_nouveau,rouge).
couleur(chiroubles,rouge).
couleur(saint_amour,rouge).
couleur(florilege_pauillac,rouge).

prix(beaujolais_nouveau,6.75).
prix(chiroubles,8.41).
prix(saint_amour,11.43).
prix(florilege_pauillac,30.65).

origine(beaujolais_nouveau,[['terroir granitique, qui convient particulierement'],['bien au cepage gamay. ce vin est issu d une vinification'],['traditionn- elle et s est nourri de ses lies durant plusieurs mois.']]).
origine(chiroubles,[['terroir granitique et schisteux d origine volcanique.'],['c est dans cette region que ce cepage donne le meilleur'],['de lui-meme.']]).
origine(saint_amour,[['cru repute du beaujolais, partie nord. sol granitique'],['et schisteux d origine volcanique. presence calcaire'],['a saint-amour.']]).
origine(florilege_pauillac,[['"pauillac, terroir ayant un amoncellement plus'],['important que les autres communes du medoc de graves garonnaises.'],['un cru digne de figurer dans notre famille ""florilege""."']]).

cepage(beaujolais_nouveau,[['gamay 100%']]).
cepage(chiroubles,[['gamay noir a jus blanc a 100 %.']]).
cepage(saint_amour,[['gamay noir a jus blanc. c est ici qu il donne le meilleur'],['de lui-meme.']]).
cepage(florilege_pauillac,[['cabernet sauvignon majoritairement. merlot et'],['petit verdot. sols pauvres avec enracinnement profond'],['des racines.']]).

elevage(beaujolais_nouveau,[['6 mois en barriques, sur lies.']]).
elevage(chiroubles,[['elevage de 6 mois en barriques de chene. bouchage'],['liege naturel.']]).
elevage(saint_amour,[['un elevage de 12 mois en barrique de 2 vins a permis'],['a ce cru de developper toute sa complexite.']]).
elevage(florilege_pauillac,[['19 mois en barriques (1/3 neuf - 2/3 de 3 ans)']]).

description(beaujolais_nouveau,[['jolie robe rouge profond. nez gourmand, aux aromes'],['dominants de fruits rouges (cerises, framboises, fraises)'],['et de pates de fruits (cuberdon). l attaque est souple'],['et juteuse, la suite dense, racee et genereuse. l ensemble'],['est intensement parfume, frais et gouleyant. tout simplement'],['delicieux!']]).
description(chiroubles,[['nez tendrement parfume, domine par les fruits rouges'],['(groseilles, fraises) et les epices. cette sensation fruitee'],['se poursuit en bouche avec une nuance florale et minerale.'],['beau souvenir d un vin tendre et expressif, au fruite harmonieux.']]).
description(saint_amour,[['on ne peut resister au charme de ce cru du beaujolais'],['! les aromes de fruits rouges juteux et d epices (reglisse,'],['muscade) se melent. l ensemble est gourmand, alliant merveilleusement'],['fruit, rondeur et fraicheur. la finale veloutee et cremeuse'],['est d une grande finesse. laisse le delicieux souvenir'],['d un vin tendre et genereux. superbe!']]).
description(florilege_pauillac,[['robe velours. le nez est concentre, sur les fruits'],['noirs, avec une touche bois de vigne et une note reglisse.'],['inevitablement, la bouche est puissante, mais les tannins sont elegants'],['et bien enrobes. laisse le souvenir d un cru d une grande'],['profondeur, a la fois structure et aimable, d une remarquable'],['distinction. le compagnon ideal des preparations de gibier.']]).

consommation(beaujolais_nouveau,2016).
consommation(chiroubles,2019).
consommation(saint_amour,2020).
consommation(florilege_pauillac,2024).

temperature(beaujolais_nouveau,15).
temperature(chiroubles,15).
temperature(saint_amour,15).
temperature(florilege_pauillac,17).

accompagnement(beaujolais_nouveau,[['tomate mozzarella, charcuteries, croutes fleuries'],['(camembert, brie,...), omelette, chicons au gratin, barbecue.']]).
accompagnement(chiroubles,[['charcuteries, volaille a la creme, waterzooi de'],['poulet, blanquette de veau, fondue savoyarde, pizzas, asperges,'],['salades fraicheur, waterzooi']]).
accompagnement(saint_amour,[['tarte salee, charcuteries, viande blanche, fondue'],['savoyarde, plat asiatique viande parfume (coriandre, menthe),'],['plat asiatique viande sauce aigre-douce, assortiment'],['vapeur (dim sum).']]).

nez(beaujolais_nouveau,[['nez gourmand, aux aromes dominants de fruits rouges'],['(cerises, framboises, fraises) et de pates de fruits (cuberdon)']]).
nez(chiroubles,[['nez tendrement parfume, domine par les fruits rouges'],['(groseilles, fraises) et les epices']]).
nez(saint_amour,[['les aromes de fruits rouges juteux et d epices (reglisse,'],['muscade) se melent']]).
nez(florilege_pauillac,[['le nez est concentre, sur les fruits noirs, avec une'],['touche bois de vigne et une note reglisse.']]).

bouche(beaujolais_nouveau,[['l attaque est souple et juteuse, la suite dense, racee'],['et genereuse.']]).
bouche(chiroubles,[['cette sensation fruitee se poursuit en bouche avec'],['une nuance florale et minerale.']]).
bouche(saint_amour,[['l ensemble est gourmand, alliant merveilleusement'],['fruit, rondeur et fraicheur.']]).
bouche(florilege_pauillac,[['inevitablement, la bouche est puissante, mais les'],['tannins sont elegants et bien enrobes.']]).
