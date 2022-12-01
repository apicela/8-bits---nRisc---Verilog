module testMult2to1();
  reg clock, Selector;
  reg [7:0] In1,In2;
  wire [7:0]Out;
  
  initial begin
    Selector = 1'b0;
    clock = 0;
    In1 = 8'b11111111;
    In2 = 8'b01010101;
    
    #1 clock = 1; In1 = 8'b00000000;
    #1 clock = 0; 
    #1 clock = 1; Selector = 1'b1; 
    #1 clock = 0; In1 = 8'b10101010;  
    #1 clock =1; Selector =1'b0;
  
  end

  initial begin
      $display("             -------------- MULT 2-1 TEST --------------");
    $monitor("CLOCK:  %d, Selector: %d, Entrada1: %d, Entrada2: %d, OUTPUT: %d",clock, Selector, In1,In2,Out);
  end
  
  Mult2to1 teste(In1,In2,Selector,Out,clock);
endmodule

module Mult2to1 (In1,In2,Selector,Out, clock);
input [7:0] In1, In2; //  8-bit inputs
input [0:0] Selector; // selector signal
input clock; // clock
output reg [7:0] Out; // 8-bit output

always @(posedge clock)

case (Selector) // a 2->1 multiplexor
0:  Out <= In1;
1:  Out <= In2;

default: Out <= In1;

endcase

endmodule