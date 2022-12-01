module testeula();
reg[2:0] op;
reg [7:0] entrada1;
reg [7:0] entrada2;
reg controle, clock;
wire [7:0] saida;
wire Zero;
initial begin
entrada1 = 8'b00001010; // valor do primeiro registrador: 10
entrada2 = 8'b00001010; // valor do segundo registrador: 10
op = 3'b000; // op inicial, operaçao addi/add
clock =0;
controle = 1; // se controle = 1 durante op code =1, shift a esquerda (multiplica)
#1 clock =1;
#1 clock = 0; entrada2 = 8'b00000010;
#1 clock = 1; op = 3'b001;
#1 clock = 0;
#1 op = 3'b001; clock = 1; controle =0; // se controle diferente de 1, shift a direita(divisao)
#1 clock = 0;
#1 op = 3'b000; entrada1=8'b00000001; clock = 1;
end
initial begin
$monitor("Time: %0d | clock:%d | OP:%d | entrada1:%d | entrada2:%d ||||||| saida:%d | Zero:%d",
$time,clock,op,entrada1,entrada2,saida,Zero);
end
ALU ULAdosPRO(entrada1,entrada2,op,saida,Zero,controle,clock);
endmodule


module ALU(entrada1,entrada2,op,saida,Zero, controle, clock);
input[2:0] op;
input [7:0] entrada1;
input [7:0] entrada2;
output reg [7:0] saida;
output Zero;
input controle,clock;
assign Zero = ((entrada1-entrada2)==0);
always@(posedge clock) begin
case(op)
0: saida <=entrada1+ entrada2; // funçao addi / add
1: if (controle) begin
saida <= entrada1<<entrada2; // funçao shift a esquerda
end
else begin
saida <= entrada1 >> entrada2; // funçao shift a direita
end
1: saida <= entrada1<<entrada2; // funçao shift a esquerda
default: saida <=0;
endcase
end
endmodule
