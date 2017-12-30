/***************************************************************************/
% rep_lvins(ListeIDvins, Reponse)
%     affiche une liste de vins avec leur prix

%  -  [beaujolais,nouveau] ( 6.75  EUR )
%  -  [chiroubles] ( 8.41  EUR )
%  -  [saint,amour] ( 11.43  EUR )
%
rep_lvins([], [[ non, '.' ]]).
rep_lvins([H|T], [ [ oui, '.', je, dispose, de ] | L]) :-
 rep_litems([H|T],L).

rep_litems([],[]) :- !.
rep_litems([ID|L], [Irep|Ll]) :-
 nom(ID,Nom),
 prix(ID,Prix),
 Irep = [ '- ', Nom, '(', Prix, ' EUR )' ],
 rep_litems(L,Ll).

 /***************************************************************************/
 % Affichage reponse prix vins
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

 %--------------------------------------------------------------------
 % Prend une liste d'id de vins, et le formate en plusieurs lignes
 % sous la forme "Le nom_du_vin a prix_du_vin euros \n"
 %--------------------------------------------------------------------

 format_vins([],_).
 format_vins([H|T],Sortie) :-
   format_vins(T,Newsortie),
   nom(H,Nom),
   append(['Le'],Nom,L1),
   prix(H,Prix),
   append(L1,['a',Prix,'euros','\n'],L2),
   append(Newsortie,L2,Sortie).

% Prend une liste de plats, et retourne une liste où ils sont séparés par des virgules
format_plats([],_).
format_plats([H|T],Sortie) :-
  format_plats(T,Newsortie),
  append(Newsortie,[H,','],Sortie).
