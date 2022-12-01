module memBank(Read1,clock,MemRead,MemWrite,Data, Value);
input [7:0] Read1; // leitura do valor do dado de reg1
intput [7:0] Value; // leitura do valor de 3 bits convertido pra 8
output [7:0] Data; // saída para o mux de 3
intput MemWrite, MemRead;
always begin @(posedge clock)
if (MemWrite)
assign Read1 = RF[Value];
else if(MemRead)
RF[Data] <= Read1; // a saída para o MIPS recebe o valor do dado de reg1
end
endmodule
