function filtrarMaiores(tabela, limite)
    local filtrados = {}

    for i = 1, #tabela do
        if tabela[i] > limite then
            filtrados[#filtrados + 1] = tabela[i]
        end
    end

    return filtrados
end

io.write("Digite a quantidade de elementos (N): ")
local N = tonumber(io.read())

local tabela = {}

for i = 1, N do
    io.write("Digite o elemento " .. i .. ": ")
    tabela[i] = tonumber(io.read())
end

io.write("Digite o valor limite (K): ")
local K = tonumber(io.read())

local maiores = filtrarMaiores(tabela, K)

print("--- Elementos maiores que " .. K .. " ---")
for i = 1, #maiores do
    print(maiores[i])
end
