test_programme(L):-
      findall(Question, incorrect(Question),L).

incorrect(Q):-
      question_valide(Q),
      produire_reponse(Q, Reponse),
      not(rep_valide(Reponse)).

rep_valide(R):- not(notfound(_,R)),
                not(reponse_invalide(R)).


reponse_invalide([['pas de vin correspondant pour bouche']]).
reponse_invalide([['pas de vin correspondant pour nez']]).
reponse_invalide([['pas de vin ou de region correspondant']]).
reponse_invalide([['pas de vin correspondant pour prix']] ).
reponse_invalide([['pas de vin correspondant pour description']]).
reponse_invalide([['je suis confus, je ne trouve pas de vin correspondant']] ).
reponse_invalide([['le prix minimum n est pas un nombre']] ).
reponse_invalide([['le prix maximum n est pas un nombre']] ).



question_valide([que,donne,le,tttt,en,bouche]).
question_valide([comment,est,le,chiroubles,en,bouche]).
question_valide([comment,est,l,attaque,du,chiroubles]).
question_valide([parlez,moi,de,la,longueur,du,chiroubles ]).
question_valide([quel,nez,presente,le,chiroubles]).
question_valide([quels,sont,les,aromes,du,chiroubles]).
question_valide([quel,est,le,bouquet,du,chiroubles]).
question_valide([quelles,sont,les,proprietes,olfactives,du,chiroubles]).
question_valide([quelle,est,l,appellation,du,chiroubles]).
question_valide([de,quelle,region,provient,le,chiroubles]).
question_valide([d,ou,provient,le,chiroubles]).
question_valide([de,quelle,origine,est,le,chiroubles ]).
question_valide([quel,est,le,prix,du,chiroubles]).
question_valide([combien,coute,le,chiroubles]).
question_valide([que,coute,le,chiroubles]).
question_valide([a,quel,prix,puis,je,acheter,le,chiroubles]).
question_valide([pouvez,vous,me,parler,du,chiroubles]).
question_valide([decrivez,moi,le,chiroubles]).
question_valide([presentez,moi,le,chiroubles]).
question_valide([que,pouvez,vous,me,dire,au,sujet,du,chiroubles]).
question_valide([que,recouvre,l,appellation,bordeaux]).
question_valide([quels,vins,de,bordeaux,me,conseillez,vous ]).
question_valide([quels,vins,de,bordeaux,avez,vous ]).
question_valide([auriez,vous,un,bordeaux]).
question_valide([auriez,vous,des,vins,entre,10,et,20 ]).
question_valide([auriez,vous,des,vins,entre,20,et,10 ]).
question_valide([quel,est,votre,vin,le,plus,cher]).
question_valide([quel,est,votre,vin,le,moins,cher]).
question_valide([auriez,vous,des,vins,a,moins,de,20]).
