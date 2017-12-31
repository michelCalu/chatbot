
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


% Quel vin accompagne du brie?
regle([accompagner,8],[
                [1, [_],0 , Reponse ]], Question):-
                      get_plat(Question, Plat),!,
                      get_vin_acc(Plat, List),!,
                      partie_liste(List, Liste2),!,
                      format_vins(Liste2, Listevins),!,
                      Reponse=([['pour accompagner du ',Plat,' je vous suggere '],Listevins]).

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
