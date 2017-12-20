:- multifile regle/2.

% questions bouche
%
% Que donne le [vin] en bouche ?
% Comment est le [vin] en bouche ?
% Comment est l’attaque du [vin] ?
% Parlez-moi de la longueur du [vin] ?

regle([bouche,5],[
        	[1, [que, donne, le, X, en, bouche],0 , Reponse ]
                 ]):- nom(ID, X),
                      bouche(ID,Reponse).
regle([bouche,5],[
      	[1, [comment, est, le, X, en, bouche],0 , Reponse ]
               ]):- nom(ID, X),
                    bouche(ID,Reponse).

regle([bouche,5],[
      	[1, [comment, est, l, attaque, du, X ],0 , Reponse ]
               ]):- nom(ID, X),
                    bouche(ID,Reponse).

regle([bouche,5],[
      	[1, [parlez, moi, de, la, longueur, du, X],0 , Reponse ]
               ]):- nom(ID, X),
                    bouche(ID,Reponse).

% questions nez
%
% Quel nez présente le [vin] ?
% Quels sont les arômes du [vin] ?
% Quel est le bouquet du [vin] ?
% Quelles sont les propriétés olfactives du [vin] ?

% questions région
%
% Quelle est l’appellation du [vin] ?
% De quelle région provient le [vin] ?
% D’où provient le [vin] ?
% De quelle origine est le [vin] ?

% questions prix
%
% Quel est le prix du [vin] ?
% Combien coûte le [vin] ?
% Que coûte le [vin] ?
% À quelle prix puis-je acheter le [vin] ?

% questions description
%
% Pouvez-vous me parler du [vin] ?
% Décrivez-moi le [vin] ?
% Présentez-moi le [vin] ?
% Que pouvez-vous me dire au sujet du [vin] ?
