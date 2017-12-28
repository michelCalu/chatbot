:- multifile regle/3.

% questions région      ---> OK pb findall résolu
%
% Que recouvre l’appellation [région] ?               OK
% Quels vins de [région] me conseillez-vous ?         OK
% Quels vins de [région] avez-vous ?                  OK
% Auriez-vous un [région] ?                           OK

get_region(L_mots, Region) :-
  sublist([Region], L_mots),
  region(_, Region).

get_vin_de(Region,  L) :-
     findall( ID, region(ID, Region), L).

get_nom_de([], []).
get_nom_de([ID|T], [Nom|Rest]) :-
      nom(ID,Nom),
      get_nom_de(T,Rest).


% questions région
%
% Que recouvre l’appellation [région] ?               OK
% Quels vins de [région] me conseillez-vous ?         OK
% Quels vins de [région] avez-vous ?                  OK
% Auriez-vous un [région] ?                           OK

regle([region,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_region(Question, Region),
                      !,
                      get_vin_de(Region, List),
                      get_nom_de(List, Noms),
                      % ICI: limiter nombre de noms à x?
                      % idée; ajouter ranking des vins pour classer le x?
                      Reponse=([['nous pouvons vous conseiller  '],Noms]).       %faire affichage amélioré



% questions prix                  ===========  OK =============
%
% Auriez-vous des vins entre [prix_min] et [prix_max] ?     OK
% Quel est votre vin le plus cher ?
% Quel est votre vin le moins cher ?
% Auriez-vous des vins à moins de [prix_max] ?

% DEBUG : vérif X et Y sont des nombres
regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        %number(X),
                        %number(Y),
                        sort(0,@=<,[X,Y],[Min,Max]),
                        lvins_prix_min_max(Min,Max,Lvins),
                        rep_lvins_min_max(Lvins,Reponse).

regle([cher,5],
      [[1, [_], 0, Reponse]], Question):-
                        match(Question, [_,le,plus,_]),
                        vin_prix_max(Vin),
                        nom(Vin, Nom),
                        Reponse=([['notre vin le plus cher est le  '], Nom]).       %affichage

regle([cher,5],
      [[1, [_], 0, Reponse]], Question):-
                        match(Question, [_,le,moins,_]),
                        vin_prix_min(Vin),
                        nom(Vin, Nom),
                        Reponse=([['notre vin le moins cher est le  '], Nom]).      %affichage

% DEBUG : vérif PrixMax est un nombre
regle([moins,5],
      [[1, [_,moins,de,PrixMax], 0, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        %number(PrixMax),
                        vins_moins_de_max(PrixMax, LVins),
                        Reponse=([['oui, nous vous proposons par exemple: '], LVins]).      %à faire: affichage liste + cas liste vide

% DEBUG : vérif PrixMin est un nombre
regle([plus,5],
      [[1, [_,plus,de,PrixMin], 0, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        %number(PrixMin),
                        vins_plus_de_min(PrixMin, LVins),
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

vins_plus_de_min(Min,Lvins) :-
      findall( (Vin,P) , prix_plus_de_min(Vin,P,Min), Lvins ).

prix_plus_de_min(Vin,P,Min) :-
      prix(Vin,P),
      P >= Min.

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
%     out: Liste de tous les vins de Min<=Prix<=Max
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
