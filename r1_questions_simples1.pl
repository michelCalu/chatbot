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

% questions bouche (motcle[#bouche, #attaque, #longueur])
%
% Que donne le [vin] en bouche ?          OK
% Comment est le [vin] en bouche ?        OK
% Comment est l’attaque du [vin] ?        OK
% Parlez-moi de la longueur du [vin] ?    OK

regle([bouche,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      get_vin(Question, ID),
                      set_vin_memo(ID, bouche),
                      bouche(ID,Reponse).


regle([bouche,_],[
      	[1, [_],_ , Reponse ]], Question):-
                    get_vin(Question, ID),
                    not(bouche(ID,_)),
                    writeln('nous n avons pas encore cette information.'),
                    learn(ID,bouche_dyn),
                    Reponse = [['merci pour votre collaboration.']].

regle([bouche,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour bouche']].


% questions nez     (motcle[#nez, #aromes, #bouquet, #olfactives])
%
% Quel nez présente le [vin] ?                        OK
% Quels sont les arômes du [vin] ?                    OK
% Quel est le bouquet du [vin] ?                      OK
% Quelles sont les propriétés olfactives du [vin] ?   OK

regle([nez,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      get_vin(Question, ID),
                      set_vin_memo(ID, nez),
                      nez(ID,Reponse).

regle([nez,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour nez']].

% questions région  (motcle[#appellation, #region, #ou, #origine])
% Quelle est l’appellation du [vin] ?           OK
% De quelle région provient le [vin] ?          OK
% D’où provient le [vin] ?                      OK
% De quelle origine est le [vin] ?              OK

regle([region,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      get_vin(Question, ID),
                      !,
                      region(ID,Region),
                      set_vin_memo(ID, region),
                      Reponse=([['c est un vin de '],[Region]]).

regle([region,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      not(get_vin(Question, _)),
                      not(get_region(Question, _)),
                      Reponse = [['pas de vin ou de region correspondant']].

% questions prix        (motcle[#prix, #coute, #acheter])
%
% Quel est le prix du [vin] ?                         OK
% Combien coûte le [vin] ?                            OK
% Que coûte le [vin] ?                                OK
% À quelle prix puis-je acheter le [vin] ?            Pb si 2 mots clé: modifié en "a combien puis je acheter"

regle([prix,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      get_vin(Question, ID),
                      prix(ID,Prix),
                      nom(ID,Nom),
                      set_vin_memo(ID, prix),
                      Rep=([['le prix du'], Nom, ['est de '],[Prix],['Eur']]),
                      flatten(Rep,Rep2),                          %TO DO flatten pour éviter les \nl à l'affichage entre chaque sous liste
                      Reponse=([Rep2]).

regle([prix,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour prix']].

% questions description       (motcle[#parler, #decrivez, #presentez, #dire])
%
% Pouvez-vous me parler du [vin] ?                    OK
% Décrivez-moi le [vin] ?                             OK
% Présentez-moi le [vin] ?                            OK
% Que pouvez-vous me dire au sujet du [vin] ?         OK

regle([description,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      get_vin(Question, ID),
                      set_vin_memo(ID, description),
                      description(ID, Reponse).

regle([description,_],[
        	[1, [_],_ , Reponse ]], Question):-
                      not(get_vin(Question, ID)),
                      Reponse = [['pas de vin correspondant pour description']].
