% ========================================================
% EXERCÍCIO 4: Linhagem
% ========================================================

% Fatos de Treinamento: treinou(Mestre, Discipulo)
treinou(sarutobi, jiraiya).
treinou(sarutobi, orochimaru).
treinou(sarutobi, tsunade).

treinou(jiraiya, minato).
treinou(jiraiya, naruto).
treinou(jiraiya, nagato).

treinou(minato, kakashi).

treinou(kakashi, naruto).
treinou(kakashi, sasuke).
treinou(kakashi, sakura).

treinou(naruto, boruto).
treinou(sasuke, boruto).

% Equivalência para mestre(Mestre, Discipulo)
mestre(M, D) :- treinou(M, D).

% 1. Crie a regra linhagem(Mestre, Discipulo), que define a cadeia de treinamento:
% Caso base: linhagem(M, D) é verdadeiro SE M for mestre de D.
linhagem(M, D) :- 
    mestre(M, D).

% Passo recursivo: linhagem(M, D) é verdadeiro SE M for mestre de um 
% intermediário Z E Z estiver na linhagem de D.
linhagem(M, D) :- 
    mestre(M, Z),
    linhagem(Z, D).

% 2. Query: quem faz parte da linhagem de Jiraiya (discípulos diretos ou indiretos)?
% Para executar no swipl ou terminal:
% ?- linhagem(jiraiya, Discipulo).
%
% Ou para listar sem duplicatas:
% ?- setof(D, linhagem(jiraiya, D), Discipulos).
%
% Resultados esperados na linhagem de Jiraiya:
% minato, naruto, nagato, kakashi, sasuke, sakura, boruto.
