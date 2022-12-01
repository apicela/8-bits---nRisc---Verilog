module testeADD();
  reg [7:0] In1,In2;
  reg clock;
  wire [7:0]Out;
  
  initial begin
    
    In1 = 8'b00000001;
    In2 = 8'b11111110;
    clock =0;
    
    #1 clock =1;
    #1 clock = 0;
    #1 clock = 1; In2 = 8'b10101010;
    #1 clock = 0;
  end
    initial begin
      $display("             -------------- ADD TEST --------------");
    $monitor("CLOCK:  %d, Entrada1: %d, Entrada2: %d, OUTPUT: %d",clock, In1,In2,Out);
  end
  ADD teste(In1,In2,Out,clock); 
endmodule

module ADD(In1,In2,Out,clock);

input [7:0] In1,In2;
output reg [7:0] Out;
input clock;

always@(posedge clock) begin
assign Out = In1+In2;
end

endmodule
