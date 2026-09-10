Dim As Integer pinCorreto, pinDigitado

pinCorreto = 4321

INPUT "Digite o PIN de acesso: ", pinDigitado

WHILE pinDigitado <> pinCorreto
    PRINT "PIN inválido. Tente novamente."
    INPUT "Digite o PIN de acesso: ", pinDigitado
WEND

PRINT "Transação autorizada!"
Sleep
