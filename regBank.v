module regBank(Read1,Read2,WriteReg,WriteData,
RegWrite,Data1,Data2,clock);
input [1:0] Read1,Read2,WriteReg; // o numero dos registradores a serem lidos
input [7:0] WriteData; // dado a ser escrito
input RegWrite,clock;
output [7:0] Data1, Data2; // o valor dos registradores lidos
reg [7:0] RF [7:0]; // 32 registers array each bits long
assign Data1 = RF[Read1];
assign Data2 = RF[Read2];
always begin // escreve sempre que reg write = 1
@(posedge clock)
if (RegWrite)
RF[WriteReg] <= WriteData;
end
endmodule
