﻿%----------------------------------------------------------------------------
% Définit le nombre de lignes maximum à afficher
%----------------------------------------------------------------------------
affichage(Lignes) :-
    Lignes is 3.


/***************************************************************************/
% rep_lvins(ListeIDvins, Reponse)
%     affiche une liste de vins avec leur prix

%  Le [nom_du_vin] a [prix_du_vin] EUR
%
rep_lvins([], [[ non, '.' ]]).
rep_lvins([H|T], [ [ oui, '.', je, dispose, de ] | L]) :-
  maplist(id_vin_to_string, [H|T], L).

 %=========================================================================================

 %--------------------------------------------------------------------
 % Prend une liste d'id de vins, et le formate en plusieurs lignes
 % sous la forme "Le nom_du_vin a prix_du_vin euros \n"
 %--------------------------------------------------------------------

 format_vins([],_).
 format_vins([ID|T],Sortie) :-
   format_vins(T,Newsortie),
   id_vin_to_string(ID, String),
   append(String,['\n'],String2),
   append(Newsortie,String2,Sortie).

% Prend une liste de plats, et retourne une liste où ils sont séparés par des virgules
format_plats([],_).
format_plats([H|T],Sortie) :-
  format_plats(T,Newsortie),
  append(Newsortie,[H,','],Sortie).

% prend un ID en entrée et renvoie un String
id_vin_to_string(ID, String) :-
  nom(ID,Nom),
  append(['Le'],Nom,L1),
  prix(ID,Prix),
  append(L1,['a',Prix,'EUR'],String).
