:- style_check(-singleton).
:- [base_connaissance].
:- [r0_autres_regles].
:- [r1_questions_simples1].
:- [r2_questions_simples2].
:- [r3_questions_accompagnement].
:- [r4_memorisation].
:- [r5_learning].
:- [util_conversion].
:- [util_liste_mots].
:- [util_recherche].
:- [util_affichage].
:- [util_memorisation].
:- dynamic bouche_dyn/2.
:- dynamic nez_dyn/2.

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
         simplify(Q,Q_Simplifiee),
         trouver_motcle(Q_Simplifiee,MotsCle),
         trier_motcle(MotsCle,TriMotsCle),
         !,
         %print('DEBUG question:'),writeln(Q_Simplifiee),
         %print('DEBUG mots trouves:'),writeln(TriMotsCle),
         lister_regles(TriMotsCle, Q, Reponse).


/***************************************************************************/
% trouver_motcle(Input, ListeDeMotsClé)
%     récupère les [motclé,Poids] présents dans Input
%     in: {mots d'Input}
%     out: {[motclé1, poids1], [motclé2,poids2],...,[notfound,1]}
%

trouver_motcle([],[[notfound,1]]).

trouver_motcle([H|T],[[H,P]|R]):-
            mclef(H,P),
            trouver_motcle(T,R).

trouver_motcle([H|T],R):-
            not(mclef(H,_)),
            trouver_motcle(T,R).

/***************************************************************************/
% trier_motcle(Liste, ListeTriee)
%     trie une liste de mots-clé par poids
%     in: liste Liste de mots-clé avec leurs poids}
%     out: liste triée ListeTriee par poids du plus grand au plus petit
%

trier_motcle(Liste,ListeTriee):-
    sort(2,@>=,Liste,ListeTriee).

/**************************************************************************/
% lister_regles(LmotsTriés, Question, Réponse)
%     itère sur la liste de motsclé triée
%           - unifie avec une règle de forme regle(motclé, [ID,Pattern,Count,Reponse], Question)
%           - retourne Reponse si
%                 - match(Question, Pattern) et conditions de la règle réussi(ssen)t

lister_regles([[M,_]|Rest],  Question, Reponse):-
       regle([M,_],[[ID,Pattern,Count,Reponse]], Question).
       %print('DEBUG: regle utilisee:'),writeln([[M],[Pattern]]), !, nl.

lister_regles([[M,_]|Rest],  Question, Reponse):-
       not(regle([M,_],[[ID,Pattern,Count,Reponse]], Question)),
       lister_regles(Rest, Question, Reponse).

lister_regles([], _, _).

/**********************************************************/
% match(Input, Pattern)
%     matche Input par rapport à un Pattern
%     si un pattern contient une variable Variable, celle-ci contiendra les mots
%     correspondants
%     ex: match([a,b,c,d,e], [X,b,c,d,e]). X=[a], true.

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

/**********************************************************/
% group(Var, InputWords, NextWord, RestInputWords)
%     in: le prochain terme à matcher est une Var
%     out: tous les mots d'input jusqu'au prochain mot sont groupés dans Var
%     ex: ex: match([a,b,c,d,e], [a,X,e]). X=[b,c,d], true.%

group([], [Nextw|Rest], Nextw, [Nextw|Rest] ):-
    !.
group([H|T],[H|Tinput],Nextw,Rest):-
    H\=Nextw,
    !,
    group(T,Tinput,Nextw,Rest).


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
   nb_setval(vin_memo, vin_prop(empty,[])),
   nb_setval(liste_memo, []),
   retractall( bouche_dyn(X,Y) ),           %Debug: clears learned predicates on startup
   retractall( nez_dyn(X,Y)),
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
