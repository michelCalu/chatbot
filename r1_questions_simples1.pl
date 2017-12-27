:- multifile regle/3.

prefix(X, L) :- append(X, _, L).
suffix(X, L) :- append(_, X, L).
sublist(X, L) :- suffix(S, L), prefix(X, S).

/*sublist([], _).
sublist([X|XS], [X|XSS]) :- sublist(XS, XSS).
sublist([X|XS], [_|XSS]) :- sublist([X|XS], XSS).*/

get_vin(L_mots, ID) :-
  sublist(Nom_Vin, L_mots),
  nom(ID, Nom_Vin).

/***********************************************/
% Série de règles.
% Format:
%     regle( [motclé,poids], [Id, [pattern de question], Compteur, [Réponse au pattern]], Question)
%     in: Question posée
%     out: retourne Reponse si:
%           match  (pattern,  Question) ET (autres condition(s) réussie(s))
%
%           Nb: conservé X,Y,Z... dans les pattern --> debug plus facile.
%           à remplacer par _ en fin de projet
%

% questions bouche (motcle[#bouche, #attaque, #longueur])
%
% Que donne le [vin] en bouche ?          OK
% Comment est le [vin] en bouche ?        OK
% Comment est l’attaque du [vin] ?        OK
% Parlez-moi de la longueur du [vin] ?    OK

regle([bouche,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID),
                      bouche(ID,Reponse).

regle([bouche,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour bouche']].

% questions nez     (motcle[#nez, #aromes, #bouquet, #olfactives])
%
% Quel nez présente le [vin] ?                        OK
% Quels sont les arômes du [vin] ?                    OK
% Quel est le bouquet du [vin] ?                      OK
% Quelles sont les propriétés olfactives du [vin] ?   OK

regle([nez,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID),
                      nez(ID,Reponse).

regle([nez,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour nez']].

% questions région  (motcle[#appellation, #region, #ou, #origine])
% Quelle est l’appellation du [vin] ?           OK
% De quelle région provient le [vin] ?          OK
% D’où provient le [vin] ?                      OK
% De quelle origine est le [vin] ?              OK

regle([region,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID),
                      !,
                      region(ID,Region),
                      Reponse=([['c est un vin de '],[Region]]).

regle([region,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      not(get_vin(Question, _)),
                      not(get_region(Question, _)),
                      Reponse = [['pas de vin ou de region correspondant']].

% questions prix        (motcle[#prix, #coute, #acheter])
%
% Quel est le prix du [vin] ?                         OK
% Combien coûte le [vin] ?                            OK
% Que coûte le [vin] ?                                OK
% À quelle prix puis-je acheter le [vin] ?            Pb si 2 mots clé: modifié en "a combien puis je acheter"

regle([prix,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID),
                      prix(ID,Prix),
                      Reponse=([['le prix est de '],[Prix],['EUR']]).

regle([prix,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour prix']].

% questions description       (motcle[#parler, #decrivez, #presentez, #dire])
%
% Pouvez-vous me parler du [vin] ?                    OK
% Décrivez-moi le [vin] ?                             OK
% Présentez-moi le [vin] ?                            OK
% Que pouvez-vous me dire au sujet du [vin] ?         OK

regle([description,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      get_vin(Question, ID),
                      description(ID, Reponse).

regle([description,5],[
        	[1, [_],0 , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour description']].
