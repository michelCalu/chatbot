/***********************************************/
% pattern de génération de réponse
%
regle([bordeaux,5],[
        	[1, [quel,bordeaux,conseillez,vous], 0, [je,vous,conseille,un,saint,emilion] ],
            [2, [quel,est,le,meilleur,bordeaux], 0, [un,saint,emilion] ]
            ]).
regle([rouge,5],[
        	[1, [quel,vin,rouge,avez,vous], 0, [nous,avons,un,beaujolais] ]
            ]).
regle([promotion,5],[
        	[1, [quel,vin,est,en,promotion], 0, [il,n,y,a,pas,de,promotion,en,ce,moment,!] ]
            ]).
regle([],[
            [1, [X], 0, [je,ne,peux,pas,repondre,a,cette,question] ]
            ]).


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
