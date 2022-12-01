# 8-bits---nRisc---Verilog

<h1># Lista de instruções suportadas pelo processador.</h1> <br />
ADDI: Realizará uma soma entre um registrador e um imediato e registrará o resultado no
mesmo registrador.<br />
SL: Realizará um shift lógico para a esquerda ou direita de até 3 casas de um registrador e
registrará o resultado no mesmo registrador. (multiplicação ou divisão)<br />
SW: Armazena o valor de um registrador no endereço escrito em imediato.<br />
LW: Carrega em um registrador o valor do endereço buscado por um imediato.<br />
J: Realiza um jump de até 5 bits para uma linha do código.<br />
BEQ: Sempre compara igualdade entre $s1 e $0. Se for, dará um salto para o label informado com bit de sinal (máx 15 linhas).<br />
SLT: Retornará 1 em $s1 se o primeiro reg. da sintaxe for realmente menor que o segundo reg. . Caso contrário, será retornado 0 em $s1.<br />
HALT: Finaliza a ciclagem do programa.<br />

#Sintaxe em Assembly

ADDI $t0, im<br />
ADDI $t0(reg qualquer), im(im se refere a valor de um imediato).<br />
SL $t0, im, x<br />
SL $t0(reg qualquer), im (imediato 0 ou 1 → 0: direita; 1: esquerda), x (shift amount)<br />
SW $t0, im<br />
SW $t0(reg. de saída), im(imediato que indica o endereço de salvamento)<br />
LW $t0, im<br />
LW $t0(reg. destino), im(imediato que indica o endereço de busca)<br />
J im<br />
J im (imediato que diz nº da linha de destino)<br />
BEQ label<br />
BEQ label (imediato que indica deslocamento com bit de sinal para chegar ao label).<br />
SLT $t0,$t1<br />
SLT $t0 (reg de número teoricamente menor), $t1 (reg de número teoricamente maior)<br />
HALT<br />

#Sintaxe em binário

Registradores disponíveis:<br />
$0 → 00<br />
$t0 → 01<br />
$t1 → 10<br />
$s1 → 11<br />
Instruções em binário:<br />
ADDI 000(op) | 2 bits(reg somador e destino) | 3 bits (imediato)<br />
SL 001(op) | 2 bits (reg de entrada e destino) 1 bit (0 esquerda e 1 direita) | 2 bits (shift
amount)<br />
SW 010(op) | 2 bits (reg de envio) | 3 bits (imediato de endereço destino)<br />
LW 011(op) | 2 bits (reg destino) | 3 bits (imediato de endereço de busca)<br />
J 100(op) | 5 bits (nº da linha)<br />
BEQ 101(op) | 5 bits (offset com bit de sinal)<br />
SLT 110(op) | 2 bits (parâmetro menor) 2 bits (parâmetro maior)→ reg1 < reg2? $s1 = 1:0) | 1 bit desconsiderável<br />
HALT 111(op) | 5 bits desconsiderável<br />
