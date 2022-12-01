module PC (clock, InPC, OutPC);
input clock;
input [7:0] InPC;
output [7:0] OutPC;
reg[7:0] PC = 8'b0000000;
always @(posedge clock)
begin
PC = InPC;
end
assign OutPC = PC;
endmodule
