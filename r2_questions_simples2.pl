:- multifile regle/3.

% questions région      ---> OK pb findall résolu
%
% Que recouvre l’appellation [région] ?               OK
% Quels vins de [région] me conseillez-vous ?         OK
% Quels vins de [région] avez-vous ?                  OK
% Auriez-vous un [région] ?                           OK

get_vin_de([Region],  L) :-
     findall( ID, region(ID, Region), L).

get_nom_de([], []).
get_nom_de([ID|T], [Nom|Rest]) :-
      nom(ID,Nom),
      get_nom_de(T,Rest).

regle([conseillez,5],
                  [ [1, [_, de, Region, conseillez, vous],0 , Reponse ]], Question):-
                  match(Question, [_, de, Region, conseillez, vous ]),

                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),
                                                     %ICI: limiter nombre de noms à x?
            %                                        idée; ajouter ranking des vins pour classer le x?
                  Reponse=([['nous pouvons vous conseiller  '],Noms]).       %faire affichage amélioré

regle([conseiller,5],
                  [ [1, [_, de, Region,pouvez,vous,conseiller],0 , Reponse ]], Question):-
                  match(Question, [_, de, Region,pouvez,vous , conseiller]),
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),
                  Reponse=([['nous pouvons vous conseiller  '],Noms]).


regle([avez,5],
                  [ [1, [avez,vous, _, de, Region ],0 , Reponse ]], Question):-
                  match(Question, [avez,vous, _, de, Region ]),
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),
                  Reponse=([['oui nous avons par exemple  '],Noms]).



% questions prix                  ===========  OK =============
%
% Auriez-vous des vins entre [prix_min] et [prix_max] ?     OK
% Quel est votre vin le plus cher ?
% Quel est votre vin le moins cher ?
% Auriez-vous des vins à moins de [prix_max] ?

regle([entre,5],
      [[1, [_, vins, entre, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_, vins, entre, X, et, Y ]),
                        lvins_prix_min_max(X,Y,Lvins),
                        rep_lvins_min_max(Lvins,Reponse).


regle([cher,5],
      [[1, [_, vin,le,plus,cher], 0, Reponse]], Question):-
                        match(Question, [_, vin,le,plus,cher]),
                        vin_prix_max(Vin),
                        nom(Vin, Nom),
                        Reponse=([['notre vin le plus cher est le  '], Nom]).       %affichage

regle([cher,5],
      [[1, [_, vin,le,moins,cher], 0, Reponse]], Question):-
                        match(Question, [_, vin,le,moins,cher]),
                        vin_prix_min(Vin),
                        nom(Vin, Nom),
                        Reponse=([['notre vin le moins cher est le  '], Nom]).      %affichage

regle([moins,5],
      [[1, [_,moins,de,PrixMax], 0, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        vins_moins_de_max(PrixMax, LVins),
                        Reponse=([['oui, nous vous proposons par exemple: '], LVins]).      %à faire: affichage liste + cas liste vide

/***************************************************************************/
% vins_moins_de_max(Max, Lvins)
%     out: Lvins = liste des vins dont le prix est <= Max
%
vins_moins_de_max(Max,Lvins) :-
      findall( (Vin,P) , prix_moins_de_max(Vin,P,Max), Lvins ).

prix_moins_de_max(Vin,P,Max) :-
      prix(Vin,P),
      P =< Max.



/***************************************************************************/
% vin_prix_max(Vin)
%     out: Vin est le vin le plus cher
%
vin_prix_max(X):- prix(X, _), not( plus_cher(X)), !.
plus_cher(X):- prix(X, PrixX), prix(Y, PrixY), Y\=X, PrixX < PrixY.

/***************************************************************************/
% vin_prix_min(Vin)
%     out: Vin est le vin le moins cher
%
vin_prix_min(X):- prix(X, _), not( moins_cher(X)), !.
moins_cher(X):- prix(X, PrixX), prix(Y, PrixY), Y\=X, PrixX > PrixY.


/***************************************************************************/
% lvins_prix_min_max(Min, Max, Result)
%     out: Liste de tous les vins de min<=prix<=max
%
lvins_prix_min_max(Min,Max,Lvins) :-
      findall( (Vin,P) , prix_vin_min_max(Vin,P,Min,Max), Lvins ).

prix_vin_min_max(Vin,P,Min,Max) :-
      prix(Vin,P),
      Min =< P, P =< Max.

/***************************************************************************/
% Affichage reponse
%
%

rep_lvins_min_max([], [[ non, '.' ]]).
rep_lvins_min_max([H|T], [ [ oui, '.', je, dispose, de ] | L]) :-
 rep_litems_vin_min_max([H|T],L).

rep_litems_vin_min_max([],[]) :- !.
rep_litems_vin_min_max([(V,P)|L], [Irep|Ll]) :-
 nom(V,Appellation),
 Irep = [ '- ', Appellation, '(', P, ' EUR )' ],
 rep_litems_vin_min_max(L,Ll).
%=========================================================================================
