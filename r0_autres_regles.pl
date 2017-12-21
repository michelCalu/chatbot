:- multifile regle/2.

/***********************************************/
% pattern de génération de réponse
%

regle([bonjour,1],[
      	[1, X, 0 , Reponse ]
               ]):- salutation(X,Reponse).

regle([fin,1],[
     	[1, X, 0 , Reponse ]
              ]):- aurevoir(X,Reponse).



regle([notfound,99],[
            [1, [X], 0, Reponse ]
            ]):- notfound(X,Reponse).


salutation(bonjour, [['bonjour a vous']]).

 aurevoir(fin, [['au revoir']]).
