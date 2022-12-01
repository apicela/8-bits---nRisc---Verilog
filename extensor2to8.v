module test2to8();
  reg clock;
  wire [7:0]Out;
  reg [1:0] In1;

  initial begin
    
    In1 = 2'b01;
    clock = 0;
    
    
    
    
    
  
  
  
  
  
  
  
endmodule

module extensor2to8(In1, clock, Out);
  
  input [1:0]In1;
  input clock;
  output reg[7:0] Out;
  
  always@(posedge clock) begin
    assign Out = {6'b000000,In1}; 
  end
  
endmodule