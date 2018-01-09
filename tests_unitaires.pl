/* --------------------------------------------------------------------- */
/*                                                                       */
/*                           TESTS UNITAIRES                             */
/*                                                                       */
/* --------------------------------------------------------------------- */

:- [grandgousier].
:- discontiguous question_invalide/1.
:- discontiguous question_valide/1.

/***********************************************/
% lancement des tests unitaires
%

test_programme :-
      nl,write('TESTS questions valides, liste erreurs :'),
      findall(Question, question_valide_erreur(Question),_),
      nl,write('TESTS questions invalides, liste erreurs :'),
      findall(Question, question_invalide_erreur(Question),_).

/***********************************************/
% vérification des questions valides et invalides
% format :
%   question_valide_erreur(Q) : est vrai si une question valide génère une erreur
%   question_invalide_erreur(Q) : est vrai si une question invalide ne génère pas
%      d'erreur
%   in : in : Q est une question sous forme d'une liste de mots
%

question_valide_erreur(Q) :-
      nb_setval(vin_memo, vin_prop(empty,[])),
      nb_setval(liste_memo, []),
      question_valide(Q),
      produire_reponse(Q, Reponse),
      reponse_invalide(Reponse),
      nl,write(Q),write(' --> '),write(Reponse).

question_invalide_erreur(Q) :-
      nb_setval(vin_memo, vin_prop(empty,[])),
      nb_setval(liste_memo, []),
      question_invalide(Q),
      produire_reponse(Q, Reponse),
      not(reponse_invalide(Reponse)),
      nl,write(Q),write(' --> '),write(Reponse).

/***********************************************/
% ensemble des réponses signalant une erreur dans la question
% format :
%   reponse_invalide(R)
%   in : R est une réponse sous forme d'une liste de mots
%

reponse_invalide(R) :- notfound(_,R).
reponse_invalide([['pas de vin correspondant pour bouche']]).
reponse_invalide([['pas de vin correspondant pour nez']]).
reponse_invalide([['pas de vin ou de region correspondant']]).
reponse_invalide([['pas de vin correspondant pour prix']]).
reponse_invalide([['pas de vin correspondant pour description']]).
reponse_invalide([['je suis confus, je ne trouve pas de vin correspondant']]).
reponse_invalide([['le prix minimum n est pas un nombre']]).
reponse_invalide([['le prix maximum n est pas un nombre']]).
reponse_invalide([['le prix donne n est pas un nombre']]).
reponse_invalide([['je suis confus, je ne trouve pas de vin correspondant']]).
reponse_invalide([['je suis confus, je ne trouve pas de plat correspondant']]).
reponse_invalide([['je ne vois pas de quel vin vous parlez']]).
reponse_invalide([[ non, '.' ]]).

/***********************************************/
% ensemble des questions valides et invalides
% format :
%   question_valide(Q) : Q est une question ne levant pas de message d'erreur
%   question_invalide(Q) : Q est une question levant un message d'erreur
%   in : Q est une question sous forme d'une liste de mots
%

% questions hors sujet
question_invalide([ceci,est,une,question,hors,sujet]).

% questions règle vin->bouche
question_valide([comment,est,le,chiroubles,en,bouche]).
question_valide([comment,est,l,attaque,du,chiroubles]).
question_valide([parlez,moi,de,la,longueur,du,chiroubles ]).

question_invalide([que,donne,le,tttt,en,bouche]).

% questions règle vin->nez
question_valide([quel,nez,presente,le,chiroubles]).
question_valide([quels,sont,les,aromes,du,chiroubles]).
question_valide([quel,est,le,bouquet,du,chiroubles]).
question_valide([quelles,sont,les,proprietes,olfactives,du,chiroubles]).

question_invalide([quel,nez,presente,le,tttt]).

% questions règle vin->région
question_valide([quelle,est,l,appellation,du,chiroubles]).
question_valide([de,quelle,region,provient,le,chiroubles]).
question_valide([d,ou,provient,le,chiroubles]).
question_valide([de,quelle,origine,est,le,chiroubles ]).

question_invalide([de,quelle,region,provient,le,tttt]).

% questions règle vin->prix
question_valide([quel,est,le,prix,du,chiroubles]).
question_valide([combien,coute,le,chiroubles]).
question_valide([que,coute,le,chiroubles]).
question_valide([a,quel,prix,puis,je,acheter,le,chiroubles]).

question_invalide([que,coute,le,tttt]).

% questions règle vin->description
question_valide([pouvez,vous,me,parler,du,chiroubles]).
question_valide([decrivez,moi,le,chiroubles]).
question_valide([presentez,moi,le,chiroubles]).
question_valide([que,pouvez,vous,me,dire,au,sujet,du,chiroubles]).

question_invalide([decrivez,moi,le,tttt]).

% questions règle région->vins
question_valide([que,recouvre,l,appellation,bordeaux]).
question_valide([quels,vins,de,bordeaux,me,conseillez,vous ]).
question_valide([quels,vins,de,bordeaux,avez,vous ]).
question_valide([auriez,vous,un,bordeaux]).

question_invalide([quels,vins,de,tttt,avez,vous ]).

% questions règle prix->vins
question_valide([auriez,vous,des,vins,entre,10,et,20]).
question_valide([auriez,vous,des,vins,entre,20,et,10]).
question_valide([quel,est,votre,vin,le,plus,cher]).
question_valide([quel,est,votre,vin,le,moins,cher]).
question_valide([auriez,vous,des,vins,a,moins,de,20]).

question_invalide([auriez,vous,des,vins,a,moins,de,tt]).
question_invalide([auriez,vous,des,vins,entre,20,et,tt]).

% questions règle vin->plats
question_valide([quel,plat,pour,accompagner,du,chiroubles]).

question_invalide([quel,plat,pour,accompagner,du,tttt]).

% questions règle plat->vins
question_valide([quel,vin,pour,accompagner,du,poisson]).
question_valide([quel,vin,irait,avec,du,poisson]).
question_valide([je,vais,cuisiner,du,poisson,que,conseillez,vous]).

question_invalide([quel,vin,pour,accompagner,du,tttt]).

% questions règle autres vins (mémorisation)
question_invalide([en,avez,vous,dautres]).

% questions règle davantage d'information sur un vin (mémorisation)
question_valide([pouvez,vous,m,en,dire,davantage,sur,le,chiroubles]).

question_invalide([pouvez,vous,m,en,dire,davantage]).
