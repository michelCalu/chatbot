:- multifile regle/3.

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



get_region(L_mots, Region) :-
  sublist([Region], L_mots),
  region(_, Region).

get_vin_de(Region,  L) :-
     findall( ID, region(ID, Region), L).

get_nom_de([], []).
get_nom_de([ID|T], [Nom|Rest]) :-
      nom(ID,Nom),
      get_nom_de(T,Rest).



regle([region,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_region(Question, Region),
                      !,
                      get_vin_de(Region, List),
                      get_nom_de(List, Noms),
                      rep_lvins(List,Reponse).


/***************************************************************************/
% is_number(X)
%     return true if X is an integer, or a list of 1 integer, else false.
%
is_number(X):-
      is_list(X),
      nth0(0,X,ValueX),
      number(ValueX).
is_number(X):-
      number(X).


regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        is_number(X),
                        is_number(Y),
                        sort(0,@=<,[X,Y],[Min,Max]),
                        lvins_prix_min_max(Min,Max,Lvins),
                        rep_lvins_min_max(Lvins,Reponse).


regle([cher,9],
      [[1, [_,le,moins,cher], 0, Reponse]], Question):-
                        match(Question, [_,le,moins,cher]),
                        vin_prix_min(Vin),
                        rep_lvins([Vin],Reponse).


regle([moins,5],
      [[1, [_,moins,de,PrixMax], 0, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        is_number(PrixMax),
                        vins_moins_de_max(PrixMax, LVins),
                        rep_lvins(LVins,Reponse).

regle([plus,5],       %bug: pq vins_plus_de_min(10,L) donne une liste non finie??? alors que vins_moins_de_max(PrixMax, LVins) est OK
      [[1, [_,plus,de,PrixMin], 0, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        is_number(PrixMin),
                        vins_plus_de_min(PrixMin, Lvins),
                        rep_lvins(LVins,Reponse).

regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        not(is_number(X)),!,
                        Reponse=([['le prix minimum n est pas un nombre']]).

regle([entre,5],
      [[1, [_, X, et, Y ], 0, Reponse]], Question):-
                        match(Question, [_,entre, X, et, Y ]),
                        not(is_number(Y)),!,
                        Reponse=([['le prix maximum n est pas un nombre']]).


regle([moins,9],
      [[1, [_,moins,de,PrixMax], 0, Reponse]], Question):-
                        match(Question, [_,moins,de,PrixMax]),
                        not(is_number(PrixMax)),!,
                        Reponse=([['le prix donne n est pas un nombre']]).

regle([plus,9],
      [[1, [_,plus,de,PrixMin], 0, Reponse]], Question):-
                        match(Question, [_,plus,de,PrixMin]),
                        not(is_number(PrixMin)),!,
                        Reponse=([['le prix donne n est pas un nombre']]).

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
      P > Min.


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
