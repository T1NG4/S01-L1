% ========================================================
% EXERCÍCIO 1: Aprendiz de Elite
% ========================================================

% Fatos de Mestres e Treinamentos: treinou(Mestre, Discipulo)
treinou(kakashi, naruto).
treinou(kakashi, sasuke).
treinou(kakashi, sakura).
treinou(jiraiya, naruto).
treinou(orochimaru, sasuke).
treinou(tsunade, sakura).

% 1. Sabendo que Boruto foi treinado por Sasuke e por Naruto, inclua esses fatos:
treinou(sasuke, boruto).
treinou(naruto, boruto).

% Fatos de Natureza de Chakra: natureza(Ninja, Elemento)
natureza(naruto, vento).
natureza(sasuke, fogo).
natureza(sasuke, raio).
natureza(kakashi, raio).
natureza(sakura, terra).
natureza(boruto, raio).
natureza(boruto, vento).

% Relação de discípulo: Ninja é discípulo de Mestre se Mestre o treinou
discipulo(Ninja, Mestre) :- 
    treinou(Mestre, Ninja).

% 2. Regra aprendiz_de_elite(Ninja):
% Verdadeira SE o Ninja for discípulo de kakashi OU de sasuke 
% E tiver natureza de chakra raio OU fogo.
aprendiz_de_elite(Ninja) :-
    (discipulo(Ninja, kakashi) ; discipulo(Ninja, sasuke)),
    (natureza(Ninja, raio) ; natureza(Ninja, fogo)).

% 3. Query: quem são os aprendizes de elite?
% Para executar no swipl ou terminal:
% ?- aprendiz_de_elite(Ninja).
%
% Resultados esperados:
% Ninja = sasuke ;
% Ninja = boruto.
