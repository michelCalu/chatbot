:- discontiguous nom/2.
:- discontiguous mclef/2.
:- discontiguous prix/2.
:- discontiguous bouche/2.
:- discontiguous nez/2.
:- discontiguous description/2.

nom(beaujolais_nouveau,[beaujolais,nouveau]).
nom(chiroubles,[chiroubles]).
nom(saint_amour,[saint,amour]).
nom(florilege_pauillac,[florilege,pauillac]).
nom(chateau_perrouquet_graves,[chateau,perrouquet,graves]).
nom(sauvignon_d_aquitaine,[sauvignon,d,aquitaine]).
nom(chablis,[chablis]).
nom(saint_romain,[saint,romain]).
nom(pouilly_vinzelles,[pouilly,vinzelles]).
nom(irancy,[irancy]).
nom(marsannay,[marsannay]).
nom(chambolle_mussigny,[chambolle,mussigny]).
nom(cheverny,[cheverny]).
nom(sancerre_blanc,[sancerre,blanc]).
nom(sancerre_rouge,[sancerre,rouge]).
nom(condrieu,[condrieu]).
nom(laudun,[laudun]).
nom(ventoux,[ventoux]).
nom(lirac,[lirac]).
nom(hermitage,[hermitage]).

region(beaujolais_nouveau,beaujolais).
region(chiroubles,beaujolais).
region(saint_amour,beaujolais).
region(florilege_pauillac,bordeaux).
region(chateau_perrouquet_graves,bordeaux).
region(sauvignon_d_aquitaine,bordeaux).
region(chablis,bourgogne).
region(saint_romain,bourgogne).
region(pouilly_vinzelles,bourgogne).
region(irancy,bourgogne).
region(marsannay,bourgogne).
region(chambolle_mussigny,bourgogne).
region(cheverny,loire).
region(sancerre_blanc,loire).
region(sancerre_rouge,loire).
region(condrieu,rhone).
region(laudun,rhone).
region(ventoux,rhone).
region(lirac,rhone).
region(hermitage,rhone).

annee(beaujolais_nouveau,2013).
annee(chiroubles,2013).
annee(saint_amour,2014).
annee(florilege_pauillac,2011).
annee(chateau_perrouquet_graves,2014).
annee(sauvignon_d_aquitaine,2015).
annee(chablis,2014).
annee(saint_romain,2015).
annee(pouilly_vinzelles,2013).
annee(irancy,2012).
annee(marsannay,2011).
annee(chambolle_mussigny,2012).
annee(cheverny,2016).
annee(sancerre_blanc,2015).
annee(sancerre_rouge,2015).
annee(condrieu,2015).
annee(laudun,2016).
annee(ventoux,2015).
annee(lirac,2015).
annee(hermitage,2009).

couleur(beaujolais_nouveau,rouge).
couleur(chiroubles,rouge).
couleur(saint_amour,rouge).
couleur(florilege_pauillac,rouge).
couleur(chateau_perrouquet_graves,rouge).
couleur(sauvignon_d_aquitaine,blanc).
couleur(chablis,blanc).
couleur(saint_romain,blanc).
couleur(pouilly_vinzelles,blanc).
couleur(irancy,rouge).
couleur(marsannay,rouge).
couleur(chambolle_mussigny,rouge).
couleur(cheverny,blanc).
couleur(sancerre_blanc,blanc).
couleur(sancerre_rouge,rouge).
couleur(condrieu,blanc).
couleur(laudun,blanc).
couleur(ventoux,rouge).
couleur(lirac,rouge).
couleur(hermitage,rouge).

prix(beaujolais_nouveau,6.75).
prix(chiroubles,8.41).
prix(saint_amour,11.43).
prix(florilege_pauillac,30.65).
prix(chateau_perrouquet_graves,9.22).
prix(sauvignon_d_aquitaine,5.54).
prix(chablis,15.95).
prix(saint_romain,22.6).
prix(pouilly_vinzelles,17.4).
prix(irancy,13.98).
prix(marsannay,14.63).
prix(chambolle_mussigny,63.85).
prix(cheverny,9.05).
prix(sancerre_blanc,16.01).
prix(sancerre_rouge,15.13).
prix(condrieu,32.07).
prix(laudun,8.83).
prix(ventoux,5.69).
prix(lirac,9.23).
prix(hermitage,34.74).

origine(beaujolais_nouveau,[['terroir granitique, qui convient particulierement'],['bien au cepage gamay. ce vin est issu d une vinification'],['traditionn- elle et s est nourri de ses lies durant plusieurs mois.']]).
origine(chiroubles,[['terroir granitique et schisteux d origine volcanique.'],['c est dans cette region que ce cepage donne le meilleur'],['de lui-meme.']]).
origine(saint_amour,[['cru repute du beaujolais, partie nord. sol granitique'],['et schisteux d origine volcanique. presence calcaire'],['a saint-amour.']]).
origine(florilege_pauillac,[['"pauillac, terroir ayant un amoncellement plus'],['important que les autres communes du medoc de graves garonnaises.'],['un cru digne de figurer dans notre famille ""florilege""."']]).
origine(chateau_perrouquet_graves,[['au sud de la region des graves sur un terroir de graves'],['garonnaises, sol de predilection du cabernet sauvignon.']]).
origine(sauvignon_d_aquitaine,[['region de cadillac. rive droite des coteaux qui bordent'],['la garonne, en face de cerons. le vignoble est situe'],['a 100 m d altitude et complante entierement du cepage'],['sauvignon.']]).
origine(chablis,[['bourgogne septentrionale. sols de nature argilo-calcaire.'],['presence de nombreux fossiles d origine marine. vignoble'],['plante en coteaux bien exposes.']]).
origine(saint_romain,[['au coeur de la cote-de-beaune, a l ouest d auxey-duresses'],['et de meursault. ce vignoble d altitude (entre 300 et'],['400 m) convient particulierement a la culture du chardonnay'],['a l origine de vins blancs a forte personnalite, sur'],['le fruit et la mineralite']]).
origine(pouilly_vinzelles,[['grand bourgogne blanc du maconnais. petite aoc de'],['50 ha, voisine de pouilly-fuisse (+ de 700 ha). collines'],['calcaires, riches en sols alcalins.']]).
origine(irancy,[['bourgogne originaire du chablisien. marnes et calcaires'],['du jurassique superieur (compris entre -146 et -138'],['millions d annees).']]).
origine(marsannay,[['appellation situee au nord de la cote de nuits. plus'],['connue pour sa production de vins roses, elle produit egalement'],['d excellents vins rouges dans les bonnes annees.']]).
origine(chambolle_mussigny,[['"la parcelle ""les noirots"" est une toute petite'],['parcelle situee au sud du celebre grand cru de bonnes mares."']]).
origine(cheverny,[['vignoble entourant le celebre chateau de cheverny,'],['aux environs de blois. terroir de sables sur argiles'],['a silex.']]).
origine(sancerre_blanc,[['val de loire, centre de la france. tres belle exposition.'],['vignoble de verdigny reposant sur des terres argilo-calcaires.']]).
origine(sancerre_rouge,[['tres belle exposition. vignoble de verdigny reposant'],['sur des terres argilo-calcaires.']]).
origine(condrieu,[['parmi les plus grands vins blancs de france. les sols'],['en fortes pentes entre cote-rotie et saint-joseph'],['imposent un travail non mecanise de la vigne. cette cuvee est'],['issue d une petite propriete de 1,8 ha a l exposition parfaite'],['et au terroir sablo-argileux tres friable sur sous-sol'],['fissure a dominante calcaire.']]).
origine(laudun,[['rhone meridional, non loin de chateauneuf-du-pape'],['sur la rive opposee du rhone. terroir en coteaux formes'],['de sables et d eboulis calcaires meles a de l argile.'],['ces terroirs riches en calcaires sont a l origine de blancs'],['puissants et genereux qui beneficient d une excellente reputation.']]).
origine(ventoux,[['vallee du rhone, au pied du celebre mont ventoux.'],['terrasse caillouteuse sur sous-sol de sables marins.']]).
origine(lirac,[['vignoble caillouteux situe sur la rive ouest du rhone,'],['face a chateauneuf-du-pape, a l origine de vins riches'],['et genereux. terroir fin, elegant (cailloutis calcaires'],['et galets roules). aoc cru du rhone depuis 1998.']]).
origine(hermitage,[['terroir d exception en forte pente au sous-sol granitique'],['et au sol de granite decompose.']]).

cepage(beaujolais_nouveau,[['gamay 100%']]).
cepage(chiroubles,[['gamay noir a jus blanc a 100 %.']]).
cepage(saint_amour,[['gamay noir a jus blanc. c est ici qu il donne le meilleur'],['de lui-meme.']]).
cepage(florilege_pauillac,[['cabernet sauvignon majoritairement. merlot et'],['petit verdot. sols pauvres avec enracinnement profond'],['des racines.']]).
cepage(chateau_perrouquet_graves,[['80% merlot, 20% cabernet sauvignon.']]).
cepage(sauvignon_d_aquitaine,[['sauvignon pur.']]).
cepage(chablis,[['"chardonnay (nomme sur place le ""beaunois"")."']]).
cepage(saint_romain,[['100% chardonnay.']]).
cepage(pouilly_vinzelles,[['100 % chardonnay, sur un terroir qui lui convient'],['particulierement.']]).
cepage(irancy,[['pinot noir 98% + 2% cesar (cepage local ancien).']]).
cepage(marsannay,[['pinot noir.']]).
cepage(chambolle_mussigny,[['pinot noir.']]).
cepage(cheverny,[['75% sauvignon et 25% chardonnay']]).
cepage(sancerre_blanc,[['"sauvignon blanc (nomme sur place ""le breton"")."']]).
cepage(sancerre_rouge,[['pinot noir 100%.']]).
cepage(condrieu,[['on produit exclusivement des vins blancs sur condrieu.'],['a partir d un cepage unique: le viognier']]).
cepage(laudun,[['viognier 40%, grenache 50%, roussanne 10%.']]).
cepage(ventoux,[['majoritairement grenache. syrah 5%.']]).
cepage(lirac,[['grenache 50 %, syrah 20%, mourvedre 20% et cinsault'],['10%.']]).
cepage(hermitage,[['syrah pure. conditions culturale difficile (forte'],['pente). rendement inferieur a 20 hl/ha.']]).

elevage(beaujolais_nouveau,[['6 mois en barriques, sur lies.']]).
elevage(chiroubles,[['elevage de 6 mois en barriques de chene. bouchage'],['liege naturel.']]).
elevage(saint_amour,[['un elevage de 12 mois en barrique de 2 vins a permis'],['a ce cru de developper toute sa complexite.']]).
elevage(florilege_pauillac,[['19 mois en barriques (1/3 neuf - 2/3 de 3 ans)']]).
elevage(chablis,[['elevage de 6 mois en barrique de chene.']]).
elevage(pouilly_vinzelles,[['elevage de 6 mois en barrique d un an.']]).
elevage(irancy,[['elevage de 12 mois en futs de chene.']]).
elevage(marsannay,[['14 mois en pieces bourguignonne de 228l. bouchage'],['liege naturel.']]).
elevage(chambolle_mussigny,[['16 mois en piece bourguignonne de 228l.']]).
elevage(cheverny,[['6 mois sur lies.']]).
elevage(sancerre_blanc,[['elevage de 4 mois pour permettre au vin de se nourrir'],['de ses lies.']]).
elevage(sancerre_rouge,[['6 mois en barriques.']]).
elevage(condrieu,[['elevage de 10 mois, sur lies.']]).
elevage(laudun,[['4 mois sur lies.']]).
elevage(lirac,[['18 mois en barriques de chene.']]).
elevage(hermitage,[['elevage de 13 mois en barrique d un an. clarification'],['par sedimentation naturelle.']]).

description(beaujolais_nouveau,[['jolie robe rouge profond. nez gourmand, aux aromes'],['dominants de fruits rouges (cerises, framboises, fraises)'],['et de pates de fruits (cuberdon). l attaque est souple'],['et juteuse, la suite dense, racee et genereuse. l ensemble'],['est intensement parfume, frais et gouleyant. tout simplement'],['delicieux!']]).
description(chiroubles,[['nez tendrement parfume, domine par les fruits rouges'],['(groseilles, fraises) et les epices. cette sensation fruitee'],['se poursuit en bouche avec une nuance florale et minerale.'],['beau souvenir d un vin tendre et expressif, au fruite harmonieux.']]).
description(saint_amour,[['on ne peut resister au charme de ce cru du beaujolais'],['! les aromes de fruits rouges juteux et d epices (reglisse,'],['muscade) se melent. l ensemble est gourmand, alliant merveilleusement'],['fruit, rondeur et fraicheur. la finale veloutee et cremeuse'],['est d une grande finesse. laisse le delicieux souvenir'],['d un vin tendre et genereux. superbe!']]).
description(florilege_pauillac,[['robe velours. le nez est concentre, sur les fruits'],['noirs, avec une touche bois de vigne et une note reglisse.'],['inevitablement, la bouche est puissante, mais les tannins sont elegants'],['et bien enrobes. laisse le souvenir d un cru d une grande'],['profondeur, a la fois structure et aimable, d une remarquable'],['distinction. le compagnon ideal des preparations de gibier.']]).
description(chateau_perrouquet_graves,[['nez bouquete, aux aromes deja tres expressifs et'],['bien epanouis. ce cru est fidele a lui meme en 2014, avec'],['du fond, du gras, et une tres belle palette aromatique.'],['garde normale.']]).
description(sauvignon_d_aquitaine,[['belle robe pale aux reflets verts. des la mise au nez,'],['on est seduit par l intensite aromatique de ce sauvignon.'],['les aromes de cassis se melent a des nuances exotiques'],['(ananas) et d agrumes murs. les saveurs composent en equilibre'],['entre rondeur et fraicheur. la finale est savoureuse,'],['pleine de charme. voici un excellent sauvignon a la fois'],['frais (mais sans exces) et aromatique. plus que jamais'],['un vin plaisir a decouvrir ou re-decouvrir !']]).
description(chablis,[['nez type, frais, alliant le fruit a une note citronnee,'],['et une touche minerale (iode). ces sensations se prolongent'],['en bouche. l ensemble est mineral, net et race. la finale,'],['avec du relief, laisse un excellent souvenir. bon equilibre'],['corps-fraicheur. un grand classique, tres polyvalent.']]).
description(saint_romain,[['on est seduit par l intensite aromatique ou les aromes'],['de fruits du verger et de citron s associent a des nuances'],['beurrees et d amande delicatement torrefiee. belle intensite'],['et tension en bouche, alliant complexite et elegance.'],['finale de grande unite, laissant un excellent souvenir.'],['voici un magnifique cru de cote-de-beaune avec beaucoup'],['de personnalite et d elegance. a decouvrir ou re-decouvrir!']]).
description(pouilly_vinzelles,[['un superbe cru blanc ! nez delicat et complexe, aux'],['aromes de fruits du verger (pomme, poire) associes a des'],['nuances de miel et d amande. la bouche est savoureuse, volumineuse,'],['bien ronde. la finale est genereuse et le souvenir tellement'],['charmeur. un cru d un remarquable equilibre, de grande classe!']]).
description(irancy,[['belle robe brillante. le nez est profond, bien mut,'],['melant les aromes de griotte, de fraise des bois et de tabac.'],['des l attaque, on apprecie le volume, et la maturite du'],['fruit. la typicite pinot ressort tres bien sur la finale.'],['a (re)decouvrir !!']]).
description(marsannay,[['nord de la cote de nuits, au-dessus de gevrey chambertin.'],['cette cuvee est bien dans l esprit du terroir : un vin type'],['pinot, delicat, plein de charme, tout en velours. tres belle'],['finale harmonieuse, fondue.']]).
description(chambolle_mussigny,[['nez complexe, intense de fruits rouges, d epices'],['(notes de poivre) meles a des nuances empyreumatiques et'],['de sous-bois. cette complexite se poursuit en bouche,'],['avec des saveurs denses, concentrees et enrobees. grand'],['vin opulent, puissant, race et long !']]).
description(cheverny,[['magnifique aoc du centre de la loire, entre tours'],['et orleans. nez intensement parfume, typiquement'],['sauvignon ou les aromes de buis et de cassis se melent a des notes'],['d eglantier. la bouche est tonique, minerale.']]).
description(sancerre_blanc,[['toute l expression du cepage sauvignon sur le terroir'],['calcaire du vignoble de verdigny. superbe nez race aux aromes'],['de fruits murs, de cassis, d eglantier, de buis. belle'],['expression en bouche, mariant mineralite et fruit, avec une'],['belle fraicheur. un grand classique.']]).
description(sancerre_rouge,[['"nez aromatique et friand qui ""pinote"" (cerise'],['rouge du nord, fruits des bois, sous-bois, champignons).'],['la bouche est delicieuse, charmeuse, deployant ses'],['notes de fruits et d epices (notes de poivre) avec fraicheur'],['et elegance. le vin est rond, ample, souple, et soyeux.'],['la finale tres harmonieuse temoigne de la maturite'],['de ce cru."']]).
description(condrieu,[['belle intensite aromatique a la fois riche et complexe,'],['avec des aromes d abricots, de peche, et une intensite'],['epicee remarquable. la bouche allie volume et equilibre.'],['voici un tres grand vin des cotes du rhone. on apprecie la'],['race, la mineralite et l onctuosite. grande longueur.'],['superbe.']]).
description(laudun,[['rhone meridional, non loin de chateauneuf-du-pape'],['sur la rive opposee du rhone. magnifique nez intense'],['de fruits du verger (peche, mirabelle) associes a des'],['nuances d epices et une note citronnee. cette intensite aromatique'],['se prolonge en bouche avec des saveurs a la fois denses,'],['racees et complexes. la finale alluree, laisse le souvenir'],['d un vin important aux saveurs persistantes. une magnifique'],['decouverte !']]).
description(ventoux,[['belle robe rouge grenat. nez intense et expressif'],['de fruits rouges (a noyaux) et d epices (aiguilles de'],['pin, reglisse, etc). en bouche, les saveurs sont fruitees,'],['epicees et florales. l ensemble se montre souple et juteux.'],['un cotes du ventoux plein de charme, gourmand, et frais.']]).
description(lirac,[['la robe noire annonce la couleur: bouquet intense'],['de fruits noirs (noyaux) et d epices associe a des notes'],['de chocolat et de garrigue. la bouche devoile d abord'],['des saveurs de fruits frais et d epices. elle est remarquablement'],['concentree. finale cacao, a la fois dense, puissante, juteuse'],['et harmonieuse.']]).
description(hermitage,[['terroir d exception. nez empyreumatique, associant'],['fruits noirs surmuris et agrumes a des notes de tabac et de'],['reglisse. la bouche est racee et concentree, alliant matiere'],['et fraicheur. les saveurs sont a la fois fruitees, epicees'],['et florales. l ensemble est puissant, long et elegant.'],['grand vin.']]).

consommation(beaujolais_nouveau,2016).
consommation(chiroubles,2019).
consommation(saint_amour,2020).
consommation(florilege_pauillac,2024).
consommation(chateau_perrouquet_graves,2019).
consommation(sauvignon_d_aquitaine,2018).
consommation(chablis,2017).
consommation(saint_romain,2022).
consommation(pouilly_vinzelles,2018).
consommation(irancy,2018).
consommation(marsannay,2019).
consommation(chambolle_mussigny,2027).
consommation(cheverny,2020).
consommation(sancerre_blanc,2020).
consommation(sancerre_rouge,2020).
consommation(condrieu,2025).
consommation(laudun,2020).
consommation(ventoux,2018).
consommation(lirac,2022).
consommation(hermitage,2022).

temperature(beaujolais_nouveau,15).
temperature(chiroubles,15).
temperature(saint_amour,15).
temperature(florilege_pauillac,17).
temperature(chateau_perrouquet_graves,15).
temperature(sauvignon_d_aquitaine,9).
temperature(chablis,10).
temperature(saint_romain,12).
temperature(pouilly_vinzelles,9).
temperature(irancy,16).
temperature(marsannay,17).
temperature(chambolle_mussigny,17).
temperature(cheverny,8).
temperature(sancerre_blanc,8).
temperature(sancerre_rouge,13).
temperature(condrieu,10).
temperature(laudun,11).
temperature(ventoux,15).
temperature(lirac,15).
temperature(hermitage,17).

accompagnement(beaujolais_nouveau,'tomate mozzarella').
accompagnement(beaujolais_nouveau,charcuterie).
accompagnement(beaujolais_nouveau,camembert).
accompagnement(beaujolais_nouveau,brie).
accompagnement(beaujolais_nouveau,omelette).
accompagnement(beaujolais_nouveau,'chicon au gratin').
accompagnement(beaujolais_nouveau,barbecue).
accompagnement(chiroubles,charcuterie).
accompagnement(chiroubles,volaille).
accompagnement(chiroubles,waterzooi).
accompagnement(chiroubles,'blanquette de veau').
accompagnement(chiroubles,'fondue savoyarde').
accompagnement(chiroubles,pizza).
accompagnement(chiroubles,asperge).
accompagnement(chiroubles,salade).
accompagnement(saint_amour,'tarte salee').
accompagnement(saint_amour,charcuterie).
accompagnement(saint_amour,'viande blanche').
accompagnement(saint_amour,'fondue savoyarde').
accompagnement(saint_amour,'plat asiatique').
accompagnement(saint_amour,'viande parfumee').
accompagnement(chateau_perrouquet_graves,'tarte salee').
accompagnement(chateau_perrouquet_graves,tapas).
accompagnement(chateau_perrouquet_graves,magret).
accompagnement(chateau_perrouquet_graves,'dinde farcie').
accompagnement(chateau_perrouquet_graves,'dinde rotie').
accompagnement(chateau_perrouquet_graves,'poulet roti').
accompagnement(chateau_perrouquet_graves,'viande rouge').
accompagnement(chateau_perrouquet_graves,'carre d agneau').
accompagnement(chateau_perrouquet_graves,steak).
accompagnement(chateau_perrouquet_graves,entrecote).
accompagnement(chateau_perrouquet_graves,rosbeef).
accompagnement(chateau_perrouquet_graves,veau).
accompagnement(chateau_perrouquet_graves,'ris de veau').
accompagnement(chateau_perrouquet_graves,porc).
accompagnement(sauvignon_d_aquitaine,crevette).
accompagnement(sauvignon_d_aquitaine,moule).
accompagnement(sauvignon_d_aquitaine,poisson).
accompagnement(sauvignon_d_aquitaine,truite).
accompagnement(sauvignon_d_aquitaine,sandre).
accompagnement(sauvignon_d_aquitaine,'fromage de chevre').
accompagnement(sauvignon_d_aquitaine,raclette).
accompagnement(sauvignon_d_aquitaine,choucroute).
accompagnement(sauvignon_d_aquitaine,aperitif).
accompagnement(saint_romain,'saint jacques').
accompagnement(saint_romain,'poissons poche').
accompagnement(saint_romain,'poissons vapeur').
accompagnement(saint_romain,'poisson papillotte').
accompagnement(saint_romain,cabillaud).
accompagnement(saint_romain,volaille).
accompagnement(saint_romain,poisson).
accompagnement(saint_romain,crustace).
accompagnement(pouilly_vinzelles,crustace).
accompagnement(pouilly_vinzelles,gambas).
accompagnement(pouilly_vinzelles,homard).
accompagnement(pouilly_vinzelles,langouste).
accompagnement(pouilly_vinzelles,'saint jacques').
accompagnement(pouilly_vinzelles,tourteau).
accompagnement(pouilly_vinzelles,poisson).
accompagnement(pouilly_vinzelles,'ris de veau').
accompagnement(pouilly_vinzelles,'tomate farcie').
accompagnement(marsannay,lotte).
accompagnement(marsannay,turbot).
accompagnement(marsannay,'poulet fermier').
accompagnement(marsannay,'viande blanche').
accompagnement(marsannay,gibier).
accompagnement(marsannay,crepes).
accompagnement(cheverny,coquillage).
accompagnement(cheverny,poisson).
accompagnement(sancerre_blanc,'entree froide').
accompagnement(sancerre_blanc,'saumon fume').
accompagnement(sancerre_blanc,'terrine de poissons').
accompagnement(sancerre_blanc,salade).
accompagnement(sancerre_blanc,'fruits de mer').
accompagnement(sancerre_blanc,gambas).
accompagnement(sancerre_blanc,huitres).
accompagnement(sancerre_blanc,saumon).
accompagnement(sancerre_blanc,'fromage frais').
accompagnement(sancerre_blanc,'fromage de chevre').
accompagnement(sancerre_blanc,salades).
accompagnement(sancerre_blanc,'tomate crevette').
accompagnement(condrieu,gambas).
accompagnement(condrieu,homard).
accompagnement(condrieu,langouste).
accompagnement(condrieu,'saint jacques').
accompagnement(condrieu,'poisson').
accompagnement(condrieu,thon).
accompagnement(condrieu,espadon).
accompagnement(condrieu,'poissons en sauce').
accompagnement(condrieu,volaille).
accompagnement(condrieu,'preparations italiennes').
accompagnement(condrieu,asperges).
accompagnement(laudun,'foie gras').
accompagnement(laudun,'melon jambon').
accompagnement(laudun,gambas).
accompagnement(laudun,poissons).
accompagnement(laudun,'poisson au four').
accompagnement(laudun,turbot).
accompagnement(laudun,volaille).
accompagnement(laudun,'ris de veau').
accompagnement(laudun,'preparations italiennes').
accompagnement(laudun,paella).
accompagnement(laudun,asperges).
accompagnement(laudun,aperitif).
accompagnement(hermitage,'viande rouges').
accompagnement(hermitage,tournedos).
accompagnement(hermitage,gibier).

nez(beaujolais_nouveau,[['nez gourmand, aux aromes dominants de fruits rouges'],['(cerises, framboises, fraises) et de pates de fruits (cuberdon)']]).
nez(chiroubles,[['nez tendrement parfume, domine par les fruits rouges'],['(groseilles, fraises) et les epices']]).
nez(saint_amour,[['les aromes de fruits rouges juteux et d epices (reglisse,'],['muscade) se melent']]).
nez(florilege_pauillac,[['le nez est concentre, sur les fruits noirs, avec une'],['touche bois de vigne et une note reglisse.']]).
nez(chateau_perrouquet_graves,[['nez bouquete, aux aromes deja tres expressifs et'],['bien epanouis.']]).
nez(sauvignon_d_aquitaine,[['des la mise au nez, on est seduit par l intensite aromatique'],['de ce sauvignon. les aromes de cassis se melent a des'],['nuances exotiques (ananas) et d agrumes murs.']]).
nez(chablis,[['nez type, frais, alliant le fruit a une note citronnee,'],['et une touche minerale (iode)']]).
nez(saint_romain,[['on est seduit par l intensite aromatique ou les aromes'],['de fruits du verger et de citron s associent a des nuances'],['beurrees et d amande delicatement torrefiee']]).
nez(pouilly_vinzelles,[['nez delicat et complexe, aux aromes de fruits du verger'],['(pomme, poire) associes a des nuances de miel et d amande']]).
nez(irancy,[['le nez est profond, bien mut, melant les aromes de'],['griotte, de fraise des bois et de tabac.']]).
nez(marsannay,[['un vin type pinot, delicat, plein de charme, tout'],['en velours']]).
nez(chambolle_mussigny,[['nez complexe, intense de fruits rouges, d epices'],['(notes de poivre) meles a des nuances empyreumatiques et'],['de sous-bois.']]).
nez(cheverny,[['nez intensement parfume, typiquement sauvignon'],['ou les aromes de buis et de cassis se melent a des notes'],['d eglantier']]).
nez(sancerre_blanc,[['superbe nez race aux aromes de fruits murs, de cassis,'],['d eglantier, de buis']]).
nez(sancerre_rouge,[['"nez aromatique et friand qui ""pinote"" (cerise'],['rouge du nord, fruits des bois, sous-bois, champignons)."']]).
nez(condrieu,[['belle intensite aromatique a la fois riche et complexe,'],['avec des aromes d abricots, de peche, et une intensite'],['epicee remarquable']]).
nez(laudun,[['magnifique nez intense de fruits du verger (peche,'],['mirabelle) associes a des nuances d epices et une note citronnee']]).
nez(ventoux,[['nez intense et expressif de fruits rouges (a noyaux)'],['et d epices (aiguilles de pin, reglisse, etc).']]).
nez(lirac,[['la robe noire annonce la couleur: bouquet intense'],['de fruits noirs (noyaux) et d epices associe a des notes'],['de chocolat et de garrigue']]).
nez(hermitage,[['nez empyreumatique, associant fruits noirs surmuris'],['et agrumes a des notes de tabac et de reglisse.']]).

bouche(beaujolais_nouveau,[['l attaque est souple et juteuse, la suite dense, racee'],['et genereuse.']]).
bouche(chiroubles,[['cette sensation fruitee se poursuit en bouche avec'],['une nuance florale et minerale.']]).
bouche(saint_amour,[['l ensemble est gourmand, alliant merveilleusement'],['fruit, rondeur et fraicheur.']]).
bouche(florilege_pauillac,[['inevitablement, la bouche est puissante, mais les'],['tannins sont elegants et bien enrobes.']]).
bouche(chateau_perrouquet_graves,[['ce cru est fidele a lui meme en 2014, avec du fond, du'],['gras, et une tres belle palette aromatique']]).
bouche(sauvignon_d_aquitaine,[['les saveurs composent en equilibre entre rondeur'],['et fraicheur. la finale est savoureuse, pleine de charme']]).
bouche(chablis,[['l ensemble est mineral, net et race']]).
bouche(saint_romain,[['belle intensite et tension en bouche, alliant complexite'],['et elegance.']]).
bouche(pouilly_vinzelles,[['la bouche est savoureuse, volumineuse, bien ronde']]).
bouche(irancy,[['des l attaque, on apprecie le volume, et la maturite'],['du fruit.']]).
bouche(marsannay,[['tres belle finale harmonieuse, fondue.']]).
bouche(chambolle_mussigny,[['cette complexite se poursuit en bouche, avec des'],['saveurs denses, concentrees et enrobees.']]).
bouche(cheverny,[['la bouche est tonique, minerale']]).
bouche(sancerre_blanc,[[' belle expression en bouche, mariant mineralite'],['et fruit, avec une belle fraicheur.']]).
bouche(sancerre_rouge,[['la bouche est delicieuse, charmeuse, deployant'],['ses notes de fruits et d epices (notes de poivre) avec'],['fraicheur et elegance.']]).
bouche(condrieu,[['la bouche allie volume et equilibre']]).
bouche(laudun,[['cette intensite aromatique se prolonge en bouche'],['avec des saveurs a la fois denses, racees et complexes.']]).
bouche(ventoux,[['en bouche, les saveurs sont fruitees, epicees et'],['florales.']]).
bouche(lirac,[['la bouche devoile d abord des saveurs de fruits frais'],['et d epices. elle est remarquablement concentree']]).
%bouche(hermitage,[]). supprimé ce prédicat intentionnellement pour tester l'apprentissage
