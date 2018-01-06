:- multifile regle/3.

/***********************************************/
% Série de règles.
% Format:
%     regle( [motclé,poids], [Id, [pattern de question], Compteur, [Réponse au pattern]], Question)
%     in: Question posée
%     out: retourne Reponse si:
%           match  (pattern,  Question) ET (autres condition(s) réussie(s))
%     Nb: poids et Compteur ne sont pas utilisées et remplacées par _
%

% questions région  (motcle[#appellation, #region, #ou, #origine])
%
% Avez-vous des vins de la région [région] ?           OK

regle([region,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      get_region(Question, Region),
                      !,
                      get_vins_de_region(Region, List),
                      set_liste_memo(List, Liste2),!,
                      rep_lvins(Liste2,Reponse).

% questions prix  (motcle[#entre, #cher, #moins, #plus])
%
% Auriez-vous des vins entre [prix_min] et [prix_max] ?     OK
% Quel est votre vin le plus cher ?                         OK
% Quel est votre vin le moins cher ?                        OK
% Auriez-vous des vins à moins de [prix_max] ?              OK
% Auriez-vous des vins à plus de [prix_min] ?               OK

regle([entre,_],
      [[1, [_, X, et, Y ], _, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        is_number(X),
                        is_number(Y),
                        sort(0,@=<,[X,Y],[Min,Max]),
                        vins_prix_min_max(Min,Max,LVins),
                        set_liste_memo(LVins, Liste2),!,
                        rep_lvins(Liste2,Reponse).

regle([cher,_],
      [[1, [_,le,moins,_], _, Reponse]], Question):-
                        match(Question, [_,le,moins,_]),
                        vin_prix_min(ID_Vin),
                        set_vin_memo(ID_Vin, prix),
                        rep_lvins([ID_Vin],Reponse).

regle([cher,_],
      [[1, [_,le,plus,_], _, Reponse]], Question):-
                        match(Question, [_,le,plus,_]),
                        vin_prix_max(ID_Vin),
                        set_vin_memo(ID_Vin, prix),
                        rep_lvins([ID_Vin],Reponse).

regle([moins,_],
      [[1, [_,moins,de,PrixMax], _, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        is_number(PrixMax),
                        vins_moins_de_max(PrixMax, LVins),
                        set_liste_memo(LVins, Liste2),!,
                        rep_lvins(Liste2,Reponse).

regle([plus,_],
      [[1, [_,plus,de,PrixMin], _, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        is_number(PrixMin),
                        vins_plus_de_min(PrixMin, LVins),
                        set_liste_memo(LVins, Liste2),!,
                        rep_lvins(Liste2,Reponse).

regle([entre,_],
      [[1, [_, X, et, Y ], _, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        not(is_number(X)),!,
                        Reponse=([['le prix minimum n est pas un nombre']]).

regle([entre,_],
      [[1, [_, X, et, Y ], _, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        not(is_number(Y)),!,
                        Reponse=([['le prix maximum n est pas un nombre']]).


regle([moins,_],
      [[1, [_,moins,de,PrixMax], _, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        not(is_number(PrixMax)),!,
                        Reponse=([['le prix donne n est pas un nombre']]).

regle([plus,_],
      [[1, [_,plus,de,PrixMin], _, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        not(is_number(PrixMin)),!,
                        Reponse=([['le prix donne n est pas un nombre']]).
