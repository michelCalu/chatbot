/* --------------------------------------------------------------------- */
/*                                                                       */
/*        PRODUIRE_REPONSE(L_Mots,L_Lignes_reponse) :                    */
/*                                                                       */
/*        Input : une liste de mots L_Mots representant la question      */
/*                de l'utilisateur                                       */
/*        Output : une liste de liste de lignes correspondant a la       */
/*                 reponse fournie par le bot                            */
/*                                                                       */
/*        NB Pour l'instant le predicat retourne dans tous les cas       */
/*            [  [je, ne, sais, pas, '.'],                               */
/*               [les, etudiants, vont, m, '\'', aider, '.'],            */
/*               ['vous le verrez !']                                    */
/*            ]                                                          */
/*                                                                       */
/*        Je ne doute pas que ce sera le cas ! Et vous souhaite autant   */
/*        d'amusement a coder le predicat que j'ai eu a ecrire           */
/*        cet enonce et ce squelette de solution !                       */
/*                                                                       */
/* --------------------------------------------------------------------- */
:- style_check(-singleton).
:- [mclefs].
:- [regles].
:- [conversion_util].
:- use_module(library(random)).


/*                      !!!    A MODIFIER   !!!                          */


produire_reponse([fin],[L1]) :-
   L1 = [merci, de, m, '\'', avoir, consulte], !.

produire_reponse([bonjour],[L1]) :-
      L1 = [bonjour,'!'], !.


produire_reponse(Q,Rep) :-
         trouver_motcle(Q,MotsCle),
         trier_motcle(MotsCle, TriMotsCle),
         !,
         lister_regles(TriMotsCle,ReglesApplicables),
         %match(Q,ReglesApplicables),
         sel_reponse(ReglesApplicables,Rep).

/***************************************************************************/
% trouver_motcle(Input, ListeDeMotsClé)
%     récupère les [motclé,Poids] présents dans Input
%
trouver_motcle([],[]).
trouver_motcle([H|T],[[H,P]|R]):-
            mclef([H,P]),!,
            trouver_motcle(T,R).
trouver_motcle([H|T],R):-
            not(mclef(H)),
            trouver_motcle(T,R).
trouver_motcle([L],[notfound]):-
            length(L)==1,
            not(mclef(L)).

/***************************************************************************/
% trier_motcle(Liste, ListeTriée)
%     trie une liste de mots-clé par poids
%
trier_motcle([],[]).

trier_motcle(L,Res):-
    sort(2,@<,L,Res).

/**************************************************************************/
% lister_regles(LmotsTriés, RèglesApplicables)
%     ajoute dans RèglesApplicables toutes les règles contenant un mot
%     de LmotsTriés en index
%
lister_regles([[M|_]|Rest], [[ID,Regle,Count,Reponse]|T]):-
      % match([Input],[Regle]),
       regle([M,_],[[ID,Regle,Count,Reponse]]),
       lister_regles(Rest,T).

lister_regles([], [[ID,Regle,Count,Reponse]|T]):-
       regle([],[[ID,Regle,Count,Reponse]]).

/**************************************************************************/
% sel_reponse(ListeDereponsesApplicables, Reponse)
%
sel_reponse([[IDpattern,Pattern,Count,Reponse]|T], [Reponse]):-!,
      Count==0.

/**********************************************************/
% match(Input, Pattern)
%     matches Input Vs a Pattern
%     if pattern contains a Variable, Variable will hold matching words
%     ex: match([a,b,c,d,e], [X,b,c,d,e]). X=[a], true.
% group(Var, InputWords, NextWord, RestInputWords)
%     in: le prochain terme à matcher est une Var
%     out: tous les mots d'input jusqu'au prochain mot sont groupés dans Var
%     ex: ex: match([a,b,c,d,e], [a,X,e]). X=[b,c,d], true.
%
match([], []):-!.

match(Input, [Pattern]) :-
    is_list(Input),
    var(Pattern),
    !,
    Pattern = Input.

match(InputWords, [Var,NextWord|Rest]) :-
    is_list(InputWords),
    var(Var),
    !,
    nonvar(NextWord),
    group(Var,InputWords,NextWord,RestInputWords),
    match(RestInputWords, [NextWord|Rest]).

match([NextInputWord|RestInput], [NextInputWord|RestPattern]) :-
      !,
      match(RestInput, RestPattern).

group([], [Nextw|Rest], Nextw, [Nextw|Rest] ):-
    !.
group([H|T],[H|Tinput],Nextw,Rest):-
    H\=Nextw,
    !,
    group(T,Tinput,Nextw,Rest).

/*****************************************************************************/
% nom_vins_uniforme( [liste mots], [liste unifiee])
%
nom_vins_uniforme(Lmots,L_mots_unif) :-
      L1 = Lmots,
      replace_vin([beaumes,de,venise,2015],beaumes_de_venise_2015,L1,L2),
      replace_vin([les,chaboeufs,2013],les_chaboeufs_2013,L2,L3),
      L_mots_unif = L3.

replace_vin(L,X,In,Out) :-
      append(L,Suf,In), !, Out = [X|Suf].
replace_vin(_,_,[],[]) :- !.
replace_vin(L,X,[H|In],[H|Out]) :-
      replace_vin(L,X,In,Out).


/* --------------------------------------------------------------------- */
/*                                                                       */
/*                            TEST DE FIN                                */
/*                                                                       */
/* --------------------------------------------------------------------- */

fin(L) :- member(fin,L).


/* --------------------------------------------------------------------- */
/*                                                                       */
/*                         BOUCLE PRINCIPALE                             */
/*                                                                       */
/* --------------------------------------------------------------------- */

grandgousier :-

   nl, nl, nl,
   write('Bonjour, je suis Grandgousier, GGS pour les intimes,'), nl,
   write('conseiller en vin. En quoi puis-je vous etre utile ?'),
   nl, nl,

   repeat,
      write('Vous : '),
      lire_question(L_Mots),
      produire_reponse(L_Mots,L_ligne_reponse),
      ecrire_reponse(L_ligne_reponse),
   fin(L_Mots), !.


/* --------------------------------------------------------------------- */
/*                                                                       */
/*             ACTIVATION DU PROGRAMME APRES COMPILATION                 */
/*                                                                       */
/* --------------------------------------------------------------------- */

:- grandgousier.
