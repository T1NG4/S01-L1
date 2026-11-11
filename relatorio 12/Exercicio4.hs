-- EXERCÍCIO 4: A Casa de Banhos da Yubaba

-- 1. Tipo Etapa com opções NaFila, NoBanho e Concluido, derivando Show e Eq
data Etapa = NaFila | NoBanho | Concluido deriving (Show, Eq)

-- 2. Tipo Atendimento com campos nomeados (record syntax)
data Atendimento = Atendimento
    { cliente :: String
    , servico :: String
    , valor   :: Double
    , etapa   :: Etapa
    } deriving (Show)

-- 3. Função descrever: retorna cliente, serviço e etapa (usando show na etapa)
descrever :: Atendimento -> String
descrever a = "Cliente: " ++ cliente a ++ " | Serviço: " ++ servico a ++ " | Valor: R$ " ++ show (valor a) ++ " | Etapa: " ++ show (etapa a)

-- 4. Função concluir: retorna um atendimento atualizado com etapa = Concluido usando sintaxe de cópia de registro
concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

-- 5. Função arrecadado: soma o valor apenas dos atendimentos concluídos
-- Usa filter com lambda comparando a etapa com ==, depois map e sum
arrecadado :: [Atendimento] -> Double
arrecadado atendimentos = sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

-- 6 e 7. Função main
main :: IO ()
main = do
    -- 6. Três atendimentos à escolha, nenhum concluído
    let a1 = Atendimento { cliente = "Sem Rosto (No-Face)",           servico = "Banho de Ervas Revigorante",      valor = 150.0, etapa = NoBanho }
    let a2 = Atendimento { cliente = "Espírito do Rio Fedorento",     servico = "Banho Profundo de Purificação",   valor = 300.0, etapa = NoBanho }
    let a3 = Atendimento { cliente = "Espírito Rabanete (Oshira-sama)", servico = "Banho Aromático Simples",         valor = 80.0,  etapa = NaFila }

    let listaOriginal = [a1, a2, a3]

    -- Criação de uma lista nova onde alguns (mas não todos) passam por concluir
    let listaAtualizada = [concluir a1, a2, concluir a3]

    -- 7. Exibição das duas listas com mapM_ e valor arrecadado em cada uma
    putStrLn "=== Atendimentos Iniciais (Lista Original) ==="
    mapM_ (putStrLn . descrever) listaOriginal
    putStrLn ("Total Arrecadado: R$ " ++ show (arrecadado listaOriginal))
    putStrLn ""

    putStrLn "=== Atendimentos Atualizados (Lista Nova com Conclusões) ==="
    mapM_ (putStrLn . descrever) listaAtualizada
    putStrLn ("Total Arrecadado: R$ " ++ show (arrecadado listaAtualizada))
    putStrLn ""

    putStrLn "=== Verificação da Lista Original (Imutabilidade em Haskell) ==="
    mapM_ (putStrLn . descrever) listaOriginal
    putStrLn ("Total Arrecadado original permanece: R$ " ++ show (arrecadado listaOriginal))

