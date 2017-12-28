
% ---------------------------------------------------------
% Quel vin pour accompagner du [poisson] ?               OK
%               accompagne
% Quel vins conseillez vous pour du [poisson] ?          KO
%                           pour des, avec du, avec des
% Quels vins irait avec du [poisson] ?                   OK
%            pour aller avec
% Je vais cuisiner du [poisson], que conseillez-vous ?   OK
% Quel plat pour accompagner du [Vin]                    OK
%----------------------------------------------------------

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
/*
partie_liste(Liste, Newliste) :-
  length(Liste,Nb),
  calcule(Nb,Mi,Lg),
  %Mi is 1,
  %Lg is 2,
  write(Mi), write(' '), write(Lg), write(' '), writeln(Nb),
  %Newliste = Liste.
  choix(Liste,Mi,Lg,Newliste). */
  
partie_liste(A,B) :-
  writeln(hello),
  B=A.

% 2 est le nombre d'items affichés simultanément
calcule(Nb,Mi,Lg) :-
   nb_getval(depart,Mi),
   (Mi+2-1)>=Nb,
   Lg is (Nb-Mi+1),
   nb_setval(depart,1).

calcule(Nb,Mi,Lg) :-
   nb_getval(depart,Mi),
   (Mi+2-1)<Nb,
   Lg is 2,
   X is (Mi+2),
   %write('Augmente x'),writeln(X),
   nb_setval(depart,X).
  
  
% Prend une liste de plats, et retourne une liste où ils sont séparés par des virgules
format_plats([],_).
format_plats([H|T],Sortie) :-
   format_plats(T,Newsortie),
   append(Newsortie,[H,','],Sortie).
   
% Quel vin accompagne du brie?
regle([accompagner,8],[
                [1, [_],0 , Reponse ]], Question):-
                      get_plat(Question, Plat),!,
                      get_vin_acc(Plat, List),!,
                      partie_liste(List, Liste2),!,
                      format_vins(Liste2, Listevins),!,
                      Reponse=([['pour accompagner du ',Plat,' je vous suggère '],Listevins]).
                      
regle([accompagner,8],[
                [1, [_],0 , Reponse ]], Question):-
                      not(get_plat(Question, _)),
                      Reponse = [['je suis confus, je ne trouve pas de vin correspondant']].
                  
% Quel plat pour du chiroubles ?
regle([plat,8],[
                [1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID),!,
                      get_plats(ID,Liste),!,
                      format_plats(Liste,ListePlats),!,
                      Reponse=([['vous pouvez utiliser le ',ID,' avec les plats suivants : '],ListePlats]).
                      

regle([plat,8],[
                [1, [_],0 , Reponse ]], Question):-
                      not(get_vin(Question, _)),
                      Reponse = [['je suis confus, je ne trouve pas de vin correspondant']].
                      
regle([autre,6],[
                [1, [_],0 , Reponse ]], _):-
                      nb_getval(depart,X),
                      X>1,
                      Reponse = [['oui, oui'],[X]].
                      
regle([autre,6],[
                [1, [_],0 , Reponse ]], _):-
                      nb_getval(depart,X),
                      X<2,
                      Reponse = [['non, désolé'],[X]].