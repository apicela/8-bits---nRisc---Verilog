module test3to8();
  reg clock;
  wire [7:0]Out;
  reg [2:0] In1;

  initial begin
    
    In1 = 3'b001;
    clock = 0;
    
    
    
    
    
  
  
  
  
  
  
  
endmodule

module extensor3to8(In1, clock, Out);
  
  input [2:0]In1;
  input clock;
  output reg[7:0] Out;
  
  always@(posedge clock) begin
    assign Out = {5'b00000,In1}; 
  end
  
endmodule