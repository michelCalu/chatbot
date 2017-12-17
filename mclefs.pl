:- discontiguous nom/2.
:- discontiguous mclef/2.
:- discontiguous prix/2.
:- discontiguous bouche/2.
:- discontiguous nez/2.
:- discontiguous description/2.



/***********************************************/
% transformations fautes d'orthographe, typo, pluriel...
remplace(vins,vin).
remplace(vni,vin).
% TO DO
%************************************************/

% Mots-cle:
% 1 seul motclef(mot, poids) par mot à reconnaitre

mclef(bouche,10).
mclef(bonjour,1).

nom(beaumes_de_venise_2015,[beaumes,de,venise]).


notfound(X,
         [ [ 'je n ai pas la reponse' ],
    [ 'a cette question' ]
  ]).


bouche(beaumes_de_venise_2015,
  [ [ 'blablabl  aaaiiiiiiaa' ],
    [ 'blablablaaaaa blablablaaaaa' ],
    [ 'blablablaaaaa.' ]
  ]).


salutation(bonjour, [['bonjour a vous']]).
