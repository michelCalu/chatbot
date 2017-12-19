/***********************************************/
% pattern de génération de réponse
%

regle([bouche,5],[
        	[1, [que, donne, le, X, en, bouche],0 , Reponse ]
                 ]):- nom(ID, X),
                      bouche(ID,Reponse).
regle([bouche,5],[
      	[1, [comment,est, le, X, en, bouche],0 , Reponse ]
               ]):- nom(ID, X),
                    bouche(ID,Reponse).

regle([bonjour,1],[
      	[1, X, 0 , Reponse ]
               ]):- salutation(X,Reponse).


regle([notfound,99],[
            [1, [X], 0, Reponse ]
            ]):- notfound(X,Reponse).


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
