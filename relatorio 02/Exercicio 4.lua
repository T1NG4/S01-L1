function calcularMedia(a, b)
    return (a + b) / 2
end

function encontrarMaior(a, b)
    if a > b then
        return a
    else
        return b
    end
end

function calcularDiferencaAbsoluta(a, b)
    if a > b then
        return a - b
    else
        return b - a
    end
end

function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        return calcularMedia(n1, n2)
    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)
    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)
    else
        return "Operação inválida!"
    end
end

io.write("Digite o primeiro número: ")
local n1 = tonumber(io.read())

io.write("Digite o segundo número: ")
local n2 = tonumber(io.read())

io.write('Digite a operação ("media", "maior" ou "diferenca"): ')
local operacao = io.read()

local resultado = analisarNumeros(n1, n2, operacao)
print("Resultado: " .. resultado)
