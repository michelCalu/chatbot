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

% règles diverses (motcle[#bonjour, #fin])
%
% Bonjour          OK
% Fin              OK

regle([bonjour,_],[
      	[1, X, _ , Reponse ]], Question):-
            salutation(bonjour,Reponse).

regle([fin,_],[
      	[1, X, _ , Reponse ]], Question):-
            salutation(fin,Reponse).

salutation(bonjour, [['bonjour a vous']]).
salutation(fin, [['au revoir']]).

% règle appelée quand aucun mot clé n'est reconnu (motcle[#notfound])

regle([notfound,_],[
            [1, [_], _, Reponse ]] , Question):-
               notfound(X,Reponse).

notfound(X,[[ 'je n\'ai pas compris la question' ]]).
