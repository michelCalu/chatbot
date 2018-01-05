/* --------------------------------------------------------------------- */
/*                                                                       */
/*                       UTILITAIRES RECHERCHE                           */
/*                                                                       */
/* --------------------------------------------------------------------- */

/***************************************************************************/
% récupère l'ID d'un vin à partir d'une liste de mots (typiquement une question)
% format :
%        get_vin(ListeMots, IDVin)
%        in : ListeMots est une liste de mots
%        out : IDVin est l'identifiant d'un vin dont le nom est une sous-liste
%              de ListeMots

get_vin(L_mots, ID) :-
  sublist(Nom_Vin, L_mots),
  nom(ID, Nom_Vin).

/***************************************************************************/
% récupère le nom d'une région à partir d'une liste de mots (typiquement une question)
% format :
%        get_region(ListeMots, Region)
%        in : ListeMots est une liste de mots
%        out : Region est le nom d'une région qui est un élément de ListeMots

get_region(L_mots, Region) :-
  sublist([Region], L_mots),
  region(_, Region).

/***************************************************************************/
% récupère une liste des vins d'une région donnée
% format :
%        get_vins_de_region(Region, ListeIDvins)
%        in : Region est le nom d'une région
%        out : ListeIDvins est la liste des identifiants de vins appartenant à
%              cette région

get_vins_de_region(Region,  L) :-
     findall( ID, region(ID, Region), L).

/***************************************************************************/
% récupère une liste de vins dont le prix est inférieur à un certain montant
% format :
%        vins_moins_de_max(Max, Lvins)
%        in : Max est le montant maximum
%        out : Lvins est la liste des identifiants des vins dont le prix est <= Max

vins_moins_de_max(Max,Lvins) :-
      findall( (IDVin) , prix_moins_de_max(IDVin,Max), Lvins ).

% est vrai si le prix de IDVin est inférieur ou égal à Max
prix_moins_de_max(IDVin,Max) :-
      prix(IDVin,P),
      P =< Max.

/***************************************************************************/
% récupère une liste de vins dont le prix est supérieur à un certain montant
% format :
%        prix_plus_de_min(Min, Lvins)
%        in : Min est le montant minimum
%        out : Lvins est la liste des identifiants des vins dont le prix est >= Min

vins_plus_de_min(Min,Lvins) :-
      findall( (IDVin) , prix_plus_de_min(IDVin,Min), Lvins ).

% est vrai si le prix de IDVin est supérieur ou égal à Min
prix_plus_de_min(Vin,Min) :-
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
% récupère une liste de vins dont le prix est dans une fourchette donnée
% format :
%        vins_prix_min_max(Min,Max,Lvins)
%        in : Min est le montant minimum et Max est le montant maximum
%        out : Lvins est la liste des identifiants des vins dont le prix est >= Min
%              et <= Max

vins_prix_min_max(Min,Max,Lvins) :-
      findall( (Vin) , prix_vin_min_max(Vin,Min,Max), Lvins ).

% est vrai si le prix de IDVin est entre Min et Max
prix_vin_min_max(Vin,Min,Max) :-
      prix(Vin,P),
      Min =< P, P =< Max.

/***************************************************************************/
% trouve un plat dans une liste de mots
% format :
%        get_plat(L_mots, Plat)
%        in : L_mots est une liste de mots
%        out : Plat est le nom d'un plat qui est un élément de ListeMots

get_plat(L_mots, Plat) :-
  sublist(Plat, L_mots),
  accompagnement(_, Plat).

/***************************************************************************/
% récupère une liste des vins pouvant accompagnez un plat donné
% format :
%        get_vin_acc(Plat, ListeIDvins)
%        in : Plat est le nom d'un plat
%        out : ListeIDvins est la liste des identifiants de vins pouvant
%              accompagner Plat

get_vin_acc(Plat,  L) :-
     findall( ID, accompagnement(ID, Plat), L).

/***************************************************************************/
% récupère une liste de plats pouvant accompagnez un vin donné
% format :
%        get_plats(IDVin, ListePlats)
%        in : IDVin est l'identifiant d'un vin
%        out : ListePlats est la liste des plats pouvant accompagner IDVin

get_plats(ID,  L) :-
     findall( Plat, accompagnement(ID, Plat), L).
