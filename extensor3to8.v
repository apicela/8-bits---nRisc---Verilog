module test3to8();
  reg clock;
  wire [7:0]Out;
  reg [2:0] In1;

  initial begin
    
    In1 = 3'b001;
    clock = 0;
    
    #1 clock =1;
    #1 clock = 0 ; In1 = 3'b100;
    #1 clock = 0;
    #1 clock = 1; In1 = 3'b111;
  end
  
  initial begin
          $display("-------------- EXTENSOR 3 to 8 TEST --------------");
    $monitor("CLOCK: %d, In1: %b, Out: %b", clock, In1,Out);
    end
    extensor3to8 test(In1,clock,Out);
endmodule

module extensor3to8(In1, clock, Out);
  
  input [2:0]In1;
  input clock;
  output reg[7:0] Out;
  
  always@(posedge clock) begin
    assign Out = {5'b00000,In1}; 
  end
  
endmodule
