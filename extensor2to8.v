module test2to8();
  reg clock;
  wire [7:0]Out;
  reg [1:0] In1;

  initial begin
    
    In1 = 2'b01;
    clock = 0;
    
    #1 clock =1;
    #1 clock = 0 ; In1 = 2'b01;
    #1 clock = 0;
    #1 clock = 1; In1 = 2'b00;
  end
  
  initial begin
          $display("-------------- EXTENSOR 2 to 8 TEST --------------");
    $monitor("CLOCK: %d, In1: %b, Out: %b", clock, In1,Out);
    end
    extensor2to8 test(In1,clock,Out);
endmodule

module extensor2to8(In1, clock, Out);
  
  input [1:0]In1;
  input clock;
  output reg[7:0] Out;
  
  always@(posedge clock) begin
    assign Out = {6'b000000,In1}; 
  end
  
endmodule
