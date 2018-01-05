/* --------------------------------------------------------------------- */
/*                                                                       */
/*                       UTILITAIRES AFFICHAGE                           */
/*                                                                       */
/* --------------------------------------------------------------------- */

/***************************************************************************/
% formatte une liste de vins avec leurs prix pour affichage
% format :
%       rep_lvins(ListeIDvins, Reponse)
%       in : ListeIDvins est une liste d'identifiant de vins
%       out : Reponse contient une liste reprenant les noms et prix des vins
%       nb : si ListeIDvins vide, Reponse = [[ non, '.' ]]

rep_lvins([], [[ non, '.' ]]).
rep_lvins([H|T], [ [ oui, '.', je, dispose, de ] | L]) :-
  maplist(id_vin_to_string, [H|T], L).

/***************************************************************************/
% formatte une liste de vins avec leurs prix pour affichage
% format :
%       format_vins(ListeIDvins, Reponse)
%       in : ListeIDvins est une liste d'identifiant de vins
%       out : Reponse contient une liste reprenant les noms et prix des vins

format_vins([],_).
format_vins([ID|T],Sortie) :-
  format_vins(T,Newsortie),
  id_vin_to_string(ID, String),
  append(String,['\n'],String2),
  append(Newsortie,String2,Sortie).

/***************************************************************************/
% formatte une liste de plats pour affichage
% format :
%       format_plats(ListePlats, Reponse)
%       in : ListePlats est une liste de plats
%       out : Reponse contient une liste reprenant les noms des plats séparés par
%             des virgules

format_plats([],_).
format_plats([H|T],Sortie) :-
  format_plats(T,Newsortie),
  append(Newsortie,[H,','],Sortie).

/***************************************************************************/
% formatte un vin pour affichage
% format :
%       id_vin_to_string(IDVin, String)
%       in : IDVin est un identifiant de vin
%       out : String est une string reprenant le nom et le prix du vin
%             format : Le [nom_du_vin] a [prix_du_vin] EUR \n

id_vin_to_string(ID, String) :-
  nom(ID,Nom),
  append(['Le'],Nom,L1),
  prix(ID,Prix),
  append(L1,['a',Prix,'EUR'],String).
