% ========================================================
% EXERCÍCIO 2: Ninja Versátil
% ========================================================

% Fatos de Vilas: vila(Ninja, Vila)
vila(naruto, konoha).
vila(sasuke, konoha).
vila(sakura, konoha).
vila(kakashi, konoha).
vila(boruto, konoha).
vila(gaara, areia).
vila(temari, areia).
vila(kankuro, areia).

% Fatos de Natureza de Chakra: natureza(Ninja, Elemento)
natureza(naruto, vento).
natureza(sasuke, fogo).
natureza(sasuke, raio).
natureza(kakashi, raio).
natureza(kakashi, terra).
natureza(kakashi, agua).
natureza(sakura, terra).
natureza(boruto, raio).
natureza(boruto, vento).
natureza(gaara, terra).
natureza(gaara, vento).

% 1. Crie a regra ninja_versatil(Ninja), verdadeira SE o Ninja
% tiver pelo menos duas naturezas de chakra associadas no banco
% de dados E for da vila konoha.
% Dica do enunciado: teste natureza(Ninja, X) e natureza(Ninja, Y) com X \= Y.
ninja_versatil(Ninja) :-
    vila(Ninja, konoha),
    natureza(Ninja, X),
    natureza(Ninja, Y),
    X \= Y.

% 2. Query: quem é (são) o(s) ninja(s) versátil(eis)?
% Para executar no swipl ou terminal:
% ?- ninja_versatil(Ninja).
%
% Ou para evitar respostas duplicadas causadas por permutações de X e Y:
% ?- distinct(Ninja, ninja_versatil(Ninja)).
%
% Resultados esperados (em Konoha com 2+ elementos):
% sasuke, kakashi, boruto.
