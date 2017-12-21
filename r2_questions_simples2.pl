:- multifile regle/2.

% questions région      ---> OK pb findall résolu
%
% Que recouvre l’appellation [région] ?               OK
% Quels vins de [région] me conseillez-vous ?         OK
% Quels vins de [région] avez-vous ?                  OK
% Auriez-vous un [région] ?                           OK

regle([conseillez,5],
                  [ [1, [_, de, Region, conseillez, vous ],0 , Reponse ] ]):-
                  region(_,Region),
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),                                           %ICI: limiter nombre de noms?
      %                                                    ajouter ranking des vins?
                  Reponse=([['nous pouvons vous conseiller  '],Noms]).              %voir affichage

regle([conseiller,5],
                  [ [1, [_, de, Region, _, conseiller ],0 , Reponse ] ]):-
                  region(_,Region),
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),

                  Reponse=([['nous pouvons vous conseiller  '],Noms]).


regle([avez,5],
                  [ [1, [avez,vous, _, de, Region ],0 , Reponse ] ]):-
                  region(_,Region),
                  get_vin_de(Region, List),
                  get_nom_de(List, Noms),

                  Reponse=([['oui nous avons par exemple  '],Noms]).


get_vin_de(Region,  L) :-
     findall( ID, region(ID, Region), L).

get_nom_de([], []).
get_nom_de([ID|T], [Nom|Rest]) :-
      nom(ID,Nom),
      get_nom_de(T,Rest).



% questions prix                  ===========  NOK =============
%
% Auriez-vous des vins entre [prix_min] et [prix_max] ?
% Quel est votre vin le plus cher ?
% Quel est votre vin le moins cher ?
% Auriez-vous des vins à moins de [prix_max] ?

regle([entre,5],
                  [ [1, [quels,sont,les, vins, entre, X, et, Y ],0 , Reponse ] ]):-

                        lvins_prix_min_max(X,Y,Lvins),            %comment instancier X & Y? il faudrait la
                        rep_lvins_min_max(Lvins,Reponse).         % Q en 3eme argument pour avoir les valeurs
                                                                  % = modifier toutes les regle/2 --> regle/3...

%=========== OK avec lvins_prix_min_max(X,Y,Lvins) bien instancié ===================
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
%=========================================================================================
