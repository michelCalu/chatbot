:- multifile regle/2.

/***********************************************/
% règles diverses (réponses non relatives a un vin)
%

regle([bonjour,1],[
      	[1, X, 0 , Reponse ]], Question):-
            salutation(bonjour,Reponse).

regle([fin,1],[
      	[1, X, 0 , Reponse ]], Question):-
            salutation(fin,Reponse).

% règle appelée quand aucun mot clé n'est reconnu
regle([notfound,1],[
            [1, [_], 0, Reponse ]] , Question):-
               notfound(X,Reponse).

notfound(X,[
      [ 'pas reconnu de mot cle' ],
      [ '...' ],
      [ 'pred. notfound 1 activated']          %debug
  ]).

salutation(bonjour, [['bonjour a vous']]).
salutation(fin, [['au revoir']]).
