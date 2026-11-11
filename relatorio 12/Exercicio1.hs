-- EXERCÍCIO 1: O Café do Leblanc

-- 1. Definição do tipo Cafe com campos posicionais (sem chaves): nome, preço e intensidade
data Cafe = Cafe String Double Int

-- 2. Função descrever: retorna texto com nome e preço usando pattern matching no parâmetro e show
descrever :: Cafe -> String
descrever (Cafe nome preco _) = "Café: " ++ nome ++ " - Preço: R$ " ++ show preco

-- 3. Função forca: retorna a força do café usando guards
forca :: Cafe -> String
forca (Cafe _ _ intensidade)
    | intensidade >= 8 = "Forte"
    | intensidade >= 5 = "Equilibrado"
    | otherwise        = "Suave"

-- 4. Função precoDoPedido: calcula o preço com ou sem leite usando if ... then ... else
precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
    if comLeite
        then preco + 2.0
        else preco

-- 5. Função main: cria três cafés (um em cada faixa), exibe descrição/força e preços
main :: IO ()
main = do
    -- Três cafés à escolha, um em cada faixa de intensidade:
    let cafeSuave       = Cafe "Leblanc Suave" 7.50 3
    let cafeEquilibrado = Cafe "Leblanc Blend" 9.00 6
    let cafeForte       = Cafe "Leblanc Especial" 11.00 9

    -- Exibição da descrição e força de cada um com putStrLn
    putStrLn (descrever cafeSuave)
    putStrLn ("Força: " ++ forca cafeSuave)
    putStrLn ""

    putStrLn (descrever cafeEquilibrado)
    putStrLn ("Força: " ++ forca cafeEquilibrado)
    putStrLn ""

    putStrLn (descrever cafeForte)
    putStrLn ("Força: " ++ forca cafeForte)
    putStrLn ""

    -- Exibição com print do preço de um deles com e sem leite
    putStrLn "Preço do Café Leblanc Blend:"
    putStr "Sem leite: "
    print (precoDoPedido False cafeEquilibrado)
    putStr "Com leite: "
    print (precoDoPedido True cafeEquilibrado)

