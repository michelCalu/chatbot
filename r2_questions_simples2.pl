:- multifile regle/2.

% questions région
%
% Que recouvre l’appellation [région] ?               ???
% Quels vins de [région] me conseillez-vous ?
% Quels vins de [région] avez-vous ?
% Auriez-vous un [région] ?

regle([conseillez,5],
                  [ [1, [Y,vin, de, Region, conseillez, vous ],0 , Reponse ] ]):-
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),                                           %ICI: limiter nombre de noms?
            %      flatten(N1,Noms),                                                      ajouter ranking des vins?
                  Reponse=([['nous pouvons vous conseiller  '],Noms]).              %voir affichage?

regle([conseiller,5],
                  [ [1, [Y, de, Region, pouvez,X, conseiller ],0 , Reponse ] ]):-
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),
            %      flatten(N1,Noms),
                  Reponse=([['nous pouvons vous conseiller  '],Noms]).


regle([avez,5],
                  [ [1, [avez,vous, Y, de, Region ],0 , Reponse ] ]):-
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),
            %      flatten(N1,Noms),
                  Reponse=([['oui nous avons par exemple  '],Noms]).


get_vin_de(Region,  L) :-
     findall( ID, region(ID, Region), L).

get_nom_de([], []).
get_nom_de([ID|T], [Nom|Rest]) :-
      nom(ID,Nom),
      get_nom_de(T,Rest).



% questions prix
%
% Auriez-vous des vins entre [prix_min] et [prix_max] ?
% Quel est votre vin le plus cher ?
% Quel est votre vin le moins cher ?
% Auriez-vous des vins à moins de [prix_max] ?

regle([entre,5],
                  [ [1, [quels,sont,les vins, entre, X, et, Y ],0 , Reponse ] ]):-
                        %print(X),print(Y),
                        lvins_prix_min_max(X,Y,Lvins),            %
                        rep_lvins_min_max(Lvins,Reponse).



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
