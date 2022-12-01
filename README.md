# 8-bits---nRisc---Verilog

# Lista de instruções suportadas pelo processador.<br />
ADDI: Realizará uma soma entre um registrador e um imediato e registrará o resultado no
mesmo registrador.
SL: Realizará um shift lógico para a esquerda ou direita de até 3 casas de um registrador e
registrará o resultado no mesmo registrador. (multiplicação ou divisão)
SW: Armazena o valor de um registrador no endereço escrito em imediato.
LW: Carrega em um registrador o valor do endereço buscado por um imediato.
J: Realiza um jump de até 5 bits para uma linha do código.
BEQ: Sempre compara igualdade entre $s1 e $0. Se for, dará um salto para o label
informado com bit de sinal (máx 15 linhas).
SLT: Retornará 1 em $s1 se o primeiro reg. da sintaxe for realmente menor que o segundo
reg. . Caso contrário, será retornado 0 em $s1.
HALT: Finaliza a ciclagem do programa.

#Sintaxe em Assembly

ADDI $t0, im
ADDI $t0(reg qualquer), im(im se refere a valor de um imediato).
SL $t0, im, x
SL $t0(reg qualquer), im (imediato 0 ou 1 → 0: direita; 1: esquerda), x (shift amount)
SW $t0, im
SW $t0(reg. de saída), im(imediato que indica o endereço de salvamento)
LW $t0, im
LW $t0(reg. destino), im(imediato que indica o endereço de busca)
J im
J im (imediato que diz nº da linha de destino)
BEQ label
BEQ label (imediato que indica deslocamento com bit de sinal para chegar ao label).
SLT $t0,$t1
SLT $t0 (reg de número teoricamente menor), $t1 (reg de número teoricamente maior)
HALT

#Sintaxe em binário

Registradores disponíveis:
$0 → 00
$t0 → 01
$t1 → 10
$s1 → 11
Instruções em binário:
ADDI 000(op) | 2 bits(reg somador e destino) | 3 bits (imediato)
SL 001(op) | 2 bits (reg de entrada e destino) 1 bit (0 esquerda e 1 direita) | 2 bits (shift
amount)
SW 010(op) | 2 bits (reg de envio) | 3 bits (imediato de endereço destino)
LW 011(op) | 2 bits (reg destino) | 3 bits (imediato de endereço de busca)
J 100(op) | 5 bits (nº da linha)
BEQ 101(op) | 5 bits (offset com bit de sinal)
SLT 110(op) | 2 bits (parâmetro menor) 2 bits (parâmetro maior)→ reg1 < reg2? $s1 = 1:0) |
1 bit desconsiderável
HALT 111(op) | 5 bits desconsiderável
