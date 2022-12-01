module instructionMemory(inputInstruction, clock, output)
input [7:0] inputInstruction;
output [7:0] output;
always begin @(posedge clock)
output <= inputInstruction;
end
endmodule
