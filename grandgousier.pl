:- style_check(-singleton).
:- [base_connaissance].
:- [r0_autres_regles].
:- [r1_questions_simples1].
:- [r2_questions_simples2].
:- [conversion_util].

/* --------------------------------------------------------------------- */
/*                                                                       */
/*        PRODUIRE_REPONSE(L_Mots,L_Lignes_reponse) :                    */
/*                                                                       */
/*        Input : une liste de mots L_Mots representant la question      */
/*                de l'utilisateur                                       */
/*        Output : une liste de liste de lignes correspondant a la       */
/*                 reponse fournie par le bot                            */
/*                                                                       */
/* --------------------------------------------------------------------- */


produire_reponse(Q,Reponse) :-
         trouver_motcle(Q,MotsCle, 0),
         trier_motcle(MotsCle, TriMotsCle),
         !,
         lister_regles(TriMotsCle,ReglesApplicables, Q, Reponse).


/***************************************************************************/
% trouver_motcle(Input, ListeDeMotsClé)
%     récupère les [motclé,Poids] présents dans Input
%     in: {mots d'Input}
%     out: {[motclé1, poids1], [motclé2,poids2],...}
%           ou {[unknown,99]} si pas de motclé
%
trouver_motcle([],[], 1).

trouver_motcle([],[[notfound,99]], 0).

trouver_motcle([H|T],[[H,P]|R], Nb):-
            mclef(H,P),
            NewNb is Nb + 1,
            trouver_motcle(T,R, NewNb).
trouver_motcle([H|T],R, Nb):-
            not(mclef(H,_)),
            trouver_motcle(T,R, Nb).

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
lister_regles([[notfound,99]], [[ID,Pattern,Count,Reponse]|T], Question, Reponse):-
       regle([notfound,99],[[ID,Pattern,Count,Reponse]]).

lister_regles([[M,_]|Rest], [[ID,Pattern,Count,Reponse]|T], Question, Reponse):-
       regle([M,_],[[ID,Pattern,Count,Reponse]]),
       flatten(Pattern, Regle2),
       match(Question,Regle2),
       lister_regles(Rest,T, Question, Reponse).

lister_regles([], [], Question, Reponse).








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

%     :- grandgousier.        === program start ==
