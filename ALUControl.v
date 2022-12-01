module aluCONTROL_teste();
wire [0:0] HALT, MemRead, Branch, RegSrc, MemWrite,
ULASrc1, ULASrc2, RegWrite,SLT;
wire [1:0] BeqRegs;
wire [2:0] op;
reg [2:0] FuncCode;
reg clock;
initial begin
FuncCode = 3'b111;
clock = 1;
$display("");
$display(" - - - - - - - Starting Simulation :) - - - - - - - ");
#1 clock =0;
#1 clock = 1;FuncCode = 3'b000; $display("");
#1 clock = 0;
#1 clock = 1;FuncCode = 3'b001; $display("");
#1 clock = 0;
#1 clock = 1;FuncCode = 3'b010; $display("");
#1 clock = 0;
#1 clock = 1;FuncCode = 3'b011; $display("");
#1 clock = 0;
#1 clock = 1;FuncCode = 3'b100; $display("");
#1 clock = 0;
#1 clock = 1;FuncCode = 3'b101; $display("");
#1 clock = 0;
#1 clock = 1;FuncCode = 3'b110; $display("");
#1 clock = 0;
#1 clock = 1; FuncCode = 3'bxxx; $display("");
end
initial begin
$monitor("CLOCK:%d | FuncCode:%d | opALU:%d | HALT:%d | MemRead:%d | Branch:%d | RegSrc:%d | MemWrite:%d |
ULASrc1:%d | ULASrc2:%d | RegWrite:%d | SLT:%d ",clock,FuncCode,op, HALT, MemRead, Branch, RegSrc, MemWrite,
ULASrc1, ULASrc2, RegWrite,SLT);
end
ALUControl testando(FuncCode, op, clock, HALT, MemRead, Branch, RegSrc, MemWrite,ULASrc1, ULASrc2, RegWrite,
BeqRegs,SLT);
endmodule

module ALUControl( FuncCode, op, clock, HALT, MemRead, Branch, RegSrc, MemWrite,
ULASrc1, ULASrc2, RegWrite, BeqRegs,SLT);
input clock;
input [2:0] FuncCode;
output reg [2:0] op;
output reg [1:0] BeqRegs;
output reg [0:0]HALT, MemRead, Branch, RegSrc, MemWrite,ULASrc1, ULASrc2, RegWrite, SLT;
always@(posedge clock) begin
case (FuncCode)
0: begin
op =0; // add
HALT = 0;
MemRead = 1'bx;
Branch = 0;
RegSrc = 1;
MemWrite = 0;
ULASrc1 = 0;
ULASrc2 = 1;
RegWrite = 1;
SLT = 1;
BeqRegs = 0;
end
1:begin
op =0; // shift logical
HALT = 0;
MemRead = 1'bx;
Branch = 0;
RegSrc = 1;
MemWrite = 0;
ULASrc1 = 1;
ULASrc2 = 0;
RegWrite = 1;
SLT = 1;
BeqRegs = 0;
end
2:begin
op = 1;
HALT = 0;
MemRead = 1'bx;
Branch = 0;
RegSrc = 1'bx;
MemWrite = 1;
ULASrc1 = 1'bx;
ULASrc2 = 1'bx;
RegWrite = 1'bx;
SLT = 1'bx;
BeqRegs = 1'bx;
end
3:begin
op = 1'bx;
HALT = 0;
MemRead = 1;
Branch = 0;
RegSrc = 0;
MemWrite = 0;
ULASrc1 = 1'bx;
ULASrc2 = 1'bx;
RegWrite = 1;
SLT = 1;
BeqRegs = 1'bx;
end
4: begin
op <= 0;
HALT <= 0;
MemRead <= 1'bx;
Branch <= 0;
RegSrc <= 1;
MemWrite <= 0;
ULASrc1 <= 1;
ULASrc2 <= 1;
RegWrite <= 1;
SLT <= 1;
BeqRegs <= 0;
end
5:begin
op = 1'bx;
HALT = 0;
MemRead = 1'bx;
Branch = 1;
RegSrc = 1'bx;
MemWrite = 0;
ULASrc1 = 1'bx;
ULASrc2 = 1'bx;
RegWrite = 1'bx;
SLT = 1'bx;
BeqRegs = 0;
end
6: begin
op = 1'bx;
HALT = 0;
MemRead = 1'bx;
Branch = 0;
RegSrc = 2;
MemWrite = 0;
ULASrc1 = 1;
ULASrc2 = 1;
RegWrite = 1;
SLT = 0;
BeqRegs = 1;
end
7: begin
op = 1'bx;
HALT = 1;
MemRead = 1'bx;
Branch = 1'bx;
RegSrc = 1'bx;
MemWrite = 1'bx;
ULASrc1 = 1'bx;
ULASrc2 = 1'bx;
RegWrite = 1'bx;
SLT = 1'bx;
BeqRegs = 1'bx;
end
default: begin op = 1'bx;
HALT = 1;
MemRead = 1'bx;
Branch = 1'bx;
RegSrc = 1'bx;
MemWrite = 1'bx;
ULASrc1 = 1'bx;
ULASrc2 = 1'bx;
RegWrite = 1'bx;
SLT = 1'bx;
BeqRegs = 1'bx; // nao faz nada
end
endcase
end
endmodule


