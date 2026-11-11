-- EXERCÍCIO 2: As Entregas da Kiki

-- 1. Definição fora da main do pesoMaximo que a vassoura aguenta (em kg)
pesoMaximo :: Double
pesoMaximo = 10.0

-- 7. Demonstração de imutabilidade: redefinir gera erro de compilação
-- pesoMaximo = 15.0

-- 2. Definição do tipo Encomenda com campos nomeados (record syntax)
data Encomenda = Encomenda
    { destinatario :: String
    , peso         :: Double
    , frete        :: Double
    } deriving (Show)

-- 3. Função descrever: usa as funções de campo nomeadas (destinatario e, ...)
descrever :: Encomenda -> String
descrever e = "Destinatário: " ++ destinatario e ++ " | Peso: " ++ show (peso e) ++ " kg | Frete: R$ " ++ show (frete e)

-- 4. Função cabemNaVassoura: usa filter com lambda para peso <= pesoMaximo
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura = filter (\e -> peso e <= pesoMaximo)

-- 5. Função totalDeFretes: soma os fretes usando map e sum
totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

-- 6. Função main
main :: IO ()
main = do
    -- Lista com pelo menos 4 encomendas, algumas com peso > pesoMaximo
    let encomendas =
            [ Encomenda { destinatario = "Osono (Padaria Gütiokipänja)", peso = 3.5,  frete = 15.00 }
            , Encomenda { destinatario = "Tombo",                         peso = 2.0,  frete = 10.00 }
            , Encomenda { destinatario = "Senhora idosa (Torta de Peixe)", peso = 12.0, frete = 40.00 }
            , Encomenda { destinatario = "Pintora Ursula",                peso = 15.5, frete = 50.00 }
            , Encomenda { destinatario = "Garota do Aniversário",          peso = 5.0,  frete = 22.50 }
            ]

    let validas = cabemNaVassoura encomendas

    -- Exibição de todas as encomendas com mapM_
    putStrLn "=== Todas as Encomendas ==="
    mapM_ (putStrLn . descrever) encomendas

    -- Exibição apenas das que cabem na vassoura com mapM_
    putStrLn "\n=== Encomendas que Cabem na Vassoura ==="
    mapM_ (putStrLn . descrever) validas

    -- Exibição do total de fretes das encomendas que cabem
    putStrLn "\n=== Total de Fretes (Entregas Válidas) ==="
    putStrLn ("R$ " ++ show (totalDeFretes validas))

