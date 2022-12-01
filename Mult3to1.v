module testMult3to1();
  reg [1:0]Selector;
  reg [7:0] In1,In2,In3;
  wire [7:0]Out;
  reg clock;
  
  initial begin
    Selector = 2'b00;
    clock = 0;
    In1 = 8'b11111111;
    In2 = 8'b01010101;
    In3 = 8'b00000000;
    
    #1 clock = 1; 
    #1 clock = 0; In1 = 8'b00000001;
    #1 clock = 1; Selector = 2'b01; 
    #1 clock = 0; In1 = 8'b10101010;  
    #1 clock =1; Selector =2'b10;
  
  end

  initial begin
      $display("             -------------- MULT 3-1 TEST --------------");
    $monitor("CLOCK:  %d, Selector: %d, Entrada1: %d, Entrada2: %d, Entrada3: %d, OUTPUT: %d",clock, Selector, In1,In2,In3,Out);
  end
  
  Mult3to1 teste(In1,In2,In3,Selector,Out,clock);
endmodule

module Mult3to1 (In1,In2,In3,Selector,Out, clock);
input [7:0] In1, In2,In3; //  8-bit inputs
input [1:0] Selector; // selector signal
input clock; // clock
output reg [7:0] Out; // 8-bit output

always @(posedge clock)

case (Selector) // a 3->1 multiplexor
0:  Out <= In1;
1:  Out <= In2;
2:  Out <= In3;
default: Out <= In1;

endcase

endmodule