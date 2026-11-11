-- EXERCÍCIO 3: O Caderno de Esboços

-- 1. Definição do tipo Esboco com campos nomeados
data Esboco = Esboco
    { titulo  :: String
    , tecnica :: String
    , horas   :: Int
    } deriving (Show)

-- 2. Função esbocoMaisRecente com pattern matching (lista vazia e (e:_))
esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "Aviso: O caderno está vazio."
esbocoMaisRecente (e:_) = "Título: " ++ titulo e ++ " | Técnica: " ++ tecnica e

-- 3. Função contarEsbocos com recursão (sem usar length)
contarEsbocos :: [Esboco] -> Int
contarEsbocos []     = 0
contarEsbocos (_:xs) = 1 + contarEsbocos xs

-- 4. Função horasDesenhando com recursão (sem usar sum nem map)
horasDesenhando :: [Esboco] -> Int
horasDesenhando []     = 0
horasDesenhando (e:xs) = horas e + horasDesenhando xs

-- 5. Função main
main :: IO ()
main = do
    -- Caderno com pelo menos três esboços (a cabeça é o mais recente)
    let caderno1 =
            [ Esboco { titulo = "Dragão de Cinzas",    tecnica = "Carvão",  horas = 5 }
            , Esboco { titulo = "Ruínas Esquecidas",   tecnica = "Nanquim", horas = 8 }
            , Esboco { titulo = "Catedral Abandonada", tecnica = "Grafite", horas = 4 }
            ]

    -- Exibição do esboço mais recente, quantidade e total de horas
    putStrLn "=== Caderno de Esboços ==="
    putStrLn ("Esboço mais recente: " ++ esbocoMaisRecente caderno1)
    putStrLn ("Número de esboços: " ++ show (contarEsbocos caderno1))
    putStrLn ("Total de horas desenhando: " ++ show (horasDesenhando caderno1) ++ " horas")
    putStrLn ""

    -- Exibição do esboço mais recente de um caderno vazio ([])
    putStrLn "=== Caderno Vazio ==="
    putStrLn ("Esboço mais recente: " ++ esbocoMaisRecente [])
    putStrLn ""

    -- 6. Criação de um novo caderno adicionando um esboço na frente com o operador :
    let novoEsboco = Esboco { titulo = "Criatura da Floresta", tecnica = "Nanquim", horas = 6 }
    let caderno2   = novoEsboco : caderno1

    putStrLn "=== Comparação dos Cadernos (Imutabilidade com operador :) ==="
    putStrLn ("Novo Caderno - Mais recente: " ++ esbocoMaisRecente caderno2)
    putStrLn ("Novo Caderno - Quantidade: " ++ show (contarEsbocos caderno2))
    putStrLn ""
    putStrLn ("Caderno Anterior - Mais recente: " ++ esbocoMaisRecente caderno1)
    putStrLn ("Caderno Anterior - Quantidade: " ++ show (contarEsbocos caderno1))
    putStrLn "(O caderno anterior permaneceu inalterado)"
    putStrLn ""

    -- 7. Teste de erro com head em lista vazia (transformado em comentário)
    -- O comando abaixo geraria erro de execução: "Prelude.head: empty list"
    -- putStrLn (titulo (head ([] :: [Esboco])))

