:- multifile regle/2.

% questions bouche (motcle[#bouche, #attaque, #longueur])
%
% Que donne le [vin] en bouche ?          OK
% Comment est le [vin] en bouche ?        OK
% Comment est l’attaque du [vin] ?        OK
% Parlez-moi de la longueur du [vin] ?    OK

regle([bouche,5],[
        	[1, [bouche,X],0 , Reponse ]
                 ]):- nom(ID, X),
                      bouche(ID,Reponse).

regle([bouche,5],[
        	[1, [Y, le, X, en, bouche],0 , Reponse ]
                 ]):- nom(ID, X),
                      bouche(ID,Reponse).

regle([bouche,5],[
      	[1, [Y, du, X, en, bouche],0 , Reponse ]
               ]):- nom(ID, X),
                    bouche(ID,Reponse).

regle([attaque,5],[
      	[1, [Y, attaque, du, X],0 , Reponse ]
               ]):- nom(ID, X),
                    bouche(ID,Reponse).

regle([longueur,5],[
      	[1, [Y, longueur, du, X],0 , Reponse ]
               ]):- nom(ID, X),
                    bouche(ID,Reponse).

% questions nez     (motcle[#nez, #aromes, #bouquet, #olfactives])
%
% Quel nez présente le [vin] ?                        OK
% Quels sont les arômes du [vin] ?                    OK
% Quel est le bouquet du [vin] ?                      OK
% Quelles sont les propriétés olfactives du [vin] ?   OK

regle([nez,5],[
        	[1, [Z,nez,Y,le,X],0 , Reponse ]
                 ]):- nom(ID, X),
                      nez(ID,Reponse).

regle([aromes ,5],[
      	[1, [Y,aromes,du,X],0 , Reponse ]
               ]):- nom(ID, X),
                    nez(ID,Reponse).
regle([bouquet ,5],[
    	[1, [Y,bouquet,du,X],0 , Reponse ]
             ]):- nom(ID, X),
                  nez(ID,Reponse).
regle([olfactives ,5],[
      	[1, [Y,proprietes,olfactives,du,X],0 , Reponse ]
               ]):- nom(ID, X),
                    nez(ID,Reponse).


% questions région  (motcle[#appellation, #region, #ou, #origine])
% Quelle est l’appellation du [vin] ?           OK
% De quelle région provient le [vin] ?          OK
% D’où provient le [vin] ?                      OK
% De quelle origine est le [vin] ?              OK

% PROBLEME si 2 mots cle dans la question: ex: de quelle région provient le X?

regle([appellation,5],
                  [ [1, [Y,appellation,du,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  region(ID,Region),
                  Reponse=([['c est un vin de '],[Region]]).

regle([provient,5],
                  [ [1, [Y,provient,le,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  region(ID,Region),
                  Reponse=([['c est un vin de '],[Region]]).

regle([region,5],
                  [ [1, [W,region,Y,le,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  region(ID,Region),
                  Reponse=([['c est un vin de '],[Region]]).

regle([origine,5],
                  [ [1, [Y,origine,du,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  region(ID,Region),
                  Reponse=([['c est un vin de '],[Region]]).




% questions prix        (motcle[#prix, #coute, #acheter])
%
% Quel est le prix du [vin] ?                         OK
% Combien coûte le [vin] ?                            OK
% Que coûte le [vin] ?                                OK
% À quelle prix puis-je acheter le [vin] ?            Pb si 2 mots clé: modifié en "a combien puis je acheter"
regle([prix,5],
                  [ [1, [Y,prix,du,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  prix(ID,Prix),
                  Reponse=([['le prix est de '],[Prix],['EUR']]).

regle([coute,5],
                  [ [1, [Y,coute,le,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  prix(ID,Prix),
                  Reponse=([['le prix est de '],[Prix],['EUR']]).

regle([acheter,5],
                  [ [1, [Y,acheter,le,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  prix(ID,Prix),
                  Reponse=([['le prix est de '],[Prix],['EUR']]).



% questions description       (motcle[#parler, #decrivez, #presentez, #dire])
%
% Pouvez-vous me parler du [vin] ?
% Décrivez-moi le [vin] ?
% Présentez-moi le [vin] ?
% Que pouvez-vous me dire au sujet du [vin] ?

regle([parler,5],
                  [ [1, [Y,parler,du,X ],0 , Reponse ] ]):-
                  nom(ID, X),
                  description(ID, Reponse).

regle([decrivez,5],
                  [ [1, [decrivez,Y,le,X ],0 , Reponse ] ]):-
                        nom(ID, X),
                        description(ID, Reponse).

regle([presentez,5],
                  [ [1, [presentez,Y,le,X ],0 , Reponse ] ]):-
                        nom(ID, X),
                        description(ID, Reponse).

regle([dire,5],
                  [ [1, [Y, dire,au,sujet,du,X ],0 , Reponse ] ]):-
                        nom(ID, X),
                        description(ID, Reponse).
