:- multifile regle/3.

/***********************************************/
% Série de règles.
% Format:
%     regle( [motclé,poids], [Id, [pattern de question], Compteur, [Réponse au pattern]], Question)
%     in: Question posée
%     out: retourne Reponse si:
%           match  (pattern,  Question) ET (autres condition(s) réussie(s))
%     Nb: poids et Compteur ne sont pas utilisées et remplacées par _
%

% questions région  (motcle[#accompagner, #plat,])
%
% Quel vin pour accompagner du [nom plat] ?              OK
%               accompagne                               OK
% Quels vins irait avec du [nom plat] ?                  OK
%            pour aller avec                             OK
% Je vais cuisiner du [nom plat], que conseillez-vous ?  OK
% Quel plat pour accompagner du [Vin]                    OK

regle([accompagner,_],[
                [1, [_],_ , Reponse ]], Question):-
                      get_plat(Question, Plat),!,
                      get_vin_acc(Plat, List),!,
                      set_liste_memo(List, Liste2),!,
                      format_vins(Liste2, Listevins),!,
                      Reponse=([['pour accompagner du ',Plat,' je vous suggere '],Listevins]).

regle([accompagner,_],[
                [1, [_],_ , Reponse ]], Question):-
                      not(get_plat(Question, _)),
                      Reponse = [['je suis confus, je ne trouve pas de vin correspondant']].

regle([plat,_],[
                [1, [_],_ , Reponse ]], Question):-
                      get_vin(Question, ID),!,
                      get_plats(ID,Liste),!,
                      format_plats(Liste,ListePlats),!,
                      Reponse=([['vous pouvez utiliser le ',ID,' avec les plats suivants : '],ListePlats]).


regle([plat,_],[
                [1, [_],_ , Reponse ]], Question):-
                      not(get_vin(Question, _)),
                      Reponse = [['je suis confus, je ne trouve pas de plat correspondant']].
