:- multifile regle/2.

/***********************************************/
% règles diverses (réponses non relatives a un vin)
%

regle([bonjour,1],[
      	[1, X, 0 , Reponse ]], Question):-
            salutation(_,Reponse).


% règle appelée quand aucun mot clé n'est reconnu
regle([notfound,99],[
            [1, [_], 0, Reponse ]] , Question):-
               notfound(X,Reponse).

notfound(X,[
      [ 'pas reconnu de mot cle' ],
      [ '...' ],
      [ 'pred. notfound 99 activated']          %debug
  ]).

salutation(bonjour, [['bonjour a vous']]).
