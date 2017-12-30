:- multifile regle/3.

regle([region,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_region(Question, Region),
                      !,
                      get_vin_de(Region, List),
                      get_nom_de(List, Noms),
                      rep_lvins(List,Reponse).

regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        is_number(X),
                        is_number(Y),
                        sort(0,@=<,[X,Y],[Min,Max]),
                        lvins_prix_min_max(Min,Max,Lvins),
                        rep_lvins_min_max(Lvins,Reponse).


regle([cher,9],
      [[1, [_,le,moins,cher], 0, Reponse]], Question):-
                        match(Question, [_,le,moins,cher]),
                        vin_prix_min(Vin),
                        rep_lvins([Vin],Reponse).


regle([moins,5],
      [[1, [_,moins,de,PrixMax], 0, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        is_number(PrixMax),
                        vins_moins_de_max(PrixMax, LVins),
                        rep_lvins(LVins,Reponse).

regle([plus,5],       %bug: pq vins_plus_de_min(10,L) donne une liste non finie??? alors que vins_moins_de_max(PrixMax, LVins) est OK
      [[1, [_,plus,de,PrixMin], 0, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        is_number(PrixMin),
                        vins_plus_de_min(PrixMin, Lvins),
                        rep_lvins(LVins,Reponse).

regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        not(is_number(X)),!,
                        Reponse=([['le prix minimum n est pas un nombre']]).

regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        not(is_number(Y)),!,
                        Reponse=([['le prix maximum n est pas un nombre']]).


regle([moins,9],
      [[1, [_,moins,de,PrixMax], 0, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        not(is_number(PrixMax)),!,
                        Reponse=([['le prix donne n est pas un nombre']]).

regle([plus,9],
      [[1, [_,plus,de,PrixMin], 0, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        not(is_number(PrixMin)),!,
                        Reponse=([['le prix donne n est pas un nombre']]).
