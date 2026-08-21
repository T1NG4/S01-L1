PRINT "Calculo da meta diaria de agua"
PRINT

INPUT "Digite o peso (kg): ", peso
INPUT "Digite a quantidade de agua ingerida (ml): ", aguaIngerida

meta = peso * 35

PRINT
PRINT "Meta recomendada:"; meta; "ml"

IF aguaIngerida >= meta THEN
    PRINT "Meta atingida!"
ELSE
    PRINT "Meta não atingida"
END IF
sleep
