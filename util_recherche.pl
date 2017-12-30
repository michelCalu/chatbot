% récupère l'ID d'un vin à partir d'une liste de mots (typiquement une question)
get_vin(L_mots, ID) :-
  sublist(Nom_Vin, L_mots),
  nom(ID, Nom_Vin).

% récupère le nom d'une région à partir d'une liste de mots (typiquement une question)
get_region(L_mots, Region) :-
  sublist([Region], L_mots),
  region(_, Region).

% récupère une liste des vins d'une région donnée
get_vin_de(Region,  L) :-
     findall( ID, region(ID, Region), L).

% récupère une liste d'ID à partir d'une liste de noms de vins
get_nom_de([], []).
get_nom_de([ID|T], [Nom|Rest]) :-
      nom(ID,Nom),
      get_nom_de(T,Rest).

/***************************************************************************/
% vins_moins_de_max(Max, Lvins)
%     out: Lvins = liste des vins dont le prix est <= Max
%
vins_moins_de_max(Max,Lvins) :-
      findall( (Vin) , prix_moins_de_max(Vin,P,Max), Lvins ).

prix_moins_de_max(Vin,P,Max) :-
      prix(Vin,P),
      P =< Max.

vins_plus_de_min(Min,Lvins) :-
      findall( (Vin) , prix_plus_de_min(Vin,P,Min), Lvins ).

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

% Trouve un plat dans une liste de mots
get_plat(L_mots, Plat) :-
  sublist([Plat], L_mots),
  accompagnement(_, Plat).

% Trouve une liste L de vins pouvant accompagner un plat
get_vin_acc(Plat,  L) :-
     findall( ID, accompagnement(ID, Plat), L).

% Trouve une liste L d'id de vins pouvant accompagner un plat.
get_plats(ID,  L) :-
     findall( Plat, accompagnement(ID, Plat), L).
