:- style_check(-singleton).
:- [base_connaissance].
:- [r0_autres_regles].
:- [r1_questions_simples1].
:- [r2_questions_simples2].
:- [r3_questions_accompagnement].
:- [r5_learning].
:- [util_conversion].
:- [util_liste_mots].
:- [util_recherche].
:- [util_affichage].
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
         trouver_motcle(Q_Simplifiee,MotsCle, 0),
         trier_motcle(MotsCle,TriMotsCle),
         !,
         reset_debut(TriMotsCle),
         print('DEBUG mots trouves:'),writeln(TriMotsCle),        % debug
         lister_regles(TriMotsCle, Q, Reponse).


% reset_debut
% si mot clé autre, ou si on est appelé depuis la regle "autre", on ne fait rien.
% Sinon on reset le depart à 1
% pour stopper la mémorisation du point de début de l'affichage d'une liste.
%

reset_debut(Liste) :-
    member([autre,6],Liste),!,
    writeln(Pas_reset).
    
reset_debut(_) :-
    nb_getval(memory,X),
    X<1.

reset_debut(_) :-
    nb_setval(depart,1),
    writeln(reset).



/***************************************************************************/
% trouver_motcle(Input, ListeDeMotsClé)
%     récupère les [motclé,Poids] présents dans Input
%     in: {mots d'Input}
%     out: {[motclé1, poids1], [motclé2,poids2],...}
%           ou {[unknown,99]} si pas de motclé
%
%trouver_motcle([],[], X):- X>0.

trouver_motcle([],[[notfound,1]], _).

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
trier_motcle(Liste,ListeTriee):-
    sort(2,@>=,Liste,ListeTriee).

/**************************************************************************/
% lister_regles(LmotsTriés, Question, Réponse)
%     itère sur la liste de motsclé triée
%           - unifie avec une règle de forme regle(motclé, [ID,Pattern,Count,Reponse], Question)
%           - retourne Reponse si
%                 - match(Question, Pattern) et conditions de la règle réussi(ssen)t
%
lister_regles([[notfound,99]], Question, Reponse):-
       regle([notfound,99],[[ID,Pattern,Count,Reponse]], Question),
       print('DEBUG: regle utilisee:'),writeln([notfound,99]).

lister_regles([[M,_]|Rest],  Question, Reponse):-
       regle([M,_],[[ID,Pattern,Count,Reponse]], Question),
       print('DEBUG: regle utilisee:'),writeln([[M],[Pattern]]), !.

lister_regles([[M,_]|Rest],  Question, Reponse):-
       not(regle([M,_],[[ID,Pattern,Count,Reponse]], Question)),

       lister_regles(Rest, Question, Reponse).

lister_regles([], _, _).


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
   nb_setval(old_question,[]),
   nb_setval(depart,1),
   retractall( bouche_dyn(X,Y) ),           %Debug: clears learned predicates on startup
   retractall( nez_dyn(X,Y)),
   repeat,
      write('Vous : '),
      nb_setval(memory,1),
      lire_question(L_Mots),
      produire_reponse(L_Mots,L_ligne_reponse),
      ecrire_reponse(L_ligne_reponse),
      memorise(L_Mots),
   fin(L_Mots), !.

% -------------------------------------------------------------------------
% Si memory est à 1, on mémorise la question dans old_question
% Si memory est à 0, on vient de la règle "autre", et on ne doit rien faire

memorise(Liste) :-
    nb_getval(memory,A),
    A>0,
    nb_setval(old_question,Liste).
    
memorise(_).


/* --------------------------------------------------------------------- */
/*                                                                       */
/*             ACTIVATION DU PROGRAMME APRES COMPILATION                 */
/*                                                                       */
/* --------------------------------------------------------------------- */

%     :- grandgousier.        === program start ==
