% ========================================================
% EXERCÍCIO 3: Rivais de Treino
% ========================================================

% Fatos de Treinamento: treinou(Mestre, Discipulo)
treinou(kakashi, naruto).
treinou(kakashi, sasuke).
treinou(kakashi, sakura).
treinou(jiraiya, naruto).
treinou(jiraiya, minato).
treinou(orochimaru, sasuke).
treinou(tsunade, sakura).
treinou(sasuke, boruto).
treinou(naruto, boruto).

% Fatos de Clã: cla(Ninja, Cla)
cla(naruto, uzumaki).
cla(sasuke, uchiha).
cla(sakura, haruno).
cla(kakashi, hatake).
cla(boruto, uzumaki).
cla(sarada, uchiha).
cla(hinata, hyuga).
cla(neji, hyuga).

% 1. Crie a regra rivais(A, B), verdadeira SE A e B tiverem
% o mesmo mestre, NÃO forem o mesmo ninja E pertencerem a clãs diferentes.
rivais(A, B) :-
    treinou(Mestre, A),
    treinou(Mestre, B),
    A \= B,
    cla(A, ClaA),
    cla(B, ClaB),
    ClaA \= ClaB.

% 2. Query: quem é (são) o(s) rival(is) de Naruto?
% Para executar no swipl ou terminal:
% ?- rivais(naruto, Rival).
%
% Resultados esperados:
% Rival = sasuke ;
% Rival = sakura.
