:- multifile regle/3.

% questions région  (motcle[#appellation, #region, #ou, #origine])
% Quelle est l’appellation du [vin] ?           OK
% De quelle région provient le [vin] ?          OK
% D’où provient le [vin] ?                      OK
% De quelle origine est le [vin] ?              OK

regle([region,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_region(Question, Region),
                      !,
                      get_vins_de_region(Region, List),
                      %get_ids_noms(List, Noms),
                      partie_liste(List, Liste2),!,
                      rep_lvins(Liste2,Reponse).

% questions prix                  ===========  OK =============
%
% Auriez-vous des vins entre [prix_min] et [prix_max] ?     OK
% Quel est votre vin le plus cher ?                         OK
% Quel est votre vin le moins cher ?                        OK
% Auriez-vous des vins à moins de [prix_max] ?              OK
% Auriez-vous des vins à plus de [prix_min] ?               OK

regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        is_number(X),
                        is_number(Y),
                        sort(0,@=<,[X,Y],[Min,Max]),
                        vins_prix_min_max(Min,Max,LVins),
                        partie_liste(LVins, Liste2),!,
                        rep_lvins(Liste2,Reponse).

regle([cher,9],
      [[1, [_,le,moins,_], 0, Reponse]], Question):-
                        match(Question, [_,le,moins,_]),
                        vin_prix_min(Vin),
                        rep_lvins([Vin],Reponse).

regle([cher,9],
      [[1, [_,le,plus,_], 0, Reponse]], Question):-
                        match(Question, [_,le,plus,_]),
                        vin_prix_max(Vin),
                        rep_lvins([Vin],Reponse).

regle([moins,5],
      [[1, [_,moins,de,PrixMax], 0, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        is_number(PrixMax),
                        vins_moins_de_max(PrixMax, LVins),
                        partie_liste(LVins, Liste2),!,
                        rep_lvins(Liste2,Reponse).

regle([plus,5],
      [[1, [_,plus,de,PrixMin], 0, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        is_number(PrixMin),
                        vins_plus_de_min(PrixMin, LVins),
                        partie_liste(LVins, Liste2),!,
                        rep_lvins(Liste2,Reponse).

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
