module test5to8();
  reg clock;
  wire [7:0]Out;
  reg [4:0] In1;

  initial begin
    
    In1 = 5'b00001;
    clock = 0;
    
    #1 clock =1;
    #1 clock = 0 ; In1 = 5'b10000;
    #1 clock = 0;
    #1 clock = 1; In1 = 5'b11111;
  end
  
  initial begin
          $display("-------------- EXTENSOR 5 to 8 TEST --------------");
    $monitor("CLOCK: %d, In1: %b, Out: %b", clock, In1,Out);
    end
    extensor5to8 test(In1,clock,Out);
endmodule

module extensor5to8(In1, clock, Out);
  
  input [4:0]In1;
  input clock;
  output reg[7:0] Out;
  
  always@(posedge clock) begin
    assign Out = {3'b000,In1}; 
  end
  
endmodule
